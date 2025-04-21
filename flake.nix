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

    NixOS-WSL = {
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
	blue = {
	  username = "frouk";
	  hostName = "blue";
	};
      };

      pkgs = import inputs.nixpkgs {
        inherit system overlays;
        config.allowUnfree = true;
      };

      mkHost =
        host: hasHome: isWSL:
        nixosSystem {
          inherit system;
          modules = [
            inputs.home-manager.nixosModules.home-manager
            inputs.nur.modules.nixos.default
            inputs.agenix.nixosModules.default
            { imports = [ ./hosts/${host.hostName}/configuration.nix ]; }
            { nixpkgs.overlays = overlays; }
	    (if isWSL then inputs.NixOS-WSL.nixosModules.wsl else {})
            (if hasHome then {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${host.username} = import ./home-manager/${host.hostName}/home.nix;
                sharedModules = [
                  inputs.spicetify-nix.homeManagerModules.default
                  inputs.agenix.homeManagerModules.default
                  { _module.args.theme = import ./modules/themes; }
                  { _module.args.font = import ./modules/themes/font.nix { inherit pkgs; }; }
                ];
                extraSpecialArgs = {
                  inherit self inputs host;
                };
              };
            } else {})
          ];
          specialArgs = {
            inherit self inputs host;
          };
        };
    in
    {
      nixosConfigurations = {
        labbi = mkHost hosts.labbi true false;
	blue = mkHost hosts.blue false true;
      };

      devShells."${system}".default = pkgs.mkShell {
        buildInputs = with pkgs; [
          inputs.agenix.packages.${system}.default
          git
          vim
        ];
      };
    };
}
