{ inputs, pkgs, ... }:

{
  # Nix
  nix = {
    package = pkgs.nixVersions.latest;
    daemonIOSchedClass = "idle";
    daemonCPUSchedPolicy = "idle";
    daemonIOSchedPriority = 7;
    settings = {
      keep-outputs = false;
      keep-derivations = false;
      auto-optimise-store = true;
      builders-use-substitutes = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "@wheel"
      ];
      substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
        "https://cache.garnix.io"
        "https://fortuneteller2k.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        "fortuneteller2k.cachix.org-1:kXXNkMV5yheEQwT0I4XYh1MaCSz+qg72k8XAi2PthJI="
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
    registry.nixpkgs.flake = inputs.nixpkgs;
  };

  # NixOS
  system = {
    autoUpgrade = {
      enable = false;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
  };

  systemd.services.nix-gc.unitConfig.ConditionACPower = true;
}
