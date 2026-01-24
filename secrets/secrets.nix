let
  users = {
    mahmoud = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPcSp0c90xKLAua7JAqhqZkueVTpDcKhOm1AdeFoyFTX";
    farouk = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILGLdoOZLtDMy5O+ed8TMUvxY8QW1T3gkl7BqtgMGDVG";
  };
in
{
  # Users
  "users/mahmoud.age".publicKeys = users.mahmoud;
  "users/farouk.age".publicKeys = users.farouk;

  # Accounts
  "accounts/personal.age".publicKeys = users.mahmoud;
  "accounts/secondary.age".publicKeys = users.mahmoud;
  "accounts/work.age".publicKeys = users.mahmoud;
  "accounts/uni.age".publicKeys = users.mahmoud;
}
