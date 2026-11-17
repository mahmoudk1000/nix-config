{
  lib,
  pkgs,
  inputs,
  theme,
  font,
  host ? {
    isWSL = false;
  },
  ...
}:

let
  inherit (host) isWSL;
  winUser = (host // { windowsUser = host.username; }).windowsUser;

  linuxLua = import ./linux.nix {
    inherit
      lib
      theme
      font
      host
      ;
  };

  wslLua = import ./wsl.nix {
    inherit
      lib
      theme
      font
      host
      ;
  };
in
{
  config = {
    programs.wezterm = {
      enable = true;
      package = inputs.wezterm.packages.${pkgs.system}.default;
      enableZshIntegration = true;
      extraConfig = linuxLua;
    };
  }
  // lib.optionalAttrs (isWSL && winUser != null) {
    home.file."/mnt/c/Users/${winUser}/.wezterm.lua".text = wslLua;
  };
}
