{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        xfce.thunar
        xfce.exo
        xfce.thunar-archive-plugin
        xfce.thunar-volman
        xfce.tumbler
        xfce.xfce4-volumed-pulse
        xfce.xfconf
        xfce.mousepad
    ];
}
