{ pkgs, ... }:

{
  programs = {
    eza = {
      enable = true;
      git = true;
      icons = true;
      enableZshIntegration = true;
      extraOptions = [
        "--header"
        "--group-directories-first"
        "--octal-permissions"
      ];
    };
    bat = {
      enable = true;
      config = {
        theme = "base16";
      };
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batman
        batgrep
        batwatch
        batpipe
      ];
    };
  };
}
