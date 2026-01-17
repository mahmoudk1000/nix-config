{
  config,
  pkgs,
  lib,
  ...
}:

{
  # Virtualisation
  programs.virt-manager.enable = lib.mkIf config.virtualisation.libvirtd.enable true;

  virtualisation = {
    docker = {
      enable = true;
    };
    libvirtd = {
      enable = true;
      onShutdown = "shutdown";
      qemu = {
        package = pkgs.qemu_kvm;
        swtpm.enable = true;
      };
    };
  };

  # Zram
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 64;
  };
}
