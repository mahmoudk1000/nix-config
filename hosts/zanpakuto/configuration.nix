# zanpakuto: NixOS running inside WSL.
#
# Only `common/core` (nix + locale) is imported: WSL has no X server,
# GPU or audio hardware to configure and the system services in
# `common/system` are for the bare-metal laptop. WSL-specific settings
# live in wsl.nix.
{
  imports = [
    ../common/core
    ./wsl.nix
    ./users.nix
    ./networking.nix
    ./programs.nix
  ];

  system.stateVersion = "24.11";
}
