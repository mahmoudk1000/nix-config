{ pkgs, ... }:

{
  imprts = [ ./awedots.nix ];

  xsession.windowManager = {
    awesome = {
      package = pkgs.awesome-git;
      awedots = false;
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
