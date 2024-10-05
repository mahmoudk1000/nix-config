{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "NixOS";
        padding = {
          top = 0;
          right = 2;
          left = 2;
        };
      };
      modules = [
        "title"
        "separator"
        {
          type = "os";
          format = "{3} ({12})";
        }
        "host"
        {
          type = "kernel";
          format = "{1} {2}";
        }
        "uptime"
        "packages"
        {
          type = "shell";
          format = "{1} {4}";
        }
        {
          type = "cpu";
          format = "{}";
        }
        {
          type = "gpu";
          format = "{2}";
        }
        "memory"
        {
          type = "disk";
          format = "{} / {} ({})";
        }
        "break"
        {
          type = "colors";
          symbol = "circle";
        }
        "break"
      ];
    };
  };
}
