{ theme, ... }:

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
      };
      font = {
        size = 9;
        normal = {
          family = "IosevkaTerm Nerd Font Mono";
          style = "Regular";
        };
        bold = {
          family = "IosevkaTerm Nerd Font Mono";
          style = "Bold";
        };
        italic = {
          family = "IosevkaTerm Nerd Font Mono";
          style = "Italic";
        };
        bold_italic = {
          family = "IosevkaTerm Nerd Font Mono";
          style = "Bold Italic";
        };
        offset = {
          x = 0;
          y = 1;
        };
      };
      cussor = {
        style = "underline";
        blink_interval = 500;
      };
      scrolling = {
        history = 10000;
        multiplier = 3;
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
