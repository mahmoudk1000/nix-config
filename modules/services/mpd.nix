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
      auto_update           "yes"
      volume_normalization  "yes"
      restore_paused        "yes"
      filesystem_charset    "UTF-8"

      audio_output {
        type "pipewire"
        name "PipeWire"
      }

      audio_output {
        type   "fifo"
        name   "Visualiser"
        path   "/tmp/mpd.fifo"
        format "44100:16:2"
      }
    '';
  };
}
