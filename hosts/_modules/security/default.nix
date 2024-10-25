{ lib, ... }:

{
  security = {
    rtkit.enable = true;
    polkit = {
      enable = true;
      extraConfig = ''
        /* Allow members of the wheel group to execute any actions
         * without password authentication, similar to "sudo NOPASSWD:"
         */
        polkit.addRule(function(action, subject) {
          if (subject.isInGroup("wheel")) {
            return polkit.Result.YES;
          }
        });
      '';
    };
    pam = {
      sshAgentAuth = {
        enable = true;
        # Check: https://github.com/NixOS/nixpkgs/issues/31611
        authorizedKeysFiles = lib.mkForce [ "/etc/ssh/authorized_keys.d/%u" ];
      };
      services.login = {
        sshAgentAuth = true;
        gnupg.enable = true;
      };
    };
  };
}
