{ config, pkgs, ... }:

let
  kiwi = import ./kiwi.nix;
  toka = import ./toka.nix;
in

{
  imports = [ kiwi ];

  programs.ncmpcpp = {
    enable = true;
    package = pkgs.ncmpcpp.override {
      visualizerSupport = true;
      clockSupport = true;
      taglibSupport = true;
    };
    mpdMusicDir = "${config.home.homeDirectory}/musik";
    settings.ncmpcpp_directory = "${config.home.homeDirectory}/.config/ncmpcpp";
  };
}
