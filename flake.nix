{
  description = "mahmoudk1000's nixos config";

  nixConfig = {
    extra-substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
      "https://cache.garnix.io"
      "https://fortuneteller2k.cachix.org"
    ];
    extra-trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      "fortuneteller2k.cachix.org-1:kXXNkMV5yheEQwT0I4XYh1MaCSz+qg72k8XAi2PthJI="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/NUR";

    nixpkgs-f2k = {
      url = "github:moni-dz/nixpkgs-f2k";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix.url = "github:ryantm/agenix";

    wezterm.url = "github:wez/wezterm/main?dir=nix";
  };

  outputs =
    {
      self,
      ...
    }@inputs:
    let
      lib = import ./lib/default.nix { inherit self inputs overlays; };

      overlays = [
        (import ./overlays)
        inputs.nur.overlays.default
        inputs.nixpkgs-f2k.overlays.window-managers
        inputs.agenix.overlays.default
      ];

      hosts = {
        labbi = {
          username = "mahmoud";
          hostName = "labbi";
        };
        zanpakuto = {
          username = "farouk";
          hostName = "zanpakuto";
        };
      };
    in
    {
      nixosConfigurations = {
        labbi = lib.mkHost {
          system = "x86_64-linux";
          host = hosts.labbi;
          extraModules = [
            inputs.disko.nixosModules.disko
          ];
        };
        zanpakuto = lib.mkHost {
          system = "x86_64-linux";
          host = hosts.zanpakuto;
          extraModules = [
            inputs.nixos-wsl.nixosModules.wsl
          ];
        };
      };

      homeConfigurations = {
        labbi = lib.mkHome {
          system = "x86_64-linux";
          host = hosts.labbi;
          extraModules = [
            inputs.spicetify-nix.homeManagerModules.default
          ];
        };
        zanpakuto = lib.mkHome {
          system = "x86_64-linux";
          stateVersion = "24.11";
          host = hosts.zanpakuto;
        };
      };

      devShells = lib.forAllSystems (
        system:
        let
          pkgs = lib.nixpkgsFor.${system};
        in
        {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              inputs.agenix.packages.${system}.default
              git
              vim
            ];
          };
        }
      );
    };
}
