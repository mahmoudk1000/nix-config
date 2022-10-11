{ config, pkgs, ... }:

{
    services.betterlockscreen = {
        enable = true;
        inactiveInterval = 300;
    };
}
