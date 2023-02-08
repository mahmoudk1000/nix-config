{
    description = "mahmoudk1000's nixos config";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nur.url = github:nix-community/NUR;

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        neovim-nightly = {
            url = "github:nix-community/neovim-nightly-overlay";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager, nur, neovim-nightly, ... } @ inputs:
        let
            overlays = [
                inputs.nur.overlay
                # inputs.neovim-nightly.overlay
            ];
        in
        {
        nixosConfigurations = {
            labbi = nixpkgs.lib.nixosSystem {
                modules = [
                    {
                        imports = [ ./hosts/labbi/configuration.nix ];
                    }
                    nur.nixosModules.nur
                    home-manager.nixosModules.home-manager
                    {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.mahmoud = {
                            imports = [ ./home-manager/labbi/home.nix ];
                            _module.args.nur = { inherit nur; };
                            _module.args.theme = import ./modules/themes;
                        };
                        nixpkgs.overlays = overlays;
                    }
                ];
            };
        };
    };
}
