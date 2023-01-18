{ pkgs, ... }:

let
    rofi-power = import ./rofi-power.nix pkgs;
    
    bluetooth-menu = import ./bluetooth-menu.nix pkgs;
in
[
    bluetooth-menu
    rofi-power
]
