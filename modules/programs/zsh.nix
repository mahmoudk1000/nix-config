{ config, pkgs, theme, ... }:

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
            enableAutosuggestions = true;
            enableCompletion = true;
            enableSyntaxHighlighting = true;
            enableVteIntegration = true;
            autocd = true;
            completionInit = "autoload -U compinit && compinit";
            historySubstringSearch = {
                enable = true;
                searchUpKey = "^[OA";
                searchDownKey = "^[OB";
            };
            history = {
                path = "$HOME/.zsh_history";
                size = 10000;
                share = true;
                extended = true;
                ignoreSpace = true;
                ignoreDups = true;
                expireDuplicatesFirst = true;
                ignorePatterns = [ "ls" "rm" "kill" "exit" "pkill" ];
            };
            plugins = [
                {
                    name = "zsh-nix-shell";
                    file = "nix-shell.plugin.zsh";
                    src = pkgs.fetchFromGitHub {
                        owner = "chisui";
                        repo = "zsh-nix-shell";
                        rev = "v0.5.0";
                        sha256 = "0za4aiwwrlawnia4f29msk822rj9bgcygw6a8a6iikiwzjjz0g91";
                    };
                }
                {
                    name = "zsh-vi-mode";
                    src = pkgs.zsh-vi-mode;
                    file = "${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
                }
            ];
            localVariables = {
                KEYTIMEOUT = "1";
                ZSH_AUTOSUGGEST_USE_ASYNC = true;
                ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE = 40;
                ZSH_AUTOSUGGEST_STRATEGY = ["history" "completion"];
            };
            shellAliases = {
                zsh  = "exec zsh";
                open = "xdg-open";
                free = "free -h";

                ".."  = "cd ..";
                "..." = "cd ../..";
                l     = "ls --color=auto";
                ll    = "ls -lh --color=auto";
                la    = "ls -alh --color=auto";

                v  = "nvim";
                sv = "sudo nvim";

                g   = "git";
                ga  = "git add";
                glg = "git log";
                gl  = "git clone";
                gs  = "git status --short";
                gaa = "git add --all";
                gcp = "git cherry-pick";
                gcm = "git commit --verbose -m ";
                gca = "git commit --amend";
                gpl = "git pull";
                gp  = "git push";
                gff = "git diff --minimal";

                nc = "ncmpcpp";
                ra = "ranger";
            };
            sessionVariables = {
                "EDITOR" = "nvim";
                "BROWSER" = "firefox";
            };
            initExtra = ''
                autoload -Uz promptinit; promptinit
                eval "$(starship init zsh)"
            '';
            initExtraBeforeCompInit = ''
                # Keybinds
                bindkey '^a'        beginning-of-line
                bindkey '^e'        end-of-line
                bindkey '^w'        backward-kill-word
                bindkey '^f'        forward-char
                bindkey '^b'        backward-char
                bindkey '^r'        history-incremental-search-backward
                bindkey '^[[5~'     beginning-of-line
                bindkey '^A'	    beginning-of-line
                bindkey '^[[6~'	    end-of-line
                bindkey '^E'	    end-of-line
                bindkey '^[[2~'     overwrite-mode
                bindkey '^[[3~'	    delete-char
                bindkey '^[[1;5C'   forward-word
                bindkey '^[[1;5D'   backward-word

                # Completion
                zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
                zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
                zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                                            /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
                zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
                zstyle ':completion:*' use-cache on
                zstyle ':completion:*' cache-path ~/.zsh_cache

                zmodload zsh/complist
                setopt extendedglob
                zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"

                zstyle ':completion:*' menu select

                setopt APPEND_HISTORY
                setopt HIST_FIND_NO_DUPS
                setopt HIST_SAVE_NO_DUPS
                setopt HIST_VERIFY
                setopt INC_APPEND_HISTORY
                setopt HIST_REDUCE_BLANKS

                # Custom history-substring-search setting
                HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
                HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=default,fg=blue,bold'
                HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=default,fg=red,bold,underline'

                # Custom Highlight Syntax
                ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="bg=default,fg=light_black,underline"

                # Command Not Found Msg
                command_not_found_handler() {
                    echo -e "nope, \e[31m'$0'\e[0m didn't work."; return 1
                }
            '';
            profileExtra = ''
                if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
                    exec startx
                fi
            '';
            dirHashes = {
                docs  = "$HOME/Documents";
                vids  = "$HOME/Videos";
                dl    = "$HOME/Downloads";
                musk  = "$HOME/Musik";
            };
        };
    };
}
