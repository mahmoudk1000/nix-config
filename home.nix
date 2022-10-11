{ config, pkgs, ... }:

{
    imports = (import ./modules/programs) ++ (import ./modules/services) ++ (import ./modules/x);

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
            neovim

            python3
            psmisc
            htop
            ytmdl
            mpc-cli
            ncmpcpp
            xclip
            pfetch
            any-nix-shell

            st
            ranger
            arandr
            imagemagick
            rtorrent
            feh
            conky

            firefox
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
            nextcloud-client
            ventoy-bin
            tdesktop
            element-desktop
            signal-desktop
            foliate
            obsidian
            vscode
            netbeans
            zotero
            evince
            xarchiver
            mpv
            gimp
            krita
            bitwarden
            libsForQt5.breeze-icons
            xorg.xmodmap
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
            music = "\$HOME/musik4";
            pictures = "\$HOME/pics";
            videos = "\$HOME/videos";
        };
    };

    programs = {
        home-manager.enable = true;
        command-not-found.enable = true;
        autojump = {
            enable = true;
            enableZshIntegration = true;
        };
    };

    xsession = {
        enable = true;
        windowManager = {
            bspwm.enable = true;
        };
    };

    systemd.user.startServices = "sd-switch";
}

