{
  imports = [ ./accounts.nix ./thunderbird.nix ];

  services.imapnotify.enable = true;
}
