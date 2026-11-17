{
  imports = [
    ../common
    ./hardware.nix
    ./boot.nix
    ./users.nix
    ./virtualisation.nix
  ];

  system.stateVersion = "22.05";
}
