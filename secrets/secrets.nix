let
  users = {
    mahmoud = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPcSp0c90xKLAua7JAqhqZkueVTpDcKhOm1AdeFoyFTX";
    farouk = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILGLdoOZLtDMy5O+ed8TMUvxY8QW1T3gkl7BqtgMGDVG ww930\a930850@DESKTOP-J3DV8C4";
  };

  hosts = {
    labbi = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPcSp0c90xKLAua7JAqhqZkueVTpDcKhOm1AdeFoyFTX";
  };

  default = [
    users.mahmoud
    hosts.labbi
  ];

  work = [
    users.farouk
  ];
in
{
  # Users
  "users/mahmoud.age".publicKeys = default;
  "users/farouk.age".publicKeys = work;

  # Accounts
  "accounts/personal.age".publicKeys = default;
  "accounts/secondary.age".publicKeys = default;
  "accounts/work.age".publicKeys = default;
  "accounts/uni.age".publicKeys = default;
}
