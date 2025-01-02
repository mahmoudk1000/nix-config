{
  imports = [
    ./polybars
    ./autorandr.nix
    ./battery.nix
    ./betterlockscreen.nix
    ./conky.nix
    ./dunst.nix
    ./flameshot.nix
    ./keyring.nix
    ./mbsync.nix
    ./mpd.nix
    ./nextcloud.nix
    ./picom.nix
    ./redshift.nix
    ./sxhkd.nix
    ./udiskie.nix
    ./unclutter.nix
  ];

  services.batteryNotifier.enable = true;
  services.conkyWidget.enable = false;
}
