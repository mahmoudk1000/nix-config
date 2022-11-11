{ config, pkgs, theme, ... }:

{
    imports = [
        ./xcompose.nix
        ./xft.nix
        ./xresources.nix
        ./xinitrc.nix
    ];
}
