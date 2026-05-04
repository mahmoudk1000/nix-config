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
