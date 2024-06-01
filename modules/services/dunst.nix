{ theme, ... }:

{
  services.dunst = {
    enable = false;
    settings = {
      global = {
        font = "Iosevka 9";
        markup = "full";
        format = ''<b>%s</b>\n%b'';
        sort = "yes";
        shrink = "yes";
        follow = "mouse";

        origin = "top-right";
        offset = "10x10";
        height = "500";
        width = 0;
        padding = 20;
        horizontal_padding = 20;

        frame_width = 6;
        separator_height = 3;
        frame_color = theme.base0A;
        separator_color = theme.base0A;

        alignment = "left";
        word_wrap = "yes";
        ignore_newline = "no";
        stack_duplicates = true;
        show_indicators = "yes";
        sticky_history = "yes";
        history_length = 6;

        mouse_left_click = "close_current";
        mouse_middle_click = "do_action, close_current";
        mouse_right_click = "close_all";
      };
      urgency_normal = {
        background = theme.base00;
        foreground = theme.base01;
        timeout = 10;
      };
      urgency_low = {
        background = theme.base00;
        foreground = theme.base06;
        timeout = 5;
      };
      urgency_critical = {
        background = theme.base00;
        foreground = theme.base03;
        timeout = 20;
      };
    };
  };
}
