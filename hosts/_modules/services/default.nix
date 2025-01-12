{
  pkgs,
  lib,
  host,
  ...
}:

{
  services = {
    gvfs = {
      enable = true;
      package = lib.mkForce pkgs.gvfs.override {
        samba = null;
        gnomeSupport = false;
        udevSupport = true;
      };
    };
    udisks2.enable = true;
    upower.enable = true;
    blueman.enable = true;
    printing.enable = true;
    tumbler.enable = true;
    dbus = {
      enable = true;
      implementation = "broker";
    };
  };

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = lib.mkDefault "no";
    };
    hostKeys = [
      {
        path = "/home/${host.username}/.ssh/id_rsa";
        type = "rsa";
      }
      {
        path = "/home/${host.username}/.ssh/id_ed25519";
        type = "ed25519";
      }
    ];
  };

  # TLP. (https://linrunner.de/tlp/settings/)
  services.tlp = {
    enable = true;
    settings = {
      # CPU
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;

      CPU_HWP_DYN_BOOST_ON_AC = 0;
      CPU_HWP_DYN_BOOST_ON_BAT = 1;

      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";

      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "balanced";

      # Battery
      # START_CHARGE_THRESH_BAT0 = 25;
      # STOP_CHARGE_THRESH_BAT0 = 80;

      # Radio Device
      DEVICES_TO_ENABLE_ON_STARTUP = "wifi";
      DEVICES_TO_DISABLE_ON_STARTUP = "bluetooth";

      # Network Connect
      DEVICES_TO_DISABLE_ON_LAN_CONNECT = "wifi";
      DEVICES_TO_ENABLE_ON_LAN_DISCONNECT = "wifi";
    };
  };
}
