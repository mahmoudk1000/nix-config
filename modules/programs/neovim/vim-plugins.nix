{ pkgs
, ...
}:

{
  compiler-nvim = pkgs.vimUtils.buildVimPlugin rec {
    pname = "compiler-nvim";
    version = "v3.2.4";
    src = pkgs.fetchFromGitHub {
      owner = "Zeioth";
      repo = "compiler.nvim";
      rev = "5615e4b15b5301144ce507ace6f594409a4d22c5";
      hash = "sha256-6VkQCTpE/nTSQ2NxjJYDtkx5jB54MOxJS5HpT6G6x/E=";
    };
  };

  filetype-nvim = pkgs.vimUtils.buildVimPlugin rec {
    pname = "filetype-nvim";
    version = "v0.4.0";
    src = pkgs.fetchFromGitHub {
      owner = "nathom";
      repo = "filetype.nvim";
      rev = "b522628a45a17d58fc0073ffd64f9dc9530a8027";
      sha256 = "sha256-B+VvgQj8akiKe+MX/dV2/mdaaqF8s2INW3phdPJ5TFA=";
    };
  };

  nvim-autopairs = pkgs.vimUtils.buildVimPlugin rec {
    pname = "nvim-autopairs";
    version = "096d0ba";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = pname;
      rev = "096d0baecc34f6c5d8a6dd25851e9d5ad338209b";
      sha256 = "sha256-4sZoZfg6ORbEwbvjIRnaDrKtVnoHpx7cAOcxn1Er6pg=";
    };
  };
}
