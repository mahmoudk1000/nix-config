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
          default = "ddg";
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
            "Home Manager Options" = {
              definedAliases = [
                "@homemanager"
                "@hm"
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              urls = [
                {
                  template = "https://home-manager-options.extranix.com/";
                  params = [
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                    {
                      name = "release";
                      value = "master";
                    }
                  ];
                }
              ];
            };
            "NixOS Wiki" = {
              urls = [ { template = "https://nixos.wiki/index.php?search={searchTerms}"; } ];
              icon = "https://nixos.wiki/favicon.png";
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
              icon = "https://upload.wikimedia.org/wikipedia/commons/1/13/Arch_Linux_%22Crystal%22_icon.svg";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [ "@arch" ];
            };
            wikipedia.metaData.alias = "@wiki";
            google.metaData.hidden = true;
            amazondotcom-us.metaData.hidden = true;
            bing.metaData.hidden = true;
            ebay.metaData.hidden = true;
          };
        };
        extensions = {
          packages =
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
        };
        inherit settings userChrome userContent;
      };
    };
  };
}
