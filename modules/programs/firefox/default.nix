{
  config,
  pkgs,
  lib,
  theme,
  host,
  font,
  ...
}:

let
  settings = import ./settings.nix { inherit theme; };
  userChrome = import ./userChrome.nix { inherit theme font; };
  userContent = import ./userContent.nix { inherit theme font; };
  customAddons = import ./addons.nix {
    inherit lib;
    inherit (pkgs.nur.repos.rycee.firefox-addons) buildFirefoxXpiAddon;
  };
in
{
  programs.firefox = {
    enable = true;
    languagePacks = [
      "en-US"
      "de"
      "ar"
    ];
    policies = import ./policies.nix { inherit config host; };
    profiles = {
      default = {
        id = 0;
        name = "${host.hostName}";
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
        extensions =
          with pkgs.nur.repos.rycee.firefox-addons;
          [
            ublock-origin
            privacy-badger
            bitwarden
            clearurls
            link-cleaner
            decentraleyes
            duckduckgo-privacy-essentials
            libredirect
            privacy-badger
            languagetool
            tab-session-manager
            search-by-image
          ]
          ++ (with customAddons; [ startpage ]);
        inherit settings userChrome userContent;
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
            name = "Atos";
            bookmarks = [
              {
                name = "MyAtos";
                tags = [ "atos" ];
                keyword = "myatos";
                url = "https://www.myatos.net/irj/portal";
              }
              {
                name = "Percipio";
                tags = [ "atos" ];
                keyword = "percipio";
                url = "https://atos.percipio.com/";
              }
            ];
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
        ];
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          bitwarden
          languagetool
          tab-session-manager
          lastpass-password-manager
        ];
        inherit settings;
      };
    };
  };
}
