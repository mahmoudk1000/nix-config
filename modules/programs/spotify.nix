{
  inputs,
  pkgs,
  theme,
  ...
}:

let
  hexColorToRGB = color: builtins.substring 1 6 color;
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
{
  programs.spicetify = {
    enable = true;
    windowManagerPatch = true;
    theme = spicePkgs.themes.text;
    enabledExtensions = with spicePkgs.extensions; [
      playlistIcons
      shuffle
      history
      fullAppDisplay
      hidePodcasts
      seekSong
      adblock
    ];
    enabledCustomApps = with spicePkgs.apps; [
      new-releases
      lyrics-plus
    ];
    colorScheme = "custom";
    customColorScheme = {
      accent = hexColorToRGB theme.base02;
      accent-active = hexColorToRGB theme.base06;
      accent-inactive = hexColorToRGB theme.base02;
      banner = hexColorToRGB theme.base06;
      border-active = hexColorToRGB theme.base06;
      border-inactive = hexColorToRGB theme.base02;
      header = hexColorToRGB theme.base02;
      highlight = hexColorToRGB theme.base02;
      main = hexColorToRGB theme.base00;
      notification = hexColorToRGB theme.base0A;
      notification-error = hexColorToRGB theme.base03;
      subtext = hexColorToRGB theme.base01;
      text = hexColorToRGB theme.base01;
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
