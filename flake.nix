{
    description = "mahmoudk1000's nixos config";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager, ... }: {
        nixosConfigurations = {
            labbi = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    {
                        imports = [ ./hosts/labbi/configuration.nix ];
                    }
                    home-manager.nixosModules.home-manager
                    {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.mahmoud = {
                            imports = [ ./home.nix ];
                            _module.args.theme = import ./modules/themes;
                        };
                    }
                ];
            };
        };
    };
}
