{ config, pkgs, ... }:

{
    imports = [
        ./modules/programs
        ./modules/services
        ./modules/x
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
            tmux
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
            irssi
            ventoy-bin
            rssguard

            st
            ranger
            arandr
            imagemagick
            rtorrent
            feh
            conky

            zoom-us
            lite-xl
            inkscape
            freetube
            libreoffice
            discord
            teams
            zotero
            anki-bin
            spotify
            tdesktop
            element-desktop
            signal-desktop
            foliate
            obsidian
            netbeans
            zotero
            evince
            mpv
            gimp
            krita
            bitwarden

            libsForQt5.breeze-icons
            xorg.xmodmap

            python3Full
        ];

        sessionVariables = {
            BROWSER = "firefox";
            EDITOR = "nvim";
            VISUAL = "nvim";
            TERMINAL = "urxvt";
        };
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
            bspwm.enable = false;
            herbstluftwm.enable = true;
        };
    };

    systemd.user.startServices = "sd-switch";
}

