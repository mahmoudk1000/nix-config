{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    includes = [
      "~/.ssh/conf.d/*"
    ];
    settings = {
      "*" = {
        AddKeysToAgent = "yes";
        ForwardAgent = false;
        Compression = true;
        ServerAliveInterval = 30;
        ServerAliveCountMax = 3;
        HashKnownHosts = true;
        forwardX11 = false;
        ControlMaster = "no";
        ControlPersist = "no";
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
