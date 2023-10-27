{ config, lib, pkgs, theme, ...  }:

let
    conkyWidgetEnabled = false;

    apiKey = "a89384ad87d37345cca9848d9e0b477f";
    cityId = "361058";
    url = ''"https://api.openweathermap.org/data/2.5/weather?id=${cityId}&appid=${apiKey}&cnt=5&units=metric&lang=en"'';

    klima = pkgs.writeScriptBin "klima" ''
        ${pkgs.curl}/bin/curl -s ${url} -o ~/.cache/weather.json
    '';

    description = pkgs.writeScriptBin "description" ''
        ${pkgs.coreutils}/bin/cat ~/.cache/weather.json | ${pkgs.jq}/bin/jq -r '.weather[0].description' | ${pkgs.gnused}/bin/sed 's/[^ ]*/\u&/g'
    '';

    conky-config = pkgs.writeText "conky-config" ''
        conky.config = {
        -- Size and Position settings --
            alignment = 'top_left',
            gap_x = 48,
            gap_y = 35,
            maximum_width = 500,
            minimum_height = 70,
            minimum_width = 420,
        -- Text settings --
            use_xft = true,
            font = 'Iosevkat:size=9',
        -- Color Settings --
            default_color = '${theme.base09}',
            color1 = '${theme.base01}',
        -- Window Settings --
            background = false,
            border_width = 0,
            draw_shades = false,
            own_window = true,
            own_window_colour = '000000',
            own_window_class = 'Conky',
            own_window_argb_visual = false,
            own_window_type = 'desktop',
            own_window_transparent = true,
            own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',
            stippled_borders = 0,
        -- Others --
            double_buffer = true,
            extra_newline = false,
            update_interval = 1,
        }
        conky.text = [[
        ''${execi 600 ${klima}/bin/klima}\
        ''${offset -5}''${voffset 0}''${font Iosevka:style=Heavy Extended:size=35}''${color}''${time %H.%M} \
        ''${offset -18}''${voffset -20}''${color}''${font Iosevka:style=Heavy Extended:size=11}''${execi 1 ${pkgs.mpc-cli}/bin/mpc current | ${pkgs.gnused}/bin/sed -r 's/ - /\n/g' | ${pkgs.coreutils}/bin/head -1}
        ''${offset 145}''${voffset -3}''${color}''${font Iosevka:style=Heavy Extended:size=13}''${execi 1 ${pkgs.mpc-cli}/bin/mpc current | ${pkgs.gnused}/bin/sed -r 's/ - /\n/g' | ${pkgs.coreutils}/bin/tail -1}
        ''${offset 0}''${voffset 5}''${font Iosevka:style=Heavy Extended:size=13}''${color1}''${execi 600 ${pkgs.coreutils}/bin/cat ~/.cache/weather.json | ${pkgs.jq}/bin/jq '.main.temp'}°C\
        ''${offset 10}''${voffset 0}''${font Iosevka:style=Heavy Extended:size=13}''${color}''${execi 600 ${description}/bin/description}
        ]]
    '';
in
{
    home.packages = lib.mkIf conkyWidgetEnabled [
      pkgs.conky
    ];

    config = lib.mkIf conkyWidgetEnabled {
        systemd.user.services.conky = {
        Unit = {
            Description = "Conky System Monitor";
            PartOf = "graphical-session.target";
        };
        Service = {
            Type = "forking";
            ExecStart = ''
                ${pkgs.bash}/bin/bash -c '${pkgs.conky}/bin/conky --daemonize -c ${conky-config}'
            '';
            OOMPolicy = "kill";
        };
    };
    systemd.user.timers.conky = {
        Timer = {
            OnActiveSec = "10s";
            AccuracySec = "1s";
        };
        Install = { WantedBy = [ "graphical-session.target" ]; };
        };
    };
}
