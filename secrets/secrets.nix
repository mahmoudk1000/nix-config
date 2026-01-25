let
  users = {
    mahmoud = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPcSp0c90xKLAua7JAqhqZkueVTpDcKhOm1AdeFoyFTX";
    farouk = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILGLdoOZLtDMy5O+ed8TMUvxY8QW1T3gkl7BqtgMGDVG";
  };

  systems = {
    labbi = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPcSp0c90xKLAua7JAqhqZkueVTpDcKhOm1AdeFoyFTX";
    zanpakuto = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILGLdoOZLtDMy5O+ed8TMUvxY8QW1T3gkl7BqtgMGDVG";
  };

  personal = [
    users.mahmoud
    systems.labbi
  ];

  work = [
    users.farouk
    systems.zanpakuto
  ];
in
{
  # Users
  "users/mahmoud.age".publicKeys = personal;
  "users/farouk.age".publicKeys = work;

  # Accounts
  "accounts/personal.age".publicKeys = personal;
  "accounts/secondary.age".publicKeys = personal;
  "accounts/work.age".publicKeys = personal;
  "accounts/uni.age".publicKeys = personal;
}
