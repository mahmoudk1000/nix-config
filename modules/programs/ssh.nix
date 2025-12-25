{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        addKeysToAgent = "yes";
        forwardAgent = true;
        serverAliveInterval = 30;
        serverAliveCountMax = 3;
        hashKnownHosts = false;
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

      # Latency optimizations
      ServerAliveCountMax 3
      ConnectTimeout 10

      # Enable pipelining
      EnableEscapeCommandline yes
    '';
  };
}
