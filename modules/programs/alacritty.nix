{ pkgs, theme, ... }:

{
  programs.alacritty = {
    enable = true;
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
          y = 1;
        };
      };
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
          text = "${theme.base09}";
          cursor = "${theme.base01}";
        };
        selection = {
          text = "${theme.base01}";
          background = "${theme.base09}";
        };
        normal = {
          black = "${theme.base02}";
          red = "${theme.base03}";
          green = "${theme.base04}";
          yellow = "${theme.base05}";
          blue = "${theme.base06}";
          magenta = "${theme.base07}";
          cyan = "${theme.base08}";
          white = "${theme.base01}";
        };
        bright = {
          black = "${theme.base09}";
          red = "${theme.base0A}";
          green = "${theme.base0B}";
          yellow = "${theme.base0C}";
          blue = "${theme.base0D}";
          magenta = "${theme.base0E}";
          cyan = "${theme.base0F}";
          white = "${theme.base01}";
        };
      };
    };
  };
}
