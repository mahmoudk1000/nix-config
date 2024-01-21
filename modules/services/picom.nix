{ pkgs
, ...
}:

{
  services.picom = {
    enable = true;
    backend = "glx";
    fade = true;
    fadeDelta = 10;
    fadeSteps = [ (0.04) (0.04) ];
    fadeExclude = [ "width=1920 && height=1080" "width=1440 && height=900" ];
    shadow = true;
    shadowOpacity = 0.25;
    shadowOffsets = [ (-10) (-10) ];
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
    settings = {
      shadow-radius = 10;
      glx-no-stencil = true;
      glx-no-rebind-pixmap = true;
      unredir-if-possible = true;
      xrender-sync-fence = true;
    };
    wintypes = {
      tooltip = {
        fade = true;
        shadow = false;
        opacity = 1;
        focus = true;
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
      dnd = {
        shadow = false;
      };
      popup_menu = {
        shadow = false;
      };
      dropdown_menu = {
        shadow = false;
      };
    };
  };
}
