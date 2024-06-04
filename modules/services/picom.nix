{
  config,
  pkgs,
  lib,
  ...
}:

{
  services.picom = {
    enable = true;
    package = pkgs.picom-pijulius;
    backend = "glx";
    vSync = true;

    fade = true;
    fadeDelta = 10;
    fadeSteps = [
      (4.0e-2)
      (4.0e-2)
    ];
    fadeExclude = [ "width=1920 && height=1080" ];

    shadow = true;
    shadowOpacity = 0.3;
    shadowOffsets = [
      (-10)
      (-10)
    ];
    shadowExclude = [
      "_GTK_FRAME_EXTENTS@:c"
      "_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
      "window_type = 'dock'"
      "window_type = 'desktop'"
      "window_type = 'menu'"
      "class_g = 'Peek'"
      "class_g = 'firefox' && window_type = 'utility'"
      "class_g = 'firefox' && argb"
      "class_g *?= 'zoom'"
      "name = 'cpt_frame_xcb_window'"
      "name *= 'rect-overlay'"
    ];

    settings = lib.mkMerge [
      {
        daemon = false;
        dbus = false;
        detect-rounded-corners = true;
        detect-client-opacity = false;
        mark-wmwim-focused = true;
        unredir-if-possible = true;
        glx-no-stencil = true;
        glx-no-rebind-pixmap = true;
        use-damage = true;
        resize-damage = 1;
        glx-use-copysubbuffer-mesa = false;
      }
      (lib.mkIf (config.services.picom.shadow) { shadow-radius = 20; })
      (lib.mkIf (config.services.picom.package == pkgs.picom-pijulius) {
        animations = true;
        animation-stiffness = 100;
        animation-window-mass = 0.3;
        animation-dampening = 10;
        animation-clamping = false;

        animation-for-open-window = "zoom";
        animation-for-unmap-window = "zoom";

        animation-for-menu-window = "zoom";
        animation-for-transient-window = "none";

        animation-for-workspace-switch-in = "none";
        animation-for-workspace-switch-out = "none";
      })
    ];

    wintypes = {
      tooltip = {
        fade = true;
        shadow = false;
        opacity = 1;
        focus = true;
      };
      popup_menu = {
        full-shadow = true;
      };
      fullscreen = {
        fade = true;
        shadow = false;
        opacity = 1;
        focus = true;
      };
      notification = {
        full-shadow = true;
      };
      dropdown_menu = {
        full-shadow = false;
      };
    };
  };
}
