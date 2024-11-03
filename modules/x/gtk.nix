{
  config,
  pkgs,
  theme,
  font,
  ...
}:

let
  phocus = import ./phocus.nix { inherit pkgs theme; };
in

{
  fonts.fontconfig.enable = true;

  gtk = {
    enable = true;

    font = {
      inherit (font) name;
      package = font.pkg;
      size = 10;
    };

    gtk3 = {
      bookmarks =
        let
          home = "file://${config.home.homeDirectory}/";
        in
        [
          "${home}download"
          "${home}docs"
          "${home}notes"
          "${home}books"
          "${home}movies"
          "${home}labbi"
          "${home}nextcloud"
          "${home}labbi/projects"
          "${home}labbi/resources"
          "${home}.config dotfiles"
        ];
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
        gtk-decoration-layout = "appmenu:none";
        gtk-enable-event-sounds = false;
        gtk-enable-input-feedback-sounds = false;
      };
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-decoration-layout = "appmenu:none";
      gtk-enable-event-sounds = false;
      gtk-enable-input-feedback-sounds = false;
    };

    iconTheme = {
      name = "MoDelta";
    };

    theme = {
      name = "phocus";
      package = phocus;
    };
  };

  home.pointerCursor = {
    name = "phinger-cursors-light";
    package = pkgs.phinger-cursors;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk3";
    style = {
      name = "breeze";
      package = pkgs.libsForQt5.breeze-qt5;
    };
  };
}
