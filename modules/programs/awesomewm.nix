{ config, pkgs, ... }:

{
    xsession.windowManager = {
        awesome = {
            luaModules = with pkgs.luaPackages; [
              luafilesystem
              luarocks-nix
              luaposix
              vicious
              ldbus
            ];
        };
    };
}
