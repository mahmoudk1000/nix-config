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
    agenix.url = "github:ryantm/agenix";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nur,
      nixpkgs-f2k,
      spicetify-nix,
      agenix,
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
            labbi = {
              user = "mahmoud";
              hostName = "labbi";
            };
          in
          nixpkgs.lib.nixosSystem {
            modules = [
              { imports = [ ./hosts/labbi/configuration.nix ]; }
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  users.mahmoud = {
                    imports = [
                      ./home-manager/labbi/home.nix
                      spicetify-nix.homeManagerModules.default
                      agenix.homeManagerModules.default
                    ];
                    _module.args.theme = import ./modules/themes;
                  };
                  extraSpecialArgs = {
                    inherit self inputs labbi;
                  };
                };
                nixpkgs.overlays = overlays;
              }
              nur.nixosModules.nur
              home-manager.nixosModules.home-manager
              agenix.nixosModules.default
            ];
            specialArgs = {
              inherit self inputs labbi;
            };
          };
      };
    };
}
