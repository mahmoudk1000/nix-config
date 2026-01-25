{
  config,
  pkgs,
  theme,
  font,
  ...
}:

{
  programs.alacritty = {
    enable = false;
    settings = {
      env = {
        TERM = "xterm-256color";
      };
      window = {
        padding = {
          x = 30;
          y = 20;
        };
        dimensions = {
          columns = 80;
          lines = 24;
        };
        dynamic_padding = true;
        decorations = "None";
      };
      font = {
        size = 9;
        normal = {
          family = font.nameTerm;
          style = "Regular";
        };
        bold = {
          family = font.nameTerm;
          style = "Bold";
        };
        italic = {
          family = font.nameTerm;
          style = "Italic";
        };
        bold_italic = {
          family = font.nameTerm;
          style = "Bold Italic";
        };
        offset = {
          x = 0;
          y = 2;
        };
        glyph_offset = {
          x = 0;
          y = config.programs.alacritty.settings.font.offset.y / 2;
        };
        builtin_box_drawing = true;
      };
      keyboard.bindings = [
        {
          key = "K";
          mods = "Alt|Shift";
          action = "ScrollLineUp";
        }
        {
          key = "J";
          mods = "Alt|Shift";
          action = "ScrollLineDown";
        }
        {
          key = "k";
          mods = "Alt|Control";
          action = "IncreaseFontSize";
        }
        {
          key = "j";
          mods = "Alt|Control";
          action = "DecreaseFontSize";
        }
      ];
      cursor = {
        style = {
          shape = "Underline";
          blinking = "Off";
        };
        blink_interval = 250;
      };
      scrolling = {
        history = 10000;
        multiplier = 3;
      };
      selection = {
        semantic_escape_chars = ",│`|:\"' ()[]{}<>";
        save_to_clipboard = true;
      };
      shell = {
        program = "${pkgs.zsh}/bin/zsh";
      };
      colors = {
        primary = {
          background = "${theme.base00}";
          foreground = "${theme.base05}";
        };
        cursor = {
          text = "${theme.base06}";
          cursor = "${theme.base02}";
        };
        selection = {
          text = "${theme.base07}";
          background = "${theme.base03}";
        };
        normal = {
          black = "${theme.base02}";
          red = "${theme.base08}";
          green = "${theme.base0B}";
          yellow = "${theme.base0A}";
          blue = "${theme.base0D}";
          magenta = "${theme.base0E}";
          cyan = "${theme.base0C}";
          white = "${theme.base06}";
        };
        bright = {
          black = "${theme.base03}";
          red = "${theme.base08}";
          green = "${theme.base0B}";
          yellow = "${theme.base0A}";
          blue = "${theme.base0D}";
          magenta = "${theme.base0E}";
          cyan = "${theme.base0C}";
          white = "${theme.base07}";
        };
      };
    };
  };
}
