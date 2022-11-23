{ config, pkgs, ... }:

{
    programs.gpg.enable = true;
    services.gpg-agent = {
        enable = true;
        defaultCacheTtl = 1800;
        enableSshSupport = true;
        pinentryFlavor = "gnome3";
    };
}
