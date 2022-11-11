{ config, pkgs, ... }:

{

    accounts.email = {
        maildirBasePath = "Mail";
        accounts = {
            "mahmoudk1000@gmail.com" = {
                primary = true;
                address = "mahmoudk1000@gmail.com";
                userName = "Mahmoud Ayman";
                realName = "H. M. Test";
                passwordCommand = "password-command";
                imap.host = "imap.example.com";
                smtp.host = "smtp.example.com";
            };
            hm-account = {
                address = "hm@example.org";
                userName = "home.manager.jr";
                realName = "H. M. Test Jr.";
                passwordCommand = "password-command 2";
                imap.host = "imap.example.org";
                smtp.host = "smtp.example.org";
                smtp.tls.useStartTls = true;
            };
        };
    };


    accounts.email.accounts = {
        "mahmoudk1000@gmail.com" = {
            userName = "Mahmoud A. Asran";
            thunderbird = {
                enable = true;
                profiles = [ "first" ];
            };
            imap = {
              port = 123;
              tls.enable = true;
            };
            smtp.port = 456;
        }
    };

    programs.thunderbird = {
        enable = true;
        profiles = {
            first = {
                isDefault = true;
                withExternalGnupg = true;
            };
            second.settings = { "second.setting" = "some-test-setting"; };
        };
        settings = {
            "general.useragent.override" = "";
            "privacy.donottrackheader.enabled" = true;
        };
    };
}
