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
        # Additional modules here...
      ] ++ extraModules;
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
