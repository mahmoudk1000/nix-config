{ config, pkgs, ... }:

{
  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    enableZshIntegration = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
    enableExtraSocket = true;
    pinentryPackage = if config.gtk.enable then pkgs.pinentry-gnome3 else pkgs.pinentry-curses;
  };
}
