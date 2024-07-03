{
  programs.fastfetch = {
    enabled = true;
    settings = {
      modules = [
        "title"
        "separator"
        {
          type = "os";
          format = "{} {}";
        }
        "host"
        "kernel"
        "uptime"
        "packages"
        {
          type = "shell";
          format = "{}";
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
        "colors"
      ];
    };
  };
}
