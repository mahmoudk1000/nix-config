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
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
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
      overlays = with inputs; [
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
          in
          nixpkgs.lib.nixosSystem {
            specialArgs = {
              inherit self inputs user;
            };
            modules = [
              nur.nixosModules.nur
              home-manager.nixosModules.home-manager
              {
                networking.hostName = "labbi";
                imports = [ ./hosts/labbi/configuration.nix ];
              }
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  users.mahmoud = {
                    imports = [
                      ./home-manager/labbi/home.nix
                      spicetify-nix.homeManagerModule
                    ];
                    _module.args.theme = import ./modules/themes;
                  };
                  extraSpecialArgs = {
                    inherit self inputs user;
                  };
                };
                nixpkgs.overlays = overlays;
              }
            ];
          };
      };
    };
}
