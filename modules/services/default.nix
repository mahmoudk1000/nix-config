{ config, pkgs, ... }:

{
    imports = [
        ./autorandr.nix
        ./betterlockscreen.nix
        ./conky.nix
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

