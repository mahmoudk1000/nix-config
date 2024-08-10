{ pkgs, ... }:

{
  markview-nvim = pkgs.vimUtils.buildVimPlugin rec {
    pname = "markview-nvim";
    version = "${builtins.substring 0 7 src.rev}";
    src = pkgs.fetchFromGitHub {
      owner = "OXY2DEV";
      repo = "markview.nvim";
      rev = "edcb29d38d0e31fc82c81e7168dae37c71f863a3";
      hash = "sha256-4fXdQWQwmMkzBIkXFvBlV352k6Df7LR4ib6wZhK7rfo=";
    };
  };
}
