{ pkgs, ... }:

let
    rofi-power = import ./rofi-power.nix pkgs;
    
    blum = import ./blum.nix pkgs;
in
[
    blum
    rofi-power
]
