{ config, pkgs, ... }:

{
    # Nix
    nix = {
        package = pkgs.nixUnstable;
        settings = {
            keep-outputs = false;
            keep-derivations = false;
            experimental-features = [
                "nix-command"
                "flakes"
            ];
            auto-optimise-store = true;
            trusted-users = [
                "root"
                "mahmoud"
            ];
        };
        gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 14d";
        };
    };

    # NixOS
    system = {
        autoUpgrade = {
            enable = false;
            channel = "https://nixos.org/channels/nixos-unstable";
        };
        stateVersion = "22.05";
    };
}
