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
      sshAgentAuth.enable = true;
      services.login = {
        sshAgentAuth = true;
        gnupg.enable = true;
      };
    };
  };
}
