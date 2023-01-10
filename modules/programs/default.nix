{ config, pkgs, ... }:

{
    imports = [
        ./alacritty.nix
        ./bspwm.nix
        ./firefox.nix
        ./git.nix
        ./herbstluftwm.nix
        ./ncmpcpp.nix
        ./neovim.nix
        ./rofi.nix
        ./starship.nix
        ./thunar.nix
        ./thunderbird.nix
        ./tmux.nix
        ./urxvt.nix
        ./vscode.nix
        ./zathura.nix
        ./zsh.nix
    ];
}
