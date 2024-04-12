{ pkgs, ... }:

with pkgs.vimUtils;

{
  compiler-nvim = buildVimPlugin rec {
    pname = "compiler-nvim";
    version = "v3.3.2";
    src = pkgs.fetchFromGitHub {
      owner = "Zeioth";
      repo = "compiler.nvim";
      rev = "a0fc34e3aa6c8109863441fc674cf04de6241bd0";
      hash = "sha256-KIIQ1rtL9A1tZpjNNKUb5yACXGS97uaLAzCd9AogAqk=";
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
}
