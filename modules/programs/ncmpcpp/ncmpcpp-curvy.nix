{ config, ... }:

{
  programs.ncmpcpp = {
    enable = true;
    mpdMusicDir = "${config.home.homeDirectory}/musik";
    settings = {
      # Delays
      playlist_disable_highlight_delay = "1";

      # Song Format
      song_list_format = "{$8%l$9} $1|$9 {$6%a$9} $1|$9 {$5%t$9} $R {$1%b$9}";
      song_library_format = "{%n - }{%t}|{%f}";
      song_status_format = "$b{$6%a$9 $1|$9 } {$7%t$9} $1|$9 {$2%b$9} $1|$9 {$6%y$9}";
      song_window_title_format = "{%b}";

      # Columns settings
      song_columns_list_format = "(6)[magenta]{l} (30)[red]{a} (30)[blue]{b} (53)[magenta]{t}";

      # Misc
      playlist_display_mode = "classic";
      titles_visibility = "no";
      browser_display_mode = "columns";
      incremental_seeking = "yes";
      autocenter_mode = "yes";
      header_visibility = "no";
      statusbar_visibility = "yes";
      cyclic_scrolling = "yes";
      display_bitrate = "yes";
      ignore_leading_the = "yes";
      enable_window_title = "yes";
      progressbar_look = ''"─╼ "'';
      now_playing_prefix = ''"‣ "'';
      now_playing_suffix = "$/b";
      current_item_prefix = "$(blue)$b";
      current_item_suffix = "$/b$(end)";
      external_editor = "nvim";

      # Interface
      startup_screen = "playlist";
      user_interface = "classic";
      alternative_header_first_line_format = "{$b$6%a$9} $1««$9 {$6%t$9}";
      alternative_header_second_line_format = "{$5%b$9} $1»»$9 {$5(%y)$9}";
      alternative_ui_separator_color = "black";
      playlist_separate_albums = "no";

      # Colors
      colors_enabled = "yes";
      empty_tag_color = "blue";
      header_window_color = "black";
      volume_color = "black";
      display_volume_level = "yes";
      state_line_color = "cyan";
      state_flags_color = "red";
      main_window_color = "blue";
      color1 = "white";
      color2 = "blue";
      progressbar_color = "cyan";
      statusbar_color = "black";
      window_border_color = "red";
      active_window_border = "red";
    };
  };
}
