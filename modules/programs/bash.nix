{ config, pkgs, ... }:

{
    programs = {
        fzf = {
            enable = true;
            enableBashIntegration = true;
        };
        direnv = {
            enable = true;
            enableBashIntegration = true;
        };
        bash = {
            enable = true;
            enableCompletion = true;
            historyFile = "$HOME/.bash_history";
            historyFileSize = 2000;
            historySize = 1000;
            historyControl = [ "erasedups" ];
            historyIgnore = [ "ls" "exit" "kill" ];
            shellOptions = [
                "histappend"
                "autocd"
                "globstar"
                "checkwinsize"
                "cdspell"
                "dirspell"
                "expand_aliases"
                "dotglob"
                "gnu_errfmt"
                "histreedit"
                "nocasematch"
            ];
            shellAliases = {
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

                nc = "ncmpcpp";
                ra = "ranger";
            };
            sessionVariables = {
                "EDITOR" = "nvim";
                "BROWSER" = "firefox";
            };
            initExtra = ''
                eval "$(starship init bash)"
            '';
            profileExtra = ''
                if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
                    exec startx
                fi
            '';
        };
    };
}
