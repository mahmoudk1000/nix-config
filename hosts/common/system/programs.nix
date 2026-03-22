{
  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    zsh = {
      enable = true;
    };
    command-not-found.enable = false;
  };
}
