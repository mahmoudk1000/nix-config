{ pkgs, ... }:

{
  imports = [ ./awedots.nix ];

  xsession.windowManager = {
    awesome = {
      package = pkgs.awesome-git;
      awedots.enable = false;
      # Awesome 4.3 is built against lua5.1, so its lua modules must be too.
      luaModules = with pkgs.lua51Packages; [
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
