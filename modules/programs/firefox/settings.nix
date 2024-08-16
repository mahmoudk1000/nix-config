{
  # Smooth scroll
  "general.smoothScroll" = true;

  # Force using WebRender. Improve performance
  "gfx.webrender.all" = true;
  "gfx.webrender.enabled" = true;
  "beacon.enabled" = false;

  # https://wiki.archlinux.org/title/firefox#Hardware_video_acceleration
  "media.ffmpeg.vaapi.enabled" = true;
  "media.ffvpx.enabled" = false;
  "media.rdd-vpx.enabled" = true;
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
  # "privacy.firstparty.isolate" = true;
  # "privacy.resistFingerprinting" = true;
  "privacy.trackingprotection.enabled" = true;
  "privacy.trackingprotection.fingerprinting.enabled" = true;
  "privacy.trackingprotection.cryptomining.enabled" = true;
  "browser.contentblocking.category" = "strict";
  "network.trr.confirmation_telemetry_enabled" = false;

  # Custom DNS
  # "network.trr.mode" = 2;
  # "network.trr.custom_uri" = "https://dns.nextdns.io/b28d16";
  # "network.trr.uri" = "https://dns.nextdns.io/b28d16";

  # DOM
  "dom.battery.enabled" = false;
  "dom.ipc.plugins.flash.subprocess.crashreporter.enabled" = false;
  "dom.push.enabled" = false;
  "dom.security.https_only_mode_ever_enabled" = true;
  "dom.security.https_only_mode" = true;
  "dom.webaudio.enabled" = false;
  "dom.webnotifications.enabled" = false;
  "dom.webnotifications.serviceworker.enabled" = false;
}
