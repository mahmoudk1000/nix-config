{ config
, pkgs
, ...
}:

{
  imports = [
    ./gtk.nix
    ./xcompose.nix
    ./xft.nix
    ./xinitrc.nix
    ./xmodmap.nix
    ./xresources.nix
  ];
}
