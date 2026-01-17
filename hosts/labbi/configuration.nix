{
  imports = [
    ../common
    ./hardware.nix
    ./boot.nix
    ./virtualisation.nix
  ];

  system.stateVersion = "22.05";
}
