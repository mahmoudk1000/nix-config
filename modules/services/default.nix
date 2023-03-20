{ config, pkgs, ... }:

{
    imports = [
        ./polybars
        ./autorandr.nix
        ./betterlockscreen.nix
        ./conky.nix
        ./dunst.nix
        ./flameshot.nix
        ./keyring.nix
        ./mpd.nix
        ./nextcloud.nix
        ./picom.nix
        ./redshift.nix
        ./sxhkd.nix
        ./unclutter.nix
    ];
}

