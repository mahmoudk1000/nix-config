{
  self,
  inputs,
  nixpkgsFor,
  ...
}:

{
  mkHome =
    {
      system,
      host,
      stateVersion ? "22.05",
      extraModules ? [ ],
    }:
    inputs.home-manager.lib.homeManagerConfiguration rec {
      pkgs = nixpkgsFor."${system}";
      modules = [
        ../home/${host.hostName}/home.nix
        inputs.agenix.homeManagerModules.default
        { _module.args.theme = import ../modules/themes { inherit (host) theme; }; }
        { _module.args.font = import ../modules/themes/font.nix { inherit pkgs; }; }
      ]
      ++ extraModules;
      extraSpecialArgs = {
        inherit
          self
          inputs
          host
          stateVersion
          ;
      };
    };
}
