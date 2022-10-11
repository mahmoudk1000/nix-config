{ config, pkgs, ... }:

{
    services.mpd = {
        enable = true;
        musicDirectory = "/home/mahmoud/musik";
        playlistDirectory = "/home/mahmoud/.config/mpd";
        dbFile = "/home/mahmoud/.config/mpd/mpd.db";
        dataDir = "/home/mahmoud/.config/mpd";
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
