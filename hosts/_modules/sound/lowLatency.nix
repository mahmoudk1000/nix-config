{ config, lib, ... }:

let
  cfg = config.services.pipewire.lowLatency;
in
{
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
    services.pipewire.extraConfig = lib.mkIf config.services.pipewire.enable {
      pipewire."92-low-latency" = {
        context.properties = {
          default.clock = {
            inherit (cfg) rate;
            quantum = cfg.quantum.def;
            min-quantum = cfg.quantum.min;
            max-quantum = cfg.quantum.max;
          };
        };
      };
      pipewire-pulse."92-low-latency" = {
        context.modules = [
          {
            name = "libpipewire-module-rtkit";
            args = {
              nice.level = -15;
              rt = {
                prio = 88;
                time.soft = 200000;
                time.hard = 200000;
              };
            };
            flags = [
              "ifexists"
              "nofail"
            ];
          }
          {
            name = "libpipewire-module-protocol-pulse";
            args = {
              pulse = {
                min.req = "${toString cfg.quantum.min}/${toString cfg.rate}";
                default.req = "${toString cfg.quantum.min}/${toString cfg.rate}";
                max.req = "${toString cfg.quantum.min}/${toString cfg.rate}";
                min.quantum = "${toString cfg.quantum.min}/${toString cfg.rate}";
                max.quantum = "${toString cfg.quantum.min}/${toString cfg.rate}";
              };
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

    services.pipewire.wireplumber.extraConfig = lib.mkIf config.services.pipewire.enable {
      main."92-low-latency" = {
        "monitor.alsa.rules" = [
          {
            matches = [ { "device.name" = "~alsa_card.*"; } ];
            actions = {
              update-props = {
                "audio.format" = "S32LE";
                "audio.rate" = "${toString (cfg.rate * 2)}";
                "api.alsa.period-size" = 2;
                "api.alsa.disable-batch" = false;
              };
            };
          }
        ];
      };
      bluetooth."10-bluez" = {
        "monitor.bluez.rules" = [
          {
            matches = [ { "device.name" = "~bluez_card.*"; } ];
            actions = {
              update-props = {
                "bluez5.roles" = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]";
                "bluez5.a2dp.ldac.quality" = "hq";
                "bluez5.enable-msbc" = true;
                "bluez5.enable-sbc-xq" = true;
                "bluez5.enable-hw-volume" = true;
              };
            };
          }
        ];
      };
    };
  };
}
