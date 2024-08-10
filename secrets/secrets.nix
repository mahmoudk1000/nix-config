let
  users = {
    mahmoud = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPcSp0c90xKLAua7JAqhqZkueVTpDcKhOm1AdeFoyFTX";
  };

  hosts = {
    labbi = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPcSp0c90xKLAua7JAqhqZkueVTpDcKhOm1AdeFoyFTX";
  };

  default = [
    users.mahmoud
    hosts.labbi
  ];
in
{
  # Users
  "users/mahmoud.age".publicKeys = default;

  # Accounts
  "accounts/personal.age".publicKeys = default;
  "accounts/kind.age".publicKeys = default;
  "accounts/work.age".publicKeys = default;
  "accounts/uni.age".publicKeys = default;

}
