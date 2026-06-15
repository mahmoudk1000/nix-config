{
  config,
  pkgs,
  theme,
  lib,
  host,
  ...
}:

{
  programs = {
    jujutsu = {
      enable = true;
      settings = {
        user = {
          inherit (config.programs.git.settings.user) name;
          inherit (config.programs.git.settings.user) email;
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
      settings = {
        user = {
          name = "Mahmoud";
          email = "mahmoudk1000@gmail.com";
        };
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
      includes = [
        {
          condition = "gitdir:/home/${host.username}/work/**";
          path = "/home/${host.username}/.config/git/work.gitconfig";
          contents = {
            commit.gpgSign = false;
            user = {
              name = "Mahmoud Frouk";
              email = "mahmoud.frouk@atos.net";
              signingKey = "A23D3563FD90EA8F";
            };
            url."git@github-work:".insteadOf = "git@github.com:";
          };
        }
      ];
      signing = {
        signByDefault = false;
        format = null;
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
    };
    delta = {
      enable = true;
      enableGitIntegration = true;
      options = {
        features = "decorations labels";
        syntax-theme = "none";
        zero-style = "8";
        navigate = "true";
        keep-plus-minus-markers = "true";
        decorations = {
          file-decoration-style = "none";
          whitespace-error-style = "22 reverse";
          minus-style = "${theme.base08}";
          minus-emph-style = "${theme.base08} bold";
          plus-style = "${theme.base0B}";
          plus-emph-style = "${theme.base0B} bold";
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

  home = {
    file.".config/git/work.gitconfig".text = ''
      [core]
        sshCommand = ssh -i ~/.ssh/id_ed25519 -o IdentitiesOnly=yes
    '';
    sessionVariables.DELTA_PAGER = "less -R";
    packages = lib.mkIf config.programs.git.enable (
      with pkgs;
      [
        git-crypt
        gh
      ]
    );
  };
}
