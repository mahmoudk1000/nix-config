{ pkgs, ... }:

{
  markview-nvim = pkgs.vimUtils.buildVimPlugin rec {
    pname = "markview-nvim";
    version = "${builtins.substring 0 7 src.rev}";
    src = pkgs.fetchFromGitHub {
      owner = "OXY2DEV";
      repo = "markview.nvim";
      rev = "f801b3e1213f6b92b9110660e3bcf3af5c5ff758";
      hash = "sha256-WU2sGOWeI6/Ljc4fpfK9zLCClpPJJ7BqYoixKjScLXE=";
    };
  };
}
