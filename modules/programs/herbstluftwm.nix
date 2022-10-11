{ config, pkgs, ... }:

{
    xsession = {
        enable = true;
        windowManager.herbstluftwm = {
            enable = true;
            keybinds = {
                
            };
        };
    };
}
