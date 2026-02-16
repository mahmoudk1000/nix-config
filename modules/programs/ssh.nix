{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    includes = [
      "~/.ssh/conf.d/*"
    ];
    matchBlocks = {
      "*" = {
        addKeysToAgent = "yes";
        forwardAgent = false;
        forwardX11 = false;
        serverAliveInterval = 30;
        serverAliveCountMax = 3;
        hashKnownHosts = true;
        compression = true;
        controlMaster = "no";
        controlPersist = "no";
      };
    };
    extraConfig = ''
      # Pass terminal type properly
      SendEnv TERM COLORTERM

      # Optimizations
      Compression yes
      TCPKeepAlive yes

      # Reuse connections
      ControlMaster auto
      ControlPath ~/.ssh/control-%C
      ControlPersist 2h

      ## Security
      PreferredAuthentications publickey,keyboard-interactive,password
      StrictHostKeyChecking ask

      # Enable pipelining
      EnableEscapeCommandline yes
    '';
  };
}
