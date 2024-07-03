{ pkgs, ... }:

with pkgs.vimUtils;

{
  compiler-nvim = buildVimPlugin {
    pname = "compiler-nvim";
    version = "v3.3.2";
    src = fetchFromGitHub {
      owner = "Zeioth";
      repo = "compiler.nvim";
      rev = "a0fc34e3aa6c8109863441fc674cf04de6241bd0";
      hash = "sha256-KIIQ1rtL9A1tZpjNNKUb5yACXGS97uaLAzCd9AogAqk=";
    };
  };

  filetype-nvim = buildVimPlugin {
    pname = "filetype-nvim";
    version = "v0.4.0";
    src = fetchFromGitHub {
      owner = "nathom";
      repo = "filetype.nvim";
      rev = "b522628a45a17d58fc0073ffd64f9dc9530a8027";
      sha256 = "sha256-B+VvgQj8akiKe+MX/dV2/mdaaqF8s2INW3phdPJ5TFA=";
    };
  };

  markview.nvim = buildVimPlugin {
    pname = "markview.nvim";
    version = "v0.1.0";
    src = fetchFromGitHub {
      owner = "OXY2DEV";
      repo = "markview.nvim";
      rev = "f60219dce7283192d549f21847fcf8537bf6d260";
      hash = "sha256-0Vf3z9V5Z2G6+6e8ZyR1R6y6fL9L2r3Jj6e1z6Z9YQ0=";
    };
  };
}
