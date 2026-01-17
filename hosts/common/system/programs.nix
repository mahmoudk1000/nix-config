{ pkgs, ... }:

{
  programs = {
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
