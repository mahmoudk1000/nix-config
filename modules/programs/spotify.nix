{
  inputs,
  pkgs,
  theme,
  ...
}:

{
  programs.spicetify =
    let
      stripHexPrefix = color: builtins.substring 1 6 color;
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      windowManagerPatch = true;
      theme = spicePkgs.themes.dribbblish;
      enabledExtensions = with spicePkgs.extensions; [
        shuffle
        history
        fullAppDisplayMod
        hidePodcasts
        seekSong
        adblock
      ];
      enabledCustomApps = with spicePkgs.apps; [
        newReleases
        lyricsPlus
        ncsVisualizer
      ];
      colorScheme = "custom";
      customColorScheme = with stripHexPrefix theme; {
        text = base01;
        subtext = base09;
        sidebar-text = base01;
        main = base00;
        sidebar = base06;
        player = base00;
        card = base00;
        shadow = base02;
        selected-row = base0A;
        button = base06;
        button-active = base06;
        button-disabled = base02;
        tab-active = base0A;
        notification = base0A;
        notification-error = base03;
        misc = base01;
      };
    };

  xdg.desktopEntries = {
    spotify = {
      name = "Spotify";
      type = "Application";
      icon = "spotify";
      exec = "spotify";
      terminal = false;
      genericName = "Music Player";
      categories = [
        "Audio"
        "Music"
        "Player"
        "AudioVideo"
      ];
    };
  };
}
