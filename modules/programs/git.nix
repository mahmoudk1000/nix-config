{
  config,
  pkgs,
  theme,
  lib,
  ...
}:

{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    userName = "Mahmoud Ayman";
    userEmail = "mahmoudk1000@gmail.com";
    extraConfig = {
      commit.verbose = true;
      init = {
        defaultBranch = "main";
      };
      url = {
        "https://github.com/".insteadOf = "gh:";
        "git@github.com:".pushInsteadOf = "gh:";
        "https://gitlab.com/".insteadOf = "gl:";
        "git@gitlab.com:".pushInsteadOf = "gl:";
      };
    };
    signing = {
      signByDefault = true;
      key = "A23D3563FD90EA8F";
    };
    ignores = [ ".envrc" ];
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
          plus-style = "${theme.base0C}";
          plus-emph-style = "${theme.base06} bold";
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

  home.packages = lib.mkIf config.programs.git.enable (
    with pkgs;
    [
      git-crypt
      lazygit
    ]
  );
}
