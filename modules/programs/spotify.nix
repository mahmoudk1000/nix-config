{ inputs
, pkgs
, ...
}:

let
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
      accent             = "222E3A";
      accent-active      = "90A8BE";
      accent-inactive    = "1A232C";
      banner             = "90A8BE";
      border-active      = "90A8BE";
      border-inactive    = "1A232C";
      header             = "1A232C";
      highlight          = "1A232C";
      main               = "11171D";
      notification       = "D0f1D5";
      notification-error = "F6BAB5";
      subtext            = "E7EFF5";
      text               = "E7EFF5";
    };
  };
}
