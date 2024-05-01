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
      profiles = {
        personal = {
          isDefault = true;
          withExternalGnupg = true;
          userChrome = import ./userChrome.nix;
          userContent = import ./userContent.nix;
        };
      };
      settings = import ./settings.nix;
    };
  };
}
