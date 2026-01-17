{ pkgs, ... }:

{
  programs = {
    android-tools.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    java = {
      enable = true;
      package = pkgs.jdk;
    };
    zsh = {
      enable = true;
    };
    command-not-found.enable = false;
  };
}
