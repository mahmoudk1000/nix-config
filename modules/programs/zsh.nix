{ config
, pkgs
, ...
}:

{
  programs = {
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableZshIntegration = true;
    };
    dircolors = {
      enable = true;
      enableZshIntegration = true;
      extraConfig = builtins.readFile "${pkgs.fetchurl {
          url = "https://github.com/arcticicestudio/nord-dircolors/raw/addb3b427e008d23affc721450fde86f27566f1d/src/dir_colors";
          sha256 = "sha256-hlezTQqouVKbxgQBxtZU4en0idDiTCRJtFGH6XYFmtc=";
        } 
      }";
    };
    zsh = {
      enable = true;
      autosuggestion = {
        enable = true;
        highlight = "fg=8,bg=default";
      };
      enableCompletion = true;
      enableVteIntegration = true;
      autocd = true;
      completionInit = "autoload -U compinit && compinit";
      defaultKeymap = "viins";
      dotDir = ".config/zsh";
      syntaxHighlighting = {
        enable = true;
        highlighters = [ "main" "brackets" "cursor" ];
        patterns = {
          "rm -rf *" = "fg=red,bg=default,bold";
        };
        styles = {
          alias = "fg=purple";
          globbing = "fg=yellow";
        };
      };
      historySubstringSearch = {
        enable = true;
        searchUpKey = [ "^[[A" "^[OA" ];
        searchDownKey = [ "^[[B" "^[OB" ];
      };
      history = {
        path = "$HOME/.zsh_history";
        size = 10000;
        share = true;
        extended = true;
        ignoreSpace = true;
        ignoreDups = true;
        expireDuplicatesFirst = true;
        ignorePatterns = [ "ls *" "rm *" "kill *" "exit *" "pkill *" ];
      };
      plugins = [
        {
          name = "zsh-nix-shell";
          src = pkgs.zsh-nix-shell;
          file = "share/zsh-nix-shell/nix-shell.plugin.zsh";
        }
        {
          name = "zsh-vi-mode";
          src = pkgs.zsh-vi-mode;
          file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
        }
        {
          name = "zsh-autopair";
          src = pkgs.zsh-autopair;
          file = "share/zsh/zsh-autopair/autopair.zsh";
        }
      ];
      localVariables = {
        KEYTIMEOUT = "1";
        ZSH_AUTOSUGGEST_USE_ASYNC = true;
        ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE = 40;
        ZSH_AUTOSUGGEST_STRATEGY = [ "history" "completion" ];
      };
      shellAliases = {
        reload = "exec zsh";
        open = "xdg-open";
        free = "free -h";
        c = "clear";

        ".." = "cd ..";
        "..." = "cd ../..";
        l = "eza";

        v = "nvim";
        sv = "sudo nvim";

        g = "git";
        ga = "git add";
        glg = "git log";
        gl = "git clone";
        gs = "git status --short";
        gaa = "git add --all";
        gcp = "git cherry-pick";
        gcm = "git commit --verbose -m ";
        gca = "git commit --amend";
        gpl = "git pull";
        gp = "git push";
        gff = "git diff --minimal";

        mk = "ncmpcpp";

        cleanup = "sudo nix-collect-garbage --delete-older-than 3d";
        bloat = "nix path-info -Sh /run/current-system";
      };
      sessionVariables = {
        "EDITOR" = "nvim";
        "BROWSER" = "firefox";
      };
      initExtra = ''
        autoload -Uz promptinit; promptinit
        eval "$(starship init zsh)"

        # Keybinds
        bindkey '^ '            autosuggest-accept
        bindkey '^a'            beginning-of-line
        bindkey '^[[5~'         beginning-of-line
        bindkey '^e'            end-of-line
        bindkey '^[[6~'	        end-of-line
        bindkey '^[[1;5C'       forward-word
        bindkey '^[[1;5D'       backward-word
        bindkey '^f'            forward-char
        bindkey '^b'            backward-char
        bindkey '^w'            backward-kill-word
        bindkey '^R'            fzf-history-widget
        bindkey '^r'            history-incremental-search-backward
        bindkey -M vicmd 'k'    history-substring-search-up
        bindkey -M vicmd 'j'    history-substring-search-down

        # Completion
        zstyle ':completion:*' menu select

        zstyle ':completion:*:matches' group yes
        zstyle ':completion:*:descriptions' format '%B%F{yellow}=> %d%f'
        zstyle ':completion:*:messages' format '%B%F{purple}» %d%f'
        zstyle ':completion:*:warnings' format '%B%F{red}No matches for:%f %d%b'
        zstyle ':completion:::::' completer _expand _complete _ignored _approximate
        zstyle ':completion:*:corrections' format '%B%F{green}=~ %d%f'
        zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}
        zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
        zstyle ':completion:*' group-name '''
        zstyle ':completion:*' use-cache on
        zstyle ':completion:*' cache-path ~/.zsh_cache

        zstyle ':completion:*:approximate:*' max-errors 1 numeric
        zstyle ':completion:*:functions' ignored-patterns '_*'
        zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=01=31"
        zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -A -o pid,user,cmd'

        zmodload zsh/complist

        setopt extendedglob
        setopt APPEND_HISTORY
        setopt HIST_FIND_NO_DUPS
        setopt HIST_SAVE_NO_DUPS
        setopt HIST_VERIFY
        setopt INC_APPEND_HISTORY
        setopt HIST_REDUCE_BLANKS

        zle -N history-substring-search-up
        zle -N history-substring-search-down

        # Custom History-Substring-Search Setting
        typeset -g HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
        typeset -g HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="bg=default,fg=blue,bold"
        typeset -g HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="bg=default,fg=red,bold,underline"

        # Command Not Found Msg
        command_not_found_handler() {
          echo -e "nope, \e[31m'$0'\e[0m didn't work."; return 1
        }
      '';
      profileExtra = ''
        if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
          startx
        fi
      '';
      dirHashes = {
        doc = "${config.home.homeDirectory}/docs";
        vid = "${config.home.homeDirectory}/videos";
        dwn = "${config.home.homeDirectory}/download";
        msk = "${config.home.homeDirectory}/musik";
      };
    };
  };
}
