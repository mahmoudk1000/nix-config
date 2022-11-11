{ pkgs, ... }:

{
    programs.autorandr = {
        enable = true;
        hooks = {
                postswitch = {
                "dunstify" = "dunstify 'Display profile' -t 1000 \"$AUTORANDR_CURRENT_PROFILE\"";
            };
        };
        profiles = {
            "desktop" = {
                fingerprint = {
                eDP1 = "00ffffffffffff0009e5290700000000011b01049522137802b09097585492261d5054000000010101010101010101010101010101013c3780de703814403020360058c11000001a000000000000000000000000000000000000000000fe00424f452043510a202020202020000000fe004e5431353646484d2d4e34310a008e";
                HDMI1 = "";
            };
            config = {
                    eDP1 = {
                        enable = true;
                        crtc = 0;
                        primary = true;
                        position = "1920x0";
                        mode = "1920x1080";
                        gamma = "1.075:1.0:0.909";
                        rate = "90.00";
                    };
                    HDMI1 = {
                        enable = true;
                        crtc = 1;
                        primary = false;
                        position = "0x0";
                        mode = "1920x1080";
                        gamma = "1.075:1.0:0.909";
                        rate = "60.00";
                    };
                };
            };
        };
    };
}
