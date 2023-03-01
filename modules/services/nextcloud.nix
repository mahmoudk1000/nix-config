{ config, pkgs, ... }:

{
    services.nextcloud-client = {
        enable = false;
        package = pkgs.nextcloud-client;
        startInBackground = true;
    };
}
