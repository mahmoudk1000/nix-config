{
  imports = [
    ../common/core/nix.nix
    ../common/core/locale.nix
    ./wsl.nix
    ./users.nix
    ./networking.nix
    ./programs.nix
  ];

  system.stateVersion = "24.11";
}
