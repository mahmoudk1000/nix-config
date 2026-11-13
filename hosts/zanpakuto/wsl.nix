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
        appendWindowsPath = false;
      };
      automount.root = "/mnt";
      network = {
        generateHosts = true;
      };
    };
    extraBin = [
      { src = "/mnt/c/Windows/System32/cmd.exe"; }
      { src = "/mnt/c/Program Files/PowerShell/7/pwsh.exe"; }
      { src = "/mnt/c/Windows/System32/clip.exe"; }
      { src = "/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe"; }
      { src = "/mnt/c/Windows/system32/wsl.exe"; }
      { src = "/mnt/c/Windows/explorer.exe"; }
      { src = "/mnt/c/Windows/System32/rundll32.exe"; }
    ];
  };

  systemd = {
    services = {
      "autovt@".enable = false;
      firewall.enable = false;
      "getty@tty1".enable = false;
      "serial-getty@hvc0".enable = false;
      "serial-getty@ttyS0".enable = false;
      systemd-resolved.enable = false;
      systemd-udevd.enable = false;
      "user@".serviceConfig.Delegate = "memory pids cpu cpuset";
    };

    enableEmergencyMode = false;
  };

  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = "1";
    "net.ipv4.ip_unprivileged_port_start" = 80;
  };
}
