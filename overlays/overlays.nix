final: prev: {
  st =
    with prev;
    st.overrideAttrs (oldAttrs: rec {
      src = final.fetchFromGitHub {
        owner = "siduck";
        repo = "st";
        rev = "bddc8b04d690887ea6f8da6ff9aee7f9785e7e84";
        sha256 = "sha256-gtT+ShmkD/AEip3JtN5QLQHttgEh11VtaEk8gYhQVDw=";
      };

      configFile = writeText "config.def.h" (builtins.readFile ./config.h);

      buildInputs =
        oldAttrs.buildInputs
        ++ (with prev; [
          harfbuzz
          gd
          glib
        ]);

      postPatch =
        oldAttrs.postPatch
        + ''
          cp ${configFile} config.def.h
        '';
    });
}
