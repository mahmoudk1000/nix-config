{
  programs.ncmpcpp = {
    settings = {
      ignore_leading_the = true;
      external_editor = "nvim";
      message_delay_time = 1;
      playlist_disable_highlight_delay = 2;
      autocenter_mode = "yes";
      centered_cursor = "yes";
      allow_for_physical_item_deletion = "no";
      lines_scrolled = "1";

      visualizer_data_source = "/tmp/mpd.fifo";
      visualizer_output_name = "mpd_visualizer";
      visualizer_type = "ellipse";
      visualizer_look = "●● ";
      visualizer_color = "blue, green";

      colors_enabled = "yes";
      playlist_display_mode = "classic";
      user_interface = "classic";
      volume_color = "white";

      song_window_title_format = "Music";
      statusbar_visibility = "yes";
      header_visibility = "no";
      titles_visibility = "no";

      progressbar_look = "━━━";
      progressbar_color = "black";
      progressbar_elapsed_color = "blue";

      song_status_format = "$b{$6%a$9 $1|$9 } {$7%t$9} $1|$9 {$2%b$9} $1|$9 {$6%y$9}";
      song_list_format = "$(008)%t$R  $(247)%a$R$5  %l$8";
      song_columns_list_format = "(53)[blue]{tr} (45)[blue]{a}";

      current_item_prefix = "$b$2‣ ";
      current_item_suffix = "$/b$5";

      now_playing_prefix = ''"$b$5󰎇 "'';
      now_playing_suffix = "$/b$5";
      song_library_format = "{{%a - %t} (%b)}|{%f}";

      main_window_color = "blue";

      current_item_inactive_column_prefix = "$b$5";
      current_item_inactive_column_suffix = "$/b$5";

      color1 = "white";
      color2 = "blue";
    };
  };
}
