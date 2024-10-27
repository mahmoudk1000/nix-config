{ pkgs, ... }:

{
  imports = [ ./awedots.nix ];

  xsession.windowManager = {
    awesome = {
      package = pkgs.awesome-git;
      awedots.enable = false;
      luaModules = with pkgs.luaPackages; [
        luafilesystem
        luarocks
        luaposix
        vicious
        dkjson
        ldbus
        http
        lgi
      ];
    };
  };
}
