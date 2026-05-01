_final: prev: {
  st-flexipatch = prev.callPackage ./st/st.nix { };
  wslview = prev.callPackage ../pkgs/wslview { };
}
