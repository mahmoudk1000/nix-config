{ config, labbi }:

{
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
}
