{ pkgs, ... }:

{
  programs = {
    adb.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    java = {
      enable = true;
      package = pkgs.jdk;
    };
    zsh = {
      enable = true;
      interactiveShellInit = ''
        command_not_found_handler() {
          echo -e "nope, \e[31m'$0'\e[0m didn't work."; return 127
        }
      '';
    };
    command-not-found.enable = false;
  };
}
