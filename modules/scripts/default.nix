{ config
, pkgs
, lib
, ...
}:

let
  poww = import ./poww.nix pkgs;
  blum = import ./blum.nix pkgs;
in
[
  blum
] ++ (lib.optional config.programs.poww.enable poww)
