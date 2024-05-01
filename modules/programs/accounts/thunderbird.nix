{ pkgs, theme, ... }:

{
  programs = {
    mbsync = { enable = true; };
    msmtp = { enable = false; };
    mu = { enable = false; };
    neomutt = {
      enable = false;
      vimKeys = true;
      sort = "date-received";
      checkStatsInterval = 60;
      sidebar = {
        enable = true;
        shortPath = true;
        width = 25;
      };
    };
    thunderbird = {
      enable = true;
      package = pkgs.thunderbird.override {
        extraPolicies = {
          DisableTelemetry = true;
          DisableThunderbirdStudies = true;
        };
      };
      profiles = {
        personal = {
          isDefault = true;
          withExternalGnupg = true;
          settings = import ./settings.nix;
          userChrome = import ./userChrome.nix { inherit theme; };
          userContent = import ./userContent.nix { inherit theme; };
        };
      };
    };
  };
}
