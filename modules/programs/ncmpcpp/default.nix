{ pkgs
, ...
}:

{
  imports = [
    # ./ncmpcpp-curvy.nix
    ./ncmpcpp-light.nix
  ];
}
