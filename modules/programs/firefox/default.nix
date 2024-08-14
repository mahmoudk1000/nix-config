{
  config,
  pkgs,
  theme,
  labbi,
  ...
}:

{
  programs.firefox = {
    enable = true;
    languagePacks = [
      "en-US"
      "de"
      "ar"
    ];
    policies = {
      AppAutoUpdate = false;
      BackgroundAppUpdate = false;
      DisableAppUpdate = true;
      DefaultDownloadDirectory = "${config.xdg.userDirs.download}";
      CaptivePortal = false;
      ExtensionUpdate = false;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DisableFirefoxAccounts = false;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      OfferToSaveLoginsDefault = false;
      PasswordManagerEnabled = false;
      PrimaryPassword = false;
      HardwareAcceleration = true;
      FirefoxHome = {
        Locked = true;
        Search = true;
        Pocket = false;
        Snippets = false;
        TopSites = false;
        Highlights = false;
        SponsoredPocket = false;
        SponsoredTopSites = false;
      };
      Cookies = {
        Default = true;
        Behavior = "accept";
        BehaviorPrivateBrowsing = "reject";
        RejectTracker = true;
      };
      SanitizeOnShutdown = {
        Enabled = false;
        Locked = true;
      };
      EnableTrackingProtection = {
        Value = true;
        EmailTracking = true;
        Cryptomining = true;
        Fingerprinting = true;
        Locked = true;
      };
      UserMessaging = {
        ExtensionRecommendations = false;
        SkipOnboarding = true;
        WhatsNew = false;
        FeatureRecomendations = false;
        UrlbarInterventions = false;
        MoreFromMozilla = false;
      };
      # DNSOverHTTPS = {
      #   Enabled = true;
      #   Locked = true;
      #   ProviderURL = "https://dns.nextdns.io/b28d16/${labbi.hostName}";
      # };
    };
    profiles = {
      default = {
        id = 0;
        name = "${labbi.hostName}";
        search = {
          force = true;
          default = "DuckDuckGo";
          engines = {
            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "type";
                      value = "packages";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };
            "NixOS Wiki" = {
              urls = [ { template = "https://nixos.wiki/index.php?search={searchTerms}"; } ];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [ "@nw" ];
            };
            "Arch Wiki" = {
              urls = [
                {
                  template = "https://wiki.archlinux.org/index.php";
                  params = [
                    {
                      name = "search";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              iconUpdateURL = "https://upload.wikimedia.org/wikipedia/commons/1/13/Arch_Linux_%22Crystal%22_icon.svg";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [ "@arch" ];
            };
            "Wikipedia (en)".metaData.alias = "@wiki";
            "Google".metaData.hidden = true;
            "Amazon.com".metaData.hidden = true;
            "Bing".metaData.hidden = true;
            "eBay".metaData.hidden = true;
          };
        };
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          privacy-badger
          bitwarden
          clearurls
          decentraleyes
          duckduckgo-privacy-essentials
          libredirect
          privacy-badger
          languagetool
          tab-session-manager
          search-by-image
        ];
        extraConfig = ''
          user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
          user_pref("full-screen-api.ignore-widgets", true);
        '';
        settings = import ./settings.nix;
        userChrome = import ./userChrome.nix { inherit theme; };
        userContent = import ./userContent.nix { inherit theme; };
      };
      work = {
        id = 1;
        name = "Work";
        search = {
          force = true;
          default = "DuckDuckGo";
          engines = {
            "Wikipedia (en)".metaData.alias = "@wiki";
            "Google".metaData.hidden = true;
            "Amazon.com".metaData.hidden = true;
            "Bing".metaData.hidden = true;
            "eBay".metaData.hidden = true;
          };
        };
        bookmarks = [
          {
            name = "MyAtos";
            tags = [ "atos" ];
            keyword = "myatos";
            url = "https://www.myatos.net/irj/portal";
          }
          {
            name = "Microsoft 365";
            toolbar = true;
            bookmarks = [
              {
                name = "Outlook";
                tags = [ "office365" ];
                url = "https://outlook.office.com/";
              }
              {
                name = "Teams";
                tags = [ "office365" ];
                url = "https://teams.microsoft.com/v2/";
              }
            ];
          }
          {
            name = "Percipio";
            tags = [ "atos" ];
            keyword = "percipio";
            url = "https://atos.percipio.com/";
          }
        ];
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          bitwarden
          languagetool
          tab-session-manager
          lastpass-password-manager
        ];
        extraConfig = ''
          user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
          user_pref("full-screen-api.ignore-widgets", true);
        '';
        settings = import ./settings.nix;
      };
    };
  };
}
