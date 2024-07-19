{ config, ... }:

{
  programs.rbw = {
    enable = true;
    settings = {
      email = "mahmoudk1000@gmail.com";
      pinentry = config.services.gpg-agent.pinentryPackage;
      lock_timeout = 600;
    };
  };
}
