{
  programs.atuin = {
    enable = false;
    enableZshIntegration = true;
    flags = [
      "--disable-up-arrow"
    ];
    settings = {
      update_check = false;
      invert = true;
      history_format = "{command}";
      theme.name = "minimal";
      style = "compact";
      inline_height = 15;
      prefers_reduced_motion = true;
      show_help = false;
      show_tabs = false;
      enter_accept = true;
    };
  };
}
