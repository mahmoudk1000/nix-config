{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        padding = {
          top = 0;
          right = 5;
          left = 5;
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
          key = "$";
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
