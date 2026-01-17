{
  host,
  ...
}:

{
  networking.hostName = "${host.hostName}";

  services = {
    openssh = {
      enable = true;
      ports = [ 22 ];
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
      hostKeys = [
        {
          path = "/home/${host.username}/.ssh/id_ed25519";
          type = "ed25519";
        }
      ];
    };
  };
}
