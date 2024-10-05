{
  config,
  pkgs,
  theme,
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
          family = "IosevkaTerm Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "IosevkaTerm Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "IosevkaTerm Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "IosevkaTerm Nerd Font";
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
          foreground = "${theme.base01}";
        };
        cursor = {
          text = "${theme.base0A}";
          cursor = "${theme.base01}";
        };
        selection = {
          text = "${theme.base01}";
          background = "${theme.base0A}";
        };
        normal = {
          black = "${theme.base02}";
          red = "${theme.base03}";
          green = "${theme.base04}";
          yellow = "${theme.base05}";
          blue = "${theme.base06}";
          magenta = "${theme.base07}";
          cyan = "${theme.base08}";
          white = "${theme.base09}";
        };
        bright = {
          black = "${theme.base0A}";
          red = "${theme.base0B}";
          green = "${theme.base0C}";
          yellow = "${theme.base0D}";
          blue = "${theme.base0E}";
          magenta = "${theme.base0F}";
          cyan = "${theme.base0G}";
          white = "${theme.base0H}";
        };
      };
    };
  };
}
