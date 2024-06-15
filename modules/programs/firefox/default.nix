{
  config,
  pkgs,
  theme,
  ...
}:

{
  programs.firefox = {
    enable = true;
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
        Search = true;
        Pocket = false;
        Snippets = false;
        TopSites = false;
        Highlights = false;
      };
      Cookies = {
        Default = true;
        AcceptThirdParty = "always";
        ExpireAtSessionEnd = false;
        RejectTracker = true;
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
      DNSOverHTTPS = {
        Enabled = true;
        Locked = true;
        ProviderURL = "https://dns.nextdns.io/b28d16";
      };
      Extensions.Uninstall = [
        "1und1@search.mozilla.org"
        "allegro-pl@search.mozilla.org"
        "amazon@search.mozilla.org"
        "amazondotcn@search.mozilla.org"
        "amazondotcom@search.mozilla.org"
        "azerdict@search.mozilla.org"
        "baidu@search.mozilla.org"
        "bing@search.mozilla.org"
        "bok-NO@search.mozilla.org"
        "ceneji@search.mozilla.org"
        "coccoc@search.mozilla.org"
        "daum-kr@search.mozilla.org"
        "ddg@search.mozilla.org"
        "ebay@search.mozilla.org"
        "ecosia@search.mozilla.org"
        "eudict@search.mozilla.org"
        "faclair-beag@search.mozilla.org"
        "gmx@search.mozilla.org"
        "google@search.mozilla.org"
        "gulesider-NO@search.mozilla.org"
        "leo_ende_de@search.mozilla.org"
        "longdo@search.mozilla.org"
        "mailcom@search.mozilla.org"
        "mapy-cz@search.mozilla.org"
        "mercadolibre@search.mozilla.org"
        "mercadolivre@search.mozilla.org"
        "naver-kr@search.mozilla.org"
        "odpiralni@search.mozilla.org"
        "pazaruvaj@search.mozilla.org"
        "priberam@search.mozilla.org"
        "prisjakt-sv-SE@search.mozilla.org"
        "qwant@search.mozilla.org"
        "qwantjr@search.mozilla.org"
        "rakuten@search.mozilla.org"
        "readmoo@search.mozilla.org"
        "salidzinilv@search.mozilla.org"
        "seznam-cz@search.mozilla.org"
        "twitter@search.mozilla.org"
        "tyda-sv-SE@search.mozilla.org"
        "vatera@search.mozilla.org"
        "webde@search.mozilla.org"
        "wikipedia@search.mozilla.org"
        "wiktionary@search.mozilla.org"
        "wolnelektury-pl@search.mozilla.org"
        "yahoo-jp-auctions@search.mozilla.org"
        "yahoo-jp@search.mozilla.org"
        "yandex@search.mozilla.org"
      ];
    };
    profiles = {
      mahmoud = {
        id = 0;
        name = "mahmoud";
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
          user_pref("media.ffmpeg.vaapi.enabled", true);
          user_pref("media.rdd-vpx.enabled", true);
        '';
        settings = import ./settings.nix;
        userChrome = import ./userChrome.nix { inherit theme; };
        userContent = import ./userContent.nix { inherit theme; };
      };
    };
  };
}
