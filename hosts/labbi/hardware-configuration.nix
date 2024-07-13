# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  modulesPath,
  ...
}:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "ahci"
        "usb_storage"
        "sd_mod"
        "sr_mod"
      ];
      kernelModules = [
        "dm-snapshot"
        "nvidia"
      ];
    };
    blacklistedKernelModules = [
      "snd_pcsp"
      "pcspkr"
    ];
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };

  fileSystems."/" = {
    device = "/dev/linux/os";
    fsType = "xfs";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/nix";
    fsType = "vfat";
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-label/HOME";
    fsType = "ext4";
  };

  swapDevices = [ ];

  powerManagement = {
    cpuFreqGovernor = lib.mkDefault "powersave";
  };
  nixpkgs.hostPlatform = "x86_64-linux";
  nix.settings.max-jobs = lib.mkDefault 8;
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
