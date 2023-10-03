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
        extraOutputsToInstall = [ "man" ];
        packages = with pkgs; [

            vim
            unzip
            curl
            wget
            jq
            playerctl
            pamixer
            isync
            bitwarden-cli
            pass
            libnotify

            psmisc
            mpc-cli
            ncmpcpp
            xclip
            pfetch
            spotdl
            ventoy-bin
            yt-dlp
            
            ffmpeg
            arandr
            imagemagick
            rtorrent
            nsxiv
            conky

            st
            zoom-us
            inkscape
            freetube
            libreoffice
            discord
            anki-bin
            spotify
            tdesktop
            element-desktop
            foliate
            obsidian
            evince
            mpv
            krita
            popcorntime
            teams

            libsForQt5.breeze-icons
            xorg.xmodmap

            # work
            terraform
            terraform-inventory
            ansible
            kubernetes-helm
            kubernetes
            minikube
            kubectl
            docker-compose

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
            # command = "2bwm";
            bspwm.enable = false;
            herbstluftwm.enable = false;
            awesome.enable = true;
        };
    };

    systemd.user.startServices = "sd-switch";
}

