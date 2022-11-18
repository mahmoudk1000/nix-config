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
            neovim-nightly

            psmisc
            ytmdl
            mpc-cli
            ncmpcpp
            xclip
            pfetch
            spotdl
            irssi
            ventoy-bin

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
            thunderbird
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
            notable

            libsForQt5.breeze-icons
            xorg.xmodmap
            cudatoolkit

            python3Full
        ];

        sessionVariables = {
            BROWSER = "firefox";
            EDITOR = "neovim";
            TERMINAL = "urxvt";
            SSH_AUTH_SOCK = "$(gpgconf --list-dirs agent-ssh-socket)";
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
            # command = "herbstluftwm";
        };
    };

    systemd.user.startServices = "sd-switch";
}

