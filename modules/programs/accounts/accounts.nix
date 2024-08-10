{ config, pkgs, ... }:

{
  age.secrets.accounts = {
    personal.file = ../../../secrets/accounts/personal.age;
    kind.file = ../../../secrets/accounts/kind.age;
    work.file = ../../../secrets/accounts/work.age;
    uni.file = ../../../secrets/accounts/uni.age;
  };

  accounts.email.maildirBasePath = ".mail";
  accounts.email.accounts = {
    mahmoudk1000 = {
      primary = true;
      flavor = "gmail.com";
      address = "mahmoudk1000@gmail.com";
      realName = "Mahmoud Asran";
      userName = "mahmoudk1000@gmail.com";
      maildir.path = "mahmoudk1000";
      passwordCommand = "${pkgs.coreutils}/bin/cat ${config.secrets.accounts.personal.path}";
      signature = {
        text = ''
          --
          Mahmoud Ayman
          <mahmoudk1000@gmail.com>
        '';
      };
      imap = {
        host = "imap.gmail.com";
        tls.enable = true;
      };
      smtp = {
        host = "smtp.gmail.com";
        tls.enable = true;
      };
      offlineimap = {
        enable = true;
        extraConfig.remote = {
          folderfilter = "lambda name: name not in ['[Gmail]/All Mail']";
        };
      };
      mbsync = {
        enable = true;
        create = "both";
        expunge = "both";
        extraConfig.remote = {
          UseNamespace = "no";
        };
      };
      imapnotify = {
        enable = true;
        boxes = [ "Inbox" ];
        onNotifyPost = ''${pkgs.libnotify}/bin/notify-send "New Mail: mahmoudk1000@gmail.com!"'';
        onNotify = "${pkgs.isync}/bin/mbsync -a";
      };
      thunderbird = {
        enable = true;
        profiles = [ "personal" ];
      };
    };

    dodok1000 = {
      flavor = "gmail.com";
      address = "dodok1000@gmail.com";
      realName = "Mahmoud Asran";
      userName = "dodok1000@gmail.com";
      maildir.path = "dodok1000";
      passwordCommand = "${pkgs.coreutils}/bin/cat ${config.secrets.accounts.kind.path}";
      signature = {
        text = ''
          --
          Mahmoud Ayman
          <dodok1000@gmail.com>
        '';
      };
      imap = {
        host = "imap.gmail.com";
      };
      smtp = {
        host = "smtp.gmail.com";
        tls.enable = true;
      };
      offlineimap = {
        enable = true;
        extraConfig.remote = {
          folderfilter = "lambda name: name not in ['[Gmail]/All Mail']";
        };
      };
      mbsync = {
        enable = true;
        create = "both";
        expunge = "both";
        extraConfig.remote = {
          UseNamespace = "no";
        };
      };
      imapnotify = {
        enable = true;
        boxes = [ "Inbox" ];
        onNotifyPost = ''${pkgs.libnotify}/bin/notify-send "New Mail: dodok1000@gmail.com!"'';
        onNotify = "${pkgs.isync}/bin/mbsync -a";
      };
      thunderbird = {
        enable = true;
        profiles = [ "personal" ];
      };
    };

    "mahmoud.a.asran" = {
      flavor = "outlook.office365.com";
      address = "mahmoud.a.asran@outlook.com";
      realName = "Mahmoud Asran";
      userName = "mahmoud.a.asran@outlook.com";
      maildir.path = "mahmoud.a.asran";
      passwordCommand = "${pkgs.coreutils}/bin/cat ${config.secrets.accounts.work.path}";
      signature = {
        text = ''
          --
          Mahmoud Asran
          <mahmoud.a.asran@outlook.com>
        '';
      };
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
        expunge = "both";
        extraConfig.remote = {
          UseNamespace = "no";
        };
      };
      imapnotify = {
        enable = true;
        boxes = [ "Inbox" ];
        onNotifyPost = ''${pkgs.libnotify}/bin/notify-send "New Mail: mahmoud.a.asran@outlook.com!"'';
        onNotify = "${pkgs.isync}/bin/mbsync -a";
      };
      thunderbird = {
        enable = true;
        profiles = [ "personal" ];
      };
    };

    university = {
      flavor = "outlook.office365.com";
      address = "sim.mahmoudayman3129@alexu.edu.eg";
      realName = "Mahmoud Asran";
      userName = "sim.mahmoudayman3129@alexu.edu.eg";
      maildir.path = "university";
      passwordCommand = "${pkgs.coreutils}/bin/cat ${config.secrets.accounts.uni.path}";
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
        enable = false;
        create = "both";
        expunge = "both";
        patterns = [ "*" ];
        extraConfig = {
          account = {
            AuthMechs = "XOAUTH2";
          };
          remote = {
            UseNamespace = "no";
          };
        };
      };
      imapnotify = {
        enable = false;
        boxes = [ "Inbox" ];
        onNotifyPost = ''${pkgs.libnotify}/bin/notify-send "New Mail: sim.mahmoudayman3129@alexu.edu.eg!"'';
        onNotify = "${pkgs.isync}/bin/mbsync -a";
      };
      thunderbird = {
        enable = true;
        profiles = [ "personal" ];
      };
    };
  };
}
