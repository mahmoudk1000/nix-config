{ config, pkgs, ... }:

{
    services.unclutter = {
        enable = true;
        timeout = 2;
    };
}
