{ config, pkgs, ... }:

{
    imports = [
        ./bspwm.nix
        ./git.nix
        ./herbstluftwm.nix
        ./ncmpcpp.nix
        ./rofi.nix
        ./starship.nix
        ./thunar.nix
        ./urxvt.nix
        ./vscode.nix
        ./zathura.nix
        ./zsh.nix
    ];
}
