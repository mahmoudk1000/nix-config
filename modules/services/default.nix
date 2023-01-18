{ config, pkgs, ... }:

{
    imports = [
        ./autorandr.nix
        ./betterlockscreen.nix
        ./dunst.nix
        ./flameshot.nix
        ./keyring.nix
        ./mpd.nix
        ./nextcloud.nix
        ./picom.nix
        ./polybar-hoch.nix
        ./sxhkd.nix
        ./unclutter.nix
    ];
}

