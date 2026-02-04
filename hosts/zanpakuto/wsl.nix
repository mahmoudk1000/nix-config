{
  host,
  ...
}:

{
  wsl = {
    enable = true;
    defaultUser = "${host.username}";
    startMenuLaunchers = true;
    usbip = {
      enable = true;
    };
    wslConf = {
      interop = {
        enabled = true;
        appendWindowsPath = true;
      };
      automount.root = "/mnt";
      network = {
        generateHosts = true;
      };
    };
  };

  systemd = {
    services = {
      "serial-getty@ttyS0".enable = false;
      "serial-getty@hvc0".enable = false;
      "getty@tty1".enable = false;
      "autovt@".enable = false;
      firewall.enable = false;
      systemd-udevd.enable = false;
      systemd-resolved.enable = false;
    };

    enableEmergencyMode = false;
  };
}
