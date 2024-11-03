{
  description = "mahmoudk1000's nixos config";

  nixConfig = {
    extra-substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
      "https://cache.garnix.io"
    ];
    extra-trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nur.url = "github:nix-community/NUR";

    nixpkgs-f2k = {
      url = "github:moni-dz/nixpkgs-f2k";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
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
      nixpkgs,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      inherit (nixpkgs.lib) nixosSystem;
      inherit (inputs.home-manager.lib) homeManagerConfiguration;

      overlays = [
        (import ./overlays)
        inputs.nur.overlay
        inputs.nixpkgs-f2k.overlays.window-managers
        inputs.agenix.overlays.default
      ];

      hosts = {
        labbi = {
          username = "mahmoud";
          hostName = "labbi";
        };
      };

      pkgs = import inputs.nixpkgs {
        inherit system overlays;
        config.allowUnfree = true;
      };

      mkHomeModules = host: [
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${host.username} = {
              imports = [
                ./home-manager/${host.hostName}/home.nix
                inputs.spicetify-nix.homeManagerModules.default
                inputs.agenix.homeManagerModules.default
              ];
              _module.args.theme = import ./modules/themes;
              _module.args.font = import ./modules/themes/font.nix;
            };
            extraSpecialArgs = {
              inherit self inputs host;
            };
          };
        }
      ];

      mkHost =
        host:
        nixosSystem {
          inherit system;
          modules = [
            { imports = [ ./hosts/${host.hostName}/configuration.nix ]; }
            { nixpkgs.overlays = overlays; }
            inputs.nur.nixosModules.nur
            inputs.home-manager.nixosModules.home-manager
            inputs.agenix.nixosModules.default
          ] ++ (mkHomeModules host);
          specialArgs = {
            inherit self inputs host;
          };
        };
    in
    {
      nixosConfigurations = {
        labbi = mkHost hosts.labbi;
      };

      homeConfigurations = {
        labbi = homeManagerConfiguration {
          inherit pkgs;
          modules = mkHomeModules hosts.labbi;
        };
      };
    };
}
