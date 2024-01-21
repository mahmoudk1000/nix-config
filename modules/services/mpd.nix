{ config
, ...
}:

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
        name "My PipeWire Output"
      }
      audio_output {
        type "fifo"
        name "my_fifo"
        path "/tmp/mpd.fifo"
        format "44100:16:2"
      }
      restore_paused "yes"
    '';
  };
}
