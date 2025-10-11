{
  config,
  lib,
  theme,
  ...
}:

{
  programs.superfile = {
    enable = true;
    settings = {
      theme = "default";
      editor = "";
      dir_editor = "";
      auto_check_update = false;
      cd_on_quit = false;
      default_open_file_preview = true;
      show_image_preview = true;
      show_panel_footer_info = true;
      default_directory = "~";
      file_size_use_si = false;
      default_sort_type = 0;
      sort_order_reversed = false;
      case_sensitive_sort = false;
      shell_close_on_success = false;
      debug = false;
      ignore_missing_fields = false;
      nerdfont = true;
      transparent_background = true;
      file_preview_width = 0;
      sidebar_width = 20;
      border_top = "─";
      border_bottom = "─";
      border_left = "│";
      border_right = "│";
      border_top_left = "╭";
      border_top_right = "╮";
      border_bottom_left = "╰";
      border_bottom_right = "╯";
      border_middle_left = "├";
      border_middle_right = "┤";
      metadata = true;
      zoxide_support = true;
      enable_md5_checksum = false;
      code_previewer = lib.optionalString config.programs.bat.enable "bat";
    };
    themes = {
      default = {
        file_panel_border = theme.base01;
        sidebar_border = theme.base01;
        footer_border = theme.base01;

        file_panel_border_active = theme.base06;
        sidebar_border_active = theme.base06;
        footer_border_active = theme.base06;
        modal_border_active = theme.base06;

        full_screen_bg = theme.base00;
        file_panel_bg = theme.base00;
        sidebar_bg = theme.base02;
        footer_bg = theme.base00;
        modal_bg = theme.base02;

        full_screen_fg = theme.base07;
        file_panel_fg = theme.base07;
        sidebar_fg = theme.base09;
        footer_fg = theme.base07;
        modal_fg = theme.base07;

        cursor = theme.base06;
        correct = theme.base04;
        error = theme.base03;
        hint = theme.base08;
        cancel = theme.base0A;
        gradient_color = [
          theme.base06
          theme.base07
        ];

        file_panel_top_directory_icon = theme.base06;
        file_panel_top_path = theme.base07;
        file_panel_item_selected_fg = theme.base00;
        file_panel_item_selected_bg = theme.base06;

        sidebar_title = theme.base06;
        sidebar_item_selected_fg = theme.base00;
        sidebar_item_selected_bg = theme.base06;
        sidebar_divider = theme.base01;

        modal_cancel_fg = theme.base0A;
        modal_cancel_bg = theme.base02;
        modal_confirm_fg = theme.base04;
        modal_confirm_bg = theme.base02;

        help_menu_hotkey = theme.base06;
        help_menu_title = theme.base07;
      };
    };
  };
}
