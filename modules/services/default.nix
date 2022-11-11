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
        # ./polybar-threeparts.nix
        ./polybar-main.nix
        ./sxhkd.nix
        ./unclutter.nix
    ];
}

