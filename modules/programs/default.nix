{ config, pkgs, ... }:

{
    imports = [
        ./ncmpcpp
        ./neovim/neovim.nix
        ./2bwm.nix
        ./accounts.nix
        ./alacritty.nix
        ./awesomewm.nix
        # ./bash.nix
        ./bspwm.nix
        ./firefox.nix
        ./git.nix
        ./herbstluftwm.nix
        ./newsboat.nix
        ./rofi.nix
        ./starship.nix
        ./thunar.nix
        ./tmux.nix
        ./urxvt.nix
        ./vscode.nix
        ./zathura.nix
        ./zsh.nix
    ];
}
