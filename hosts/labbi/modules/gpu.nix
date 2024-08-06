{ config, pkgs, ... }:

{
  services.xserver.videoDrivers = [
    "intel"
    "nvidia"
  ];

  hardware = {
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      modesetting.enable = true;
      prime = {
        offload.enable = true;
        nvidiaBusId = "PCI:01:00:0";
        intelBusId = "PCI:00:02:0";
      };
      powerManagement = {
        enable = true;
        finegrained = true;
      };
    };
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
  };
}
