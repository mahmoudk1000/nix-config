{ pkgs, ... }:

{
    fonts.fontconfig.enable = true;

    gtk = {
        enable = true;
        
        font = {
            name = "Iosevka";
            package = pkgs.iosevka;
            size = 10;
        };
        
        gtk3.extraConfig = {
            gtk-application-prefer-dark-theme = true;
            gtk-decoration-layout = "menu:";
            gtk-enable-event-sounds = false;
            gtk-enable-input-feedback-sounds = false;
        };

        gtk4.extraConfig = {
            gtk-application-prefer-dark-theme = true;
            gtk-decoration-layout = "menu:";
            gtk-enable-event-sounds = false;
            gtk-enable-input-feedback-sounds = false;
        };

        iconTheme = {
            name = "MoDelta";
        };

        theme = {
            name = "phocus";
        };
    };

    home.pointerCursor = {
        name = "phinger-cursors-light";
        package = pkgs.phinger-cursors;
        size = 24;
        gtk.enable = true;
        x11.enable = true;
    };
}
