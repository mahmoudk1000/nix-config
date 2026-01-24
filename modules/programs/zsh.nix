{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs = {
    command-not-found.enable = false;
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
      }}";
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
      dotDir = "${config.xdg.configHome}/zsh";
      syntaxHighlighting = {
        enable = true;
        highlighters = [
          "main"
          "brackets"
          "cursor"
          "pattern"
          "line"
        ];
        patterns = {
          "rm -rf *" = "fg=red,bg=default,bold";
        };
        styles = {
          builtin = "fg=blue";
          command = "fg=green";
          alias = "fg=green";
          path = "fg=yellow,underline";
          commandseparator = "fg=cyan,bold";
          redirection = "fg=cyan";
          autodirectory = "fg=blue";
          history-expansion = "fg=green";
          single-hyphen-option = "fg=magenta";
          double-hyphen-option = "fg=yellow";
        };
      };
      historySubstringSearch = {
        enable = true;
        searchUpKey = [
          "^[[A"
          "^[OA"
        ];
        searchDownKey = [
          "^[[B"
          "^[OB"
        ];
      };
      history = {
        path = "$HOME/.zsh_history";
        size = 10000;
        share = true;
        extended = true;
        ignoreSpace = true;
        ignoreDups = true;
        expireDuplicatesFirst = true;
        ignorePatterns = [
          "ls *"
          "rm *"
          "kill *"
          "exit *"
          "pkill *"
        ];
      };
      plugins = [
        {
          name = "zsh-nix-shell";
          src = pkgs.zsh-nix-shell;
          file = "share/zsh-nix-shell/nix-shell.plugin.zsh";
        }
        {
          name = "zsh-autopair";
          src = pkgs.zsh-autopair;
          file = "share/zsh/zsh-autopair/autopair.zsh";
        }
      ];
      localVariables = {
        KEYTIMEOUT = "1";
        ZSH_AUTOSUGGEST_USE_ASYNC = "true";
        ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE = 40;
        ZSH_AUTOSUGGEST_STRATEGY = [
          "history"
          "completion"
        ];
      };
      shellAliases = lib.mkMerge [
        {
          o = "xdg-open";
          l = "eza";
          c = "clear";
          q = "exit";
          v = "nvim";
          "v." = "nvim .";
          m = "ncmpcpp";

          ".." = "cd -- ..";
          "..." = "cd -- ../..";
          "...." = "cd -- ../../..";
          ".2" = "cd -- ../..";
          ".3" = "cd -- ../../..";
          ".4" = "cd -- ../../../..";
          ".5" = "cd -- ../../../../..";
          ".6" = "cd -- ../../../../../..";

          pwdcp = "pwd | tr -d '\n' | xclip -sel c";
          tree = "eza --tree --icons --tree";

          us = "systemctl --user";
          rs = "sudo systemctl";
        }

        (lib.mkIf config.programs.git.enable {
          g = "lazygit";
          gb = "git branch -v";
          ga = "git add";
          glg = "git log";
          gl = "git clone";
          gs = "git status --short";
          gaa = "git add --all";
          gc = "git commit --verbose";
          gco = "git checkout";
          gcp = "git cherry-pick";
          gcm = "git commit --verbose -m ";
          gca = "git commit --amend --no-edit";
          gcae = "git commit --amend";
          gp = "git push";
          pp = "!git push origin $(git rev-parse --abbrev-ref HEAD)";
          gpl = "git pull";
          pl = "!git pull origin $(git rev-parse --abbrev-ref HEAD)";
          grbc = "git rebase --continue";
          gff = "git diff --minimal";
          hist = ''git log --pretty=format:"%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(reset)" --graph --date=relative --decorate --all'';
          llog = ''git log --graph --name-status --pretty=format:"%C(red)%h %C(reset)(%cd) %C(green)%an %Creset%s %C(yellow)%d%Creset" --date=relative'';
        })

        (lib.mkIf config.programs.devops.enable {
          kb = "kubectl";
          kbd = "kubectl describe";
          kbe = "kubectl edit";
          kbg = "kubectl get";
          kbgp = "kubectl get pods";
          kbgd = "kubectl get deployments";
          kbgns = "kubectl get namespaces";
          kbgs = "kubectl get services";
          kbgn = "kubectl get nodes";
          kbgi = "kubectl get ingress";
          kbl = "kubectl logs";
          kba = "kubectl apply -f";
          kbdel = "kubectl delete";
          kbex = "kubectl exec -it";
          kbcx = "kubie ctx";
          kbns = "kubie ns";
        })

        {
          nix = "noglob nix";
          nixos-rebuild = "noglob nixos-rebuild";
          cleanup = "sudo nix-collect-garbage --delete-older-than 1d";
          listgen = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";
          bloat = "nix path-info -Sh /run/current-system";
        }
      ];
      shellGlobalAliases = lib.mkIf config.programs.bat.enable {
        "-h" = "-h 2>&1 | bat --language=help --style=plain";
        "--help" = "--help 2>&1 | bat --language=help --style=plain";
      };
      initContent = ''
        autoload -Uz promptinit; promptinit

        command_not_found_handler() {
          echo -e "nope, \e[31m'$0'\e[0m didn't work."; return 127
        }

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
        bindkey '^R'            history-incremental-search-backward
        bindkey '^r'            fzf-history-widget
        bindkey -M vicmd 'k'    history-substring-search-up
        bindkey -M vicmd 'j'    history-substring-search-down

        # Completion
        zstyle ':completion:*' menu select
        zstyle ':completion:*:matches' group yes
        zstyle ':completion:*:descriptions' format '%B%F{yellow}=> %d%f'
        zstyle ':completion:*:messages' format '%B%F{purple}» %d%f'
        zstyle ':completion:*:warnings' format '%B%F{red}No matches for:%f %d%b'
        zstyle ':completion:::::' completer _complete _approximate
        zstyle ':completion:*:corrections' format '%B%F{green}=~ %d%f'
        zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}
        zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
        zstyle ':completion:*' group-name '''
        zstyle ':completion:*' use-cache on
        zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/.zcompcache
        zstyle ':completion:*' special-dirs ..
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
        typeset -g HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=true
        typeset -g HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="bg=default,fg=blue,bold"
        typeset -g HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="bg=default,fg=red,bold,underline"

        # Custom Autosuggestion Setting
        typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"

        sudo-command-line() {
          [[ -z $BUFFER ]] && zle up-history
          [[ $BUFFER != sudo\ * ]] && BUFFER="sudo $BUFFER"
          zle end-of-line
        }
        zle -N sudo-command-line
        bindkey '\e\e' sudo-command-line
      '';
      profileExtra = ''
        if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
          startx -- :0
        fi
      '';
      dirHashes = {
        doc = "${config.home.homeDirectory}/docs";
        vid = "${config.home.homeDirectory}/videos";
        dwn = "${config.home.homeDirectory}/download";
        msk = "${config.home.homeDirectory}/musik";
        dot = "${config.home.homeDirectory}/.config";
        pjt = "${config.home.homeDirectory}/labbi/projects";
      };
    };
  };
}
