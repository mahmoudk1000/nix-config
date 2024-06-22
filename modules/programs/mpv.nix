{ pkgs, theme, ... }:

{
  programs.mpv = {
    enable = true;
    package = pkgs.wrapMpv (pkgs.mpv-unwrapped.override { vapoursynthSupport = true; }) {
      youtubeSupport = true;
    };
    defaultProfiles = [ "best" ];
    profiles = {
      best = {
        profile = "high-quality";
        video-sync = "display-resample";
        interpolation = "";
        tscale = "oversample";
      };
      svp = {
        input-ipc-server = "/tmp/mpvsocket";
        hr-seek-framedrop = false;
        watch-later-options-remove = "vf";
      };
    };
    config = {
      profile = "best";
      volume = 100;
      volume-max = 200;
      force-window = "yes";
      keep-open = "no";
      ao = "pipewire";
      hwdec = "vaapi";
      ytdl-format = "bestvideo+bestaudio";
      cache-default = 4000000;

      slang = "ar,en,de";
      alang = "ar,en,de";

      osc = "no";
      osd-font = ''"Iosevka Nerd Font"'';
      osd-font-size = 24;
      osd-color = theme.base01;
      osd-border-size = 2;
      osd-bar-h = 2;
      osd-bar-w = 60;
      term-osd-bar-chars = "[━━ ]";
    };
    bindings = {
      "BS" = "cycle pause";
      "SPACE" = "cycle pause";

      "\\" = "set speed 1.0";

      "UP" = "add volume 2";
      "DOWN" = "add volume -2";

      "RIGHT" = "seek  5";
      "LEFT" = "seek -5";

      "PGUP" = "add chapter -1";
      "PGDWN" = "add chapter 1";

      "MOUSE_BTN3" = "add volume 2";
      "MOUSE_BTN4" = "add volume -2";

      "MOUSE_BTN7" = "add chapter -1";
      "MOUSE_BTN8" = "add chapter 1";

      "Alt+RIGHT" = "add video-rotate 90";
      "Alt+LEFT" = "add video-rotate -90";

      ">" = "add speed 0.25";
      "<" = "add speed -0.25";

      "h" = "seek -5";
      "j" = "add volume -2";
      "k" = "add volume 2";
      "l" = "seek 5";

      "Shift+LEFT" = "seek -60";
      "Shift+RIGHT" = "seek +60";

      "Ctrl+h" = "add chapter -1";
      "Ctrl+j" = "repeatable playlist-prev";
      "Ctrl+k" = "repeatable playlist-next";
      "Ctrl+l" = "add chapter 1";

      "J" = "cycle sub";
      "L" = "ab_loop";
      "m" = "cycle mute";
      "o" = "show-progress";

      "a" = "add audio-delay -0.001";
      "s" = "add audio-delay +0.001";

      "O" = "cycle osc; cycle osd-bar";
    };
  };
}
