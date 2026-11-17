{
  lib,
  host,
  ...
}:
{
  imports = [
    ../common
    ./hardware.nix
    ./boot.nix
    ./users.nix
    ./virtualisation.nix
  ]
  # disko-managed disk layout (disks/default.nix), see README.
  ++ lib.optionals host.disko [ ./disko.nix ];

  system.stateVersion = "22.05";
}
