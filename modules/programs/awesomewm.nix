{ pkgs
, ...
}:

{
  xsession.windowManager = {
    awesome = {
      package = pkgs.awesome-git;
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
