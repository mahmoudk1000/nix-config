{ config, pkgs, ... }:

{
    programs.neovim = {
        enable = true;
        package = pkgs.neovim-nightly;
        withPython3 = true;
        withNodeJs = true;
    };

    home.packages = with pkgs; [
        nodePackages.bash-language-server
        rnix-lsp
    ];
}
