{
  config,
  pkgs,
  theme,
  lib,
  ...
}:

{
  programs = {
    jujutsu = {
      enable = true;
      settings = {
        user = {
          name = config.programs.git.userName;
          email = config.programs.git.userEmail;
        };
        ui = {
          diff-editor = lib.mkIf config.programs.neovim.enable [
            "nvim"
            "-c"
            "DiffEditor $left $right $output"
          ];
          pager = "less -FRX";
        };
        signing = {
          backend = "gpg";
          inherit (config.programs.git.signing) key;
        };
      };
    };
    lazygit = {
      enable = lib.mkIf config.programs.git.enable true;
      settings = {
        gui.theme = {
          activeBorderColor = [
            "blue"
            "bold"
          ];
          inactiveBorderColor = [ "black" ];
          selectedLineBgColor = [ "default" ];
        };
      };
    };
    git = {
      enable = true;
      package = pkgs.gitFull;
      lfs.enable = true;
      userName = "Mahmoud Farouk";
      userEmail = "mahmoudk1000@gmail.com";
      includes = [
        {
          condition = "gitdir:~/work/";
          contents = {
            commit.gpgSign = false;
            user = {
              name = "Mahmoud Frouk";
              email = "mahmoud.frouk@atos.net";
              signingKey = "A23D3563FD90EA8F";
            };
            gpg.format = "ssh";
          };
        }
      ];
      extraConfig = {
        commit.verbose = true;
        init = {
          defaultBranch = "main";
        };
        push = {
          default = "current";
          autoSetupRemote = true;
        };
        url = {
          "https://github.com/".insteadOf = "gh:";
          "git@github.com:".pushInsteadOf = "gh:";
          "https://gitlab.com/".insteadOf = "gl:";
          "git@gitlab.com:".pushInsteadOf = "gl:";
        };
        # Set default "git pull" behaviour so it doesn't try to default to
        # either "git fetch; git merge" (default) or "git fetch; git rebase".
        pull.ff = "only";
        # REuse REcorded REsolution to remember and resolve merge conflicts
        # better when you hit the several conflict several times.
        rerere = {
          enabled = true;
          autoupdate = true;
        };
      };
      signing = {
        signByDefault = true;
        key = "A23D3563FD90EA8F";
      };
      ignores = [
        ".envrc"
        ".direnv"
        ".vscode"
        "*.swp"
        "*result*"
        "node_modules"
      ];
      delta = {
        enable = true;
        options = {
          features = "decorations labels";
          syntax-theme = "none";
          zero-style = "8";
          navigate = "true";
          keep-plus-minus-markers = "true";
          decorations = {
            file-decoration-style = "none";
            whitespace-error-style = "22 reverse";
            minus-style = "${theme.base03}";
            minus-emph-style = "${theme.base03} bold";
            plus-style = "${theme.base04}";
            plus-emph-style = "${theme.base04} bold";
            file-style = "7 italic";
            hunk-header-style = "7";
            hunk-header-decoration-style = "8 ul";
          };
          labels = {
            file-modified-label = " MODIFIED ";
            file-removed-label = " REMOVED ";
            file-added-label = " ADDED ";
            file-renamed-label = " RENAMED ";
          };
        };
      };
    };
  };

  home.packages = lib.mkIf config.programs.git.enable (
    with pkgs;
    [
      git-crypt
      gh
    ]
  );

  home.sessionVariables.DELTA_PAGER = "less -R";
}
