{
  config,
  pkgs,
  lib,
  ...
}:

{
  services.picom = {
    enable = true;
    # package = pkgs.picom-pijulius;
    backend = "glx";
    vSync = true;

    fade = true;
    fadeDelta = 2;
    fadeSteps = [
      (3.0e-2)
      (3.0e-2)
    ];
    fadeExclude = [ "width=1920 && height=1080" ];

    shadow = true;
    shadowOpacity = 0.6;
    shadowOffsets = [
      (-40)
      (-40)
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
        unredir-if-possible = true;
        glx-no-stencil = true;
        glx-no-rebind-pixmap = true;
        use-damage = true;
        resize-damage = 1;
        mark-wmwim-focused = true;

        corner-radius = 8;
        rounded-corners-exclude = [
          "window_type = 'dock'"
          "window_type = 'desktop'"
        ];
      }
      (lib.mkIf (config.services.picom.shadow) { shadow-radius = 40; })
      (lib.mkIf (config.services.picom.package == pkgs.picom-pijulius) {
        animations = true;
        animation-stiffness = 220;
        animation-window-mass = 0.4;
        animation-dampening = 20;
        animation-clamping = true;

        animation-for-open-window = "zoom";
        animation-for-unmap-window = "none";

        animation-for-menu-window = "none";
        animation-for-transient-window = "none";

        animation-for-workspace-switch-in = "none";
        animation-for-workspace-switch-out = "none";
      })
    ];

    wintypes = {
      tooltip = {
        fade = true;
        shadow = false;
        focus = true;
      };
      fullscreen = {
        fade = true;
        shadow = false;
        focus = true;
      };
      notification = {
        shadow = true;
      };
      dropdown_menu = {
        shadow = false;
      };
      dock = {
        shadow = false;
      };
      dnd = {
        shadow = false;
      };
    };
  };
}
