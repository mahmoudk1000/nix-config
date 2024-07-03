{ pkgs, ... }:

{
  programs = {
    adb.enable = true;
    zsh.enable = true;
    xfconf.enable = true;
    dconf.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    java = {
      enable = true;
      package = pkgs.jdk;
    };
    command-not-found.enable = false;
  };
}
