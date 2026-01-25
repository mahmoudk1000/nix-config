{ theme, font, ... }:

{
  programs = {
    zathura = {
      enable = true;
      options = {
        font = "${font.name} 10";
        notification-error-bg = theme.base03;
        notification-error-fg = theme.base0F;
        notification-warning-bg = theme.base05;
        notification-warning-fg = theme.base02;
        notification-bg = theme.base00;
        notification-fg = theme.base02;
        completion-bg = theme.base00;
        completion-fg = theme.base0A;
        completion-group-bg = theme.base00;
        completion-group-fg = theme.base0A;
        completion-highlight-bg = theme.base02;
        completion-highlight-fg = theme.base0F;
        index-bg = theme.base00;
        index-fg = theme.base0F;
        index-active-bg = theme.base02;
        index-active-fg = theme.base0F;
        inputbar-bg = theme.base00;
        inputbar-fg = theme.base0F;
        statusbar-bg = theme.base00;
        statusbar-fg = theme.base0F;
        highlight-color = theme.base06;
        highlight-active-color = theme.base07;
        default-bg = theme.base00;
        default-fg = theme.base0F;
        render-loading = true;
        render-loading-fg = theme.base00;
        render-loading-bg = theme.base0F;
        recolor-lightcolor = theme.base00;
        recolor-darkcolor = theme.base0F;
        adjust-open = "width";
        recolor = true;
        guioptions = "s";
        smooth-scroll = "true";
        statusbar-home-tilde = "true";
        incremental-search = "true";
      };
      mappings = {
        "<Right>" = "navigate next";
        "D" = "toggle_page_mode";
        "<C-Tab>" = "toggle_statusbar";
      };
    };
  };
}
