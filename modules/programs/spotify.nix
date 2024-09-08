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
      theme = spicePkgs.themes.text;
      enabledExtensions = with spicePkgs.extensions; [
        shuffle
        history
        fullAppDisplay
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
      customColorScheme = {
        accent = stripHexPrefix theme.base02;
        accent-active = stripHexPrefix theme.base06;
        accent-inactive = stripHexPrefix theme.base02;
        banner = stripHexPrefix theme.base06;
        border-active = stripHexPrefix theme.base06;
        border-inactive = stripHexPrefix theme.base02;
        header = stripHexPrefix theme.base02;
        highlight = stripHexPrefix theme.base02;
        main = stripHexPrefix theme.base00;
        notification = stripHexPrefix theme.base0A;
        notification-error = stripHexPrefix theme.base03;
        subtext = stripHexPrefix theme.base01;
        text = stripHexPrefix theme.base01;
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
