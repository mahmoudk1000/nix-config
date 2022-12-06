{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        xfce.thunar
        xfce.exo
        xfce.thunar-archive-plugin
        xfce.thunar-volman
        xfce.tumbler
        xfce.xfconf
        xfce.mousepad
    ];
}
