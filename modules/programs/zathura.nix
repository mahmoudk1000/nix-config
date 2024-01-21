{ theme
, ...
}:

{
  programs = {
    zathura = {
      enable = true;
      options = {
        font =  "Iosevka 10";
        notification-error-bg = theme.base03;
        notification-error-fg = theme.base01;
        notification-warning-bg = theme.base05;
        notification-warning-fg = theme.base02;
        notification-bg = theme.base00;
        notification-fg = theme.base02;
        completion-bg = theme.base00;
        completion-fg = theme.base09;
        completion-group-bg = theme.base00;
        completion-group-fg = theme.base09;
        completion-highlight-bg = theme.base02;
        completion-highlight-fg = theme.base01;
        index-bg = theme.base00;
        index-fg = theme.base01;
        index-active-bg = theme.base02;
        index-active-fg = theme.base01;
        inputbar-bg = theme.base00;
        inputbar-fg = theme.base01;
        statusbar-bg = theme.base00;
        statusbar-fg = theme.base01;
        highlight-color = theme.base06;
        highlight-active-color = theme.base07;
        default-bg = theme.base00;
        default-fg = theme.base01;
        render-loading = true;
        render-loading-fg = theme.base00;
        render-loading-bg = theme.base01;
        recolor-lightcolor = theme.base00;
        recolor-darkcolor = theme.base01;
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
        "<C-Tab>" =  "toggle_statusbar";
      };
    };
  };
}
