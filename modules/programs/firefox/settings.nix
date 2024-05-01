{
  # Smooth scroll
  "general.smoothScroll" = true;

  # Force using WebRender. Improve performance
  "gfx.webrender.all" = true;
  "gfx.webrender.enabled" = true;

  # https://wiki.archlinux.org/title/firefox#Hardware_video_acceleration
  "media.ffmpeg.vaapi.enabled" = true;
  "media.ffvpx.enabled" = false;
  "reader.parse-on-load.enabled" = false;
  "media.webspeech.synth.enabled" = false;

  # Enable multi-pip
  "media.videocontrols.picture-in-picture.allow-multiple" = true;

  # Misc
  "browser.aboutConfig.showWarning" = false;
  "browser.tabs.warnOnClose" = false;
  "widget.use-xdg-desktop-portal" = true;
  "ui.context_menus.after_mouseup" = true;
  "browser.toolbars.bookmarks.visibility" = "never";

  # Tab
  "browser.urlbar.suggest.quickactions" = false;
  "browser.urlbar.suggest.topsites" = false;
  "browser.tabs.tabmanager.enabled" = false;

  # Privacy
  "browser.contentblocking.category" = "strict";
  "network.trr.confirmation_telemetry_enabled" = false;

  # Custom DNS
  "network.trr.mode" = 2;
  "network.trr.custom_uri" = "https://dns.nextdns.io/b28d16";
  "network.trr.uri" = "https://dns.nextdns.io/b28d16";
}
