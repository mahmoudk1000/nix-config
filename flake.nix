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
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nur,
      nixpkgs-f2k,
      spicetify-nix,
      ...
    }@inputs:
    let
      overlays = [
        (import ./overlays)
        nur.overlay
        nixpkgs-f2k.overlays.window-managers
      ];
    in
    {
      nixosConfigurations = {
        labbi =
          let
            user = "mahmoud";
            hostName = "labbi";
          in
          nixpkgs.lib.nixosSystem {
            specialArgs = {
              inherit
                self
                inputs
                user
                hostName
                ;
            };
            modules = [
              nur.nixosModules.nur
              home-manager.nixosModules.home-manager
              { imports = [ ./hosts/labbi/configuration.nix ]; }
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  users.mahmoud = {
                    imports = [
                      ./home-manager/labbi/home.nix
                      spicetify-nix.homeManagerModules.default
                    ];
                    _module.args.theme = import ./modules/themes;
                  };
                  extraSpecialArgs = {
                    inherit
                      self
                      inputs
                      user
                      hostName
                      ;
                  };
                };
                nixpkgs.overlays = overlays;
              }
            ];
          };
      };
    };
}
