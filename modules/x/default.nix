{ config, pkgs, theme, ... }:

{
    imports = [
        ./gtk.nix
        ./xcompose.nix
        ./xft.nix
        ./xresources.nix
        ./xinitrc.nix
    ];
}
