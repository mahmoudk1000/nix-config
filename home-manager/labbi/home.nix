{ config, pkgs, ... }:

{
    imports = [
        ../../modules/programs
        ../../modules/services
        ../../modules/x
    ];

    home = {
        username = "mahmoud";
        homeDirectory = "/home/mahmoud";
        stateVersion = "22.05";
        packages = with pkgs; [
            vim
            unzip
            curl
            wget
            jq
            playerctl
            pamixer

            psmisc
            ytmdl
            mpc-cli
            ncmpcpp
            xclip
            pfetch
            spotdl
            ventoy-bin
            yt-dlp
            st

            ranger
            arandr
            imagemagick
            rtorrent
            nsxiv
            conky

            zoom-us
            lite-xl
            inkscape
            freetube
            libreoffice
            discord
            anki-bin
            spotify
            tdesktop
            element-desktop
            signal-desktop
            foliate
            obsidian
            netbeans
            evince
            mpv
            gimp
            krita
            bitwarden
            popcorntime

            libsForQt5.breeze-icons
            xorg.xmodmap
            hsetroot
        ] ++ (import ../../modules/scripts { inherit pkgs; });
    };

    xdg = {
        userDirs = {
            enable = true;
            documents = "\$HOME/docs";
            download = "\$HOME/download";
            music = "\$HOME/musik";
            pictures = "\$HOME/pics";
            videos = "\$HOME/videos";
        };
    };

    programs = {
        home-manager.enable = true;
        nix-index ={
            enable = true;
            enableZshIntegration = true;
        };
    };

    xsession = {
        enable = true;
        windowManager = {
            command = "2bwm";
            bspwm.enable = false;
            herbstluftwm.enable = false;
        };
    };

    systemd.user.startServices = "sd-switch";
}

