{
  description = "mahmoudk1000's nixos config";

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
    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = 
  { self 
  , nixpkgs
  , home-manager
  , nur
  , neovim-nightly
  , nixpkgs-f2k
  , ... 
  } @ inputs: 
  let
    overlays = with inputs; [
      nur.overlay
      neovim-nightly.overlay
      nixpkgs-f2k.overlays.window-managers
    ];
  in
  {
    nixosConfigurations = {
      labbi = nixpkgs.lib.nixosSystem {
        modules = [
          ({ config = { nix.registry.nixpkgs.flake = nixpkgs; }; })
          {
            imports = [ ./hosts/labbi/configuration.nix ];
            _module.args.self = self;
          }
          nur.nixosModules.nur
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.mahmoud = {
              imports = [ ./home-manager/labbi/home.nix ];
              _module.args.self = self;
              _module.args.inputs = inputs;
              _module.args.theme = import ./modules/themes;
            };
            nixpkgs.overlays = overlays;
          }
        ];
      };
    };
  };
}
