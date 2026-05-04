{
  self,
  inputs,
  nixpkgsFor,
  mylib,
  ...
}:

{
  mkHost =
    {
      system,
      host,
      extraModules ? [ ],
      includeHomeManager ? true,
    }:
    let
      cfg = {
        isWsl = false;
      }
      // host;
    in
    inputs.nixpkgs.lib.nixosSystem rec {
      inherit system;
      pkgs = nixpkgsFor.${system};
      modules = [
        inputs.nur.modules.nixos.default
        inputs.agenix.nixosModules.default
        { imports = [ ../hosts/${host.hostName}/configuration.nix ]; }
      ]
      ++ (
        if includeHomeManager then
          [
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${host.username} = import ../home/${host.hostName}/home.nix;
                sharedModules = [
                  inputs.spicetify-nix.homeManagerModules.default
                  inputs.agenix.homeManagerModules.default
                  { _module.args.theme = import ../modules/themes { inherit (host) theme; }; }
                  { _module.args.font = import ../modules/themes/font.nix { inherit pkgs; }; }
                  { _module.args.mylib = mylib; }
                ];
              };
            }
            (
              { config, ... }:
              {
                config.home-manager.extraSpecialArgs = {
                  host = cfg;
                  inherit self inputs;
                  inherit (config.system) stateVersion;
                };
              }
            )
          ]
        else
          [ ]
      )
      ++ extraModules;
      specialArgs = {
        inherit self inputs host;
      };
    };
}
