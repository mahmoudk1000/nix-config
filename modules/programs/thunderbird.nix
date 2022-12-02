{ config, pkgs, theme, ... }:

{
    programs.thunderbird = {
        enable = true;
        package = pkgs.thunderbird;
        profiles = {
            mahmoud = {
                isDefault = true;
            };
        };
        settings = {
            # Themeing
            "browser.display.background_color" = theme.base00;
            "browser.anchor_color" = theme.base06;
            "browser.display.foreground_color" = theme.base01;
            "browser.visited_color" = theme.base06;

            # General
            "general.warnOnAboutConfig" = false;
            "gfx.downloadable_fonts.disable_cache" = true;
            "privacy.donottrackheader.enabled" = true;
            "dom.webaudio.enabled" = false;
            "media.video_stats.enabled" = false;
            "geo.enabled" = false;
            "browser.search.geoip.timeout" = 1;

            # Disable cookie tracking and history
            "network.cookie.cookieBehavior" = 1;
            "network.cookie.lifetimePolicy" = 2;
            "network.cookie.prefsMigrated" = true;
            "places.history.enabled" = false;

            # Disable telemetry data for Mozilla
            "datareporting.policy.dataSubmissionEnabled" = false;
            "toolkit.telemetry.enabled" = false;
            "toolkit.telemetry.unified" = false;
            "toolkit.telemetry.server" = "";
        };
    };

    systemd.user.services.thunderbird = {
        Unit.PartOf = [ "graphical-session.target" ];
        Install.WantedBy = [ "graphical-session.target" ];
        Service = {
            ExecStart = ''
                ${pkgs.thunderbird}/bin/thunderbird
            '';
            Restart = "on-failure";
        };
    };
}
