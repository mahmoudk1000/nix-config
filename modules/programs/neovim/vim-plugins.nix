{ pkgs
, ...
}:

with pkgs.vimUtils;

{
  compiler-nvim = buildVimPlugin rec {
    pname = "compiler-nvim";
    version = "v3.2.4";
    src = pkgs.fetchFromGitHub {
      owner = "Zeioth";
      repo = "compiler.nvim";
      rev = "9831cf1737df604d4335267e146202585775f859";
      hash = "sha256-xgUnsSmK+c9HLhwmts2Rn9qcf0DMXaTeRdj7w6iPGFw=";
    };
  };

  filetype-nvim = buildVimPlugin rec {
    pname = "filetype-nvim";
    version = "v0.4.0";
    src = pkgs.fetchFromGitHub {
      owner = "nathom";
      repo = "filetype.nvim";
      rev = "b522628a45a17d58fc0073ffd64f9dc9530a8027";
      sha256 = "sha256-B+VvgQj8akiKe+MX/dV2/mdaaqF8s2INW3phdPJ5TFA=";
    };
  };

  nvim-autopairs = buildVimPlugin rec {
    pname = "nvim-autopairs";
    version = "096d0ba";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = pname;
      rev = "dbfc1c34bed415906395db8303c71039b3a3ffb4";
      sha256 = "sha256-4sZoZfg6ORbEwbvjIRnaDrKtVnoHpx7cAOcxn1Er6pg=";
    };
  };
}
