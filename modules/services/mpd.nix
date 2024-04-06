{ config, ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/musik";
    playlistDirectory = "${config.home.homeDirectory}/.config/mpd";
    dbFile = "${config.home.homeDirectory}/.config/mpd/mpd.db";
    dataDir = "${config.home.homeDirectory}/.config/mpd";
    network.listenAddress = "127.0.0.1";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "Output"
      }
    '';
  };
}
