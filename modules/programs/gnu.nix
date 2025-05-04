{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs = {
    eza = {
      enable = true;
      git = true;
      icons = "auto";
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
        pager = "less -FR";
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
    btop = {
      enable = true;
      settings = {
        color_theme = "Default";
        theme_background = false;
        vim_keys = true;
      };
    };
  };

  home.sessionVariables = lib.mkIf config.programs.btop.enable {
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT = "-c";
  };
}
