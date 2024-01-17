{ config, pkgs, ... }:

{
    # Networking
    networking  = {
        hostName = "labbi";
        wireless = {
            iwd.enable = true;
            interfaces = [ "wlan0" ];
        };
        useDHCP = false;
        interfaces.wlan0.useDHCP = true;
        interfaces.enp2s0.useDHCP = true;
    };

    # NextDNS
    services.nextdns = {
        enable = true;
        arguments = [
            "-config" "b28d16"
            "-report-client-info"
            "-auto-activate"
        ];
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
