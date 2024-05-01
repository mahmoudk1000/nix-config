{ config, lib, pkgs, ... }:

let cfg = config.services.pipewire.lowLatency;
in {
  options = {
    services.pipewire = {
      lowLatency = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable low latency mode";
        };
        quantum = {
          min = lib.mkOption {
            type = lib.types.int;
            default = 64;
            description = "Minimum quantum size";
          };
          def = lib.mkOption {
            type = lib.types.int;
            default = 1024;
            description = "Default quantum size";
          };
          max = lib.mkOption {
            type = lib.types.int;
            default = 2048;
            description = "Maximum quantum size";
          };
        };
        rate = lib.mkOption {
          type = lib.types.int;
          default = 48000;
          description = "Sample rate";
        };
      };
    };
  };

  config = lib.mkIf cfg.enable {
    services.pipewire.extraConfig = lib.mkIf (config.services.pipewire.enable) {
      pipewire."92-low-latency" = {
        context.properties = {
          default.clock.rate = cfg.rate;
          default.clock.quantum = cfg.quantum.def;
          default.clock.min-quantum = cfg.quantum.min;
          default.clock.max-quantum = cfg.quantum.max;
        };
      };
      pipewire-pulse."92-low-latency" = {
        context.modules = [
          {
            name = "libpipewire-module-rtkit";
            args = {
              nice.level = -15;
              rt.prio = 88;
              rt.time.soft = 200000;
              rt.time.hard = 200000;
            };
            flags = [ "ifexists" "nofail" ];
          }
          {
            name = "libpipewire-module-protocol-pulse";
            args = {
              pulse.min.req =
                "${toString cfg.quantum.min}/${toString cfg.rate}";
              pulse.default.req =
                "${toString cfg.quantum.min}/${toString cfg.rate}";
              pulse.max.req =
                "${toString cfg.quantum.min}/${toString cfg.rate}";
              pulse.min.quantum =
                "${toString cfg.quantum.min}/${toString cfg.rate}";
              pulse.max.quantum =
                "${toString cfg.quantum.min}/${toString cfg.rate}";
              server.address = [ "unix:native" ];
            };
          }
        ];
        stream.properties = {
          node.latency = "${toString cfg.quantum.min}/${toString cfg.rate}";
          resample.quality = 1;
        };
      };
    };

    services.pipewire.wireplumber.configPackages =
      lib.mkIf (config.services.pipewire.enable) [
        (pkgs.writeTextDir
          "share/wireplumber/main.lua.d/99-alsa-lowlatency.lua" ''
            alsa_monitor.rules = {
              {
                matches = {{{ "node.name", "matches", "alsa_output.*" }}};
                apply_properties = {
                  ["audio.format"] = "S32LE",
                  ["audio.rate"] = ${toString (cfg.rate * 2)},
                  ["api.alsa.period-size"] = 2,
                  -- ["api.alsa.disable-batch"] = true,
                },
              },
            }
          '')
        (pkgs.writeTextDir
          "share/wireplumber/bluetooth.lua.d/51-bluez-config.lua" ''
            bluez_monitor.properties = {
              ["bluez5.enable-sbc-xq"] = true,
              ["bluez5.enable-msbc"] = true,
              ["bluez5.enable-hw-volume"] = true,
              ["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
            }
          '')
      ];
  };
}
