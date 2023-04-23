{ config
, pkgs
, theme
, ... 
}:

{
    accounts.email.accounts = {
        mahmoudk1000 = {
            primary = true;
            flavor = "gmail.com";
            address = "mahmoudk1000@gmail.com";
            realName = "Mahmoud Asran";
            userName = "mahmoudk1000@gmail.com";
            passwordCommand = "pass show Mail/mahmoudk1000";
            imap = {
                host = "imap.gmail.com";
            };
            smtp = {
                host = "smtp.gmail.com";
                tls.enable = true;
            };
            offlineimap.enable = true;
            offlineimap.extraConfig.remote = {
                folderfilter = "lambda name: name not in ['[Gmail]/All Mail']";
            };
            mbsync = {
                enable = true;
                create = "both";
                patterns = [ "*" ];
                extraConfig.remote = {
                    UseNamespace = "no";
                };
            };
            imapnotify = {
                enable = true;
                boxes = ["Inbox" "*"];
                onNotifyPost = {
                    mail = "${pkgs.libnotify}/bin/notify-send 'New Mail: mahmoudk1000@gmail.com!'";
                };
                onNotify = "${pkgs.isync}/bin/mbsync -a";
            };
            thunderbird.enable = true;
        };
        dodok1000 = {
            flavor = "gmail.com";
            address = "dodok1000@gmail.com";
            realName = "Mahmoud Asran";
            userName = "dodok1000@gmail.com";
            passwordCommand = "pass show Mail/dodok1000";
            imap = {
                host = "imap.gmail.com";
            };
            smtp = {
                host = "smtp.gmail.com";
                tls.enable = true;
            };
            offlineimap.enable = true;
            offlineimap.extraConfig.remote = {
                folderfilter = "lambda name: name not in ['[Gmail]/All Mail']";
            };
            mbsync = {
                enable = true;
                create = "both";
                patterns = [ "*" ];
                extraConfig.remote = {
                    UseNamespace = "no";
                };
            };
            imapnotify = {
                enable = true;
                boxes = [ "Inbox" ];
                onNotifyPost = {
                    mail = "${pkgs.libnotify}/bin/notify-send 'New Mail: dodok1000@gmail.com!'";
                };
                onNotify = "${pkgs.isync}/bin/mbsync -a";
            };
            thunderbird.enable = true;
        };
        "mahmoud.a.asran" = {
            flavor = "outlook.office365.com";
            address = "mahmoud.a.asran@outlook.com";
            realName = "Mahmoud Asran";
            userName = "mahmoud.a.asran@outlook.com";
            passwordCommand = "pass show Mail/mahmoud.asran";
            imap = {
                host = "outlook.office365.com";
                port = 993;
                tls.enable = true;
            };
            smtp = {
                host = "smtp.office365.com";
                port = 587;
                tls.enable = true;
            };
            offlineimap.enable = true;
            mbsync = {
                enable = true;
                create = "both";
                patterns = [ "*" ];
                extraConfig.remote = {
                    UseNamespace = "no";
                };
            };
            imapnotify = {
                enable = true;
                boxes = [ "Inbox" ];
                onNotifyPost = {
                    mail = "${pkgs.libnotify}/bin/notify-send 'New Mail: mahmoud.a.asran@outlook.com!'";
                };
                onNotify = "${pkgs.isync}/bin/mbsync -a";
            };
            thunderbird.enable = true;
        };
        uni = {
            flavor = "outlook.office365.com";
            address = "sim.mahmoudayman3129@alexu.edu.eg";
            realName = "Mahmoud Asran";
            userName = "sim.mahmoudayman3129@alexu.edu.eg";
            passwordCommand = "pass show Mail/uni";
            imap = {
                host = "outlook.office365.com";
                port = 993;
                tls.enable = true;
            };
            smtp = {
                host = "smtp.office365.com";
                port = 587;
                tls.enable = true;
            };
            offlineimap.enable = true;
            mbsync = {
                enable = true;
                create = "both";
                patterns = [ "*" ];
                extraConfig.remote = {
                    UseNamespace = "no";
                };
            };
            imapnotify = {
                enable = true;
                boxes = ["Inbox" ];
                onNotifyPost = {
                    mail = "${pkgs.libnotify}/bin/notify-send 'New Mail: sim.mahmoudayman3129@alexu.edu.eg!'";
                };
                onNotify = "${pkgs.isync}/bin/mbsync -a";
            };
            thunderbird.enable = true;
        };
    };

    programs = {
        mbsync = {
            enable = true;
        };
        thunderbird = {
            enable = true;
            package = pkgs.thunderbird;
            profiles = {
                mahmoud = {
                    isDefault = true;
                };
            };
            settings = {
                # General
                "general.useragent.override" = "";
                "general.warnOnAboutConfig" = false;
                "gfx.downloadable_fonts.disable_cache" = true;
                "privacy.donottrackheader.enabled" = true;
                "dom.webaudio.enabled" = false;
                "media.video_stats.enabled" = false;
                "geo.enabled" = false;
                "browser.search.geoip.timeout" = 1;

                # Disable cookie tracking and history
                "network.cookie.cookieBehavior" = 1;
                "network.cookie.lifetimePolicy" = 2;
                "network.cookie.prefsMigrated" = true;
                "places.history.enabled" = false;

                # Disable telemetry data for Mozilla
                "datareporting.policy.dataSubmissionEnabled" = false;
                "toolkit.telemetry.enabled" = false;
                "toolkit.telemetry.unified" = false;
                "toolkit.telemetry.server" = "";
            };
        };
    };
    services.imapnotify.enable = true;
}
