{ pkgs, ... }:

{
  markview-nvim = pkgs.vimUtils.buildVimPlugin rec {
    pname = "markview-nvim";
    version = "${builtins.substring 0 7 src.rev}";
    src = pkgs.fetchFromGitHub {
      owner = "OXY2DEV";
      repo = "markview.nvim";
      rev = "913fe6414c038bce900a54ab157e46b958b56eb1";
      hash = "sha256-RvCBJNwkj3y4bGu0X2d2nCz7/BvgWZe7I5zKDRld4ZQ=";
    };
  };
}
