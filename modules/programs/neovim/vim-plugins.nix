{ pkgs, ... }:

{
  markview-nvim = pkgs.vimUtils.buildVimPlugin rec {
    pname = "markview-nvim";
    version = "${builtins.substring 0 7 src.rev}";
    src = pkgs.fetchFromGitHub {
      owner = "OXY2DEV";
      repo = "markview.nvim";
      rev = "7f4639a53b3e3aac3ad5deab99b21097264f07cc";
      hash = "sha256-4fXdQWQwmMkzBIkXFvBlV352k6Df7LR4ib6wZhK7rfo=";
    };
  };
}
