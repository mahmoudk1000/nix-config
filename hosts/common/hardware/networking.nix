{
  config,
  pkgs,
  host,
  ...
}:

{
  # Networking
  networking = {
    inherit (host) hostName;
    hosts = {
      "127.0.0.1" = [
        "local"
        "localhost"
        "${config.networking.hostName}.lab"
        "${config.networking.hostName}.local"
      ];
    };
    wireless = {
      iwd.enable = true;
      interfaces = [ "wlan0" ];
    };
    useDHCP = false;
    interfaces.wlan0.useDHCP = true;
    interfaces.enp2s0.useDHCP = true;
  };

  # NextDNS
  services = {
    nextdns = {
      enable = false;
      arguments = [
        "-config set"
        "-profile wlan0=b28d16"
        "-report-client-info"
        "-auto-activate"
      ];
    };
    resolved = {
      enable = true;
      settings = {
        Resolve = {
          DNSOverTLS = true;
          DNS = [
            "45.90.28.0#${config.networking.hostName}-b28d16.dns.nextdns.io"
            "2a07:a8c0::#${config.networking.hostName}-b28d16.dns.nextdns.io"
            "45.90.30.0#${config.networking.hostName}-b28d16.dns.nextdns.io"
            "2a07:a8c1::#${config.networking.hostName}-b28d16.dns.nextdns.io"
          ];
        };
      };
    };
  };

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez;
    powerOnBoot = false;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };
}
