{ config, pkgs, theme, ... }:

{
    programs = {
        fzf = {
            enable = true;
            enableZshIntegration = true;
        };
        zsh = {
            enable = true;
            enableAutosuggestions = true;
            enableCompletion = true;
            enableSyntaxHighlighting = true;
            autocd = true;
            completionInit = "autoload -U compinit && compinit";
            historySubstringSearch.enable = true;
            history.size = 10000;
            shellAliases = {
                zsh = "exec zsh";
                py = "python3";
                open = "xdg-open";
                free = "free -h";

                ".." = "cd ..";
                "..." = "cd ../..";
                l = "ls --color=auto";
                ll = "ls -lh --color=auto";
                la = "ls -alh --color=auto";

                v = "nvim";
                sv = "sudo nvim";

                g = "git";
                glg = "git log";
                gl = "git clone";
                gs = "git status --short";
                gaa = "git add --all";
                gcp = "git cherry-pick";
                gcm = "git commit --verbose -m ";
                gpl = "git pull";
                gp = "git push";
                gff = "git diff --minimal";

                nc = "ncmpcpp";
                ra = "ranger";
            };
            sessionVariables = {
                "EDITOR" = "nvim";
                "BROWSER" = "firefox";
                "HISTFILE" = "$HOME/.zsh_history";
                "MAKEFLAGS" = " -j 8";
            };
            initExtra = ''
                autoload -Uz promptinit; promptinit
                eval "$(starship init zsh)"
            '';
            initExtraBeforeCompInit = ''
                bindkey '^a' beginning-of-line
                bindkey '^e' end-of-line
                bindkey '^w' backward-kill-word
                bindkey '^f' forward-char
                bindkey '^b' backward-char
                bindkey '^r' history-incremental-search-backward
                bindkey "^[[5~"	  beginning-of-line
                bindkey "^A"	  beginning-of-line
                bindkey "^[[6~"	  end-of-line
                bindkey "^E"	  end-of-line
                bindkey "^[[2~"   overwrite-mode
                bindkey "^[[3~"	  delete-char
                bindkey "^[[1;5C" forward-word
                bindkey "^[[1;5D" backward-word

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
                setopt EXTENDED_HISTORY          # using ":start:elapsed;command" format
                setopt HIST_EXPIRE_DUPS_FIRST    # remote duplicate when trimming history
                setopt HIST_IGNORE_DUPS          # ignore duplicated commands
                setopt HIST_IGNORE_ALL_DUPS
                setopt HIST_FIND_NO_DUPS
                setopt HIST_IGNORE_SPACE
                setopt HIST_SAVE_NO_DUPS
                setopt HIST_VERIFY
                setopt INC_APPEND_HISTORY        # write immediately, not on shell exit
                setopt SHARE_HISTORY             # share command history data
                setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.

                # Custom Highlight syntax
                ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=${theme.base09}" #  underline for underline

                # cmd not found msg
                command_not_found_handler() {
                    echo -e "nope, \e[31m'$0'\e[0m didn't work."; return 1
                }
            '';
            profileExtra = ''
                if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
                    exec startx
                fi
            '';
        };
    };
}
