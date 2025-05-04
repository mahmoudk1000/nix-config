{
  self,
  inputs,
  overlays,
  ...
}:

let
  supportedSystems = [
    "x86_64-linux"
    "x86_64-darwin"
    "aarch64-linux"
    "aarch64-darwin"
  ];

  nixpkgsFor = inputs.nixpkgs.lib.genAttrs supportedSystems (
    system:
    import inputs.nixpkgs {
      inherit system overlays;
      config.allowUnfree = true;
    }
  );
in
{
  inherit supportedSystems nixpkgsFor;

  forAllSystems = inputs.nixpkgs.lib.genAttrs supportedSystems;

  inherit (import ./mkHost.nix { inherit self inputs nixpkgsFor; }) mkHost;
  inherit (import ./mkHome.nix { inherit self inputs nixpkgsFor; }) mkHome;
}
