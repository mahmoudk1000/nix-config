final: prev: {
  st-flexipatch = prev.callPackage ./st/st.nix { };
  wslview = prev.callPackage ../pkgs/wslview { };
  opencode =
    final.runCommand prev.opencode.name
      {
        nativeBuildInputs = [ final.patchelf ];
        inherit (prev.opencode) meta;
      }
      ''
        cp -a ${prev.opencode} $out
        chmod -R u+w $out
        find $out -type f -exec sed -i "s|${prev.opencode}|$out|g" {} +
        patchelf --set-interpreter \
          "$(patchelf --print-interpreter "$out/bin/.opencode-wrapped")" \
          "$out/bin/.opencode-wrapped"
      '';
}
