{ config, pkgs, ... }:

{
    xsession.windowManager = {
        awesome = {
            luaModules = with pkgs.luaPackages; [
                luafilesystem
                luadbi-mysql
                luarocks
                luaposix
                vicious
                ldbus
            ];
        };
    };
}
