{ pkgs, ... }:

{
  markview-nvim = pkgs.vimUtils.buildVimPlugin rec {
    pname = "markview-nvim";
    version = "${builtins.substring 0 7 src.rev}";
    src = pkgs.fetchFromGitHub {
      owner = "OXY2DEV";
      repo = "markview.nvim";
      rev = "316cafc79490f8b79c288bbe6638838d6d68e227";
      hash = "sha256-4fXdQWQwmMkzBIkXFvBlV352k6Df7LR4ib6wZhK7rfo=";
    };
  };
}
