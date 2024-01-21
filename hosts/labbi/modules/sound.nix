{ config
, pkgs
, lib
, ...
}:

let
  quantum = 64;
  rate = 48000;
  qr = "${toString quantum}/${toString rate}";
  json = pkgs.formats.json { };
in 
{
  # Sound.
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    audio.enable = true;
    jack.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };
  sound.enable = true;

  systemd.user.services.pipewire.environment.LADSPA_PATH = lib.makeSearchPathOutput "lib" "lib/ladspa" (with pkgs; [
      rnnoise-plugin
      lsp-plugins
  ]);

  environment.etc = lib.mkIf (config.services.pipewire.enable) {
    "pipewire/pipewire.d/99-lowlatency.conf".source = json.generate "99-lowlatency.conf" {
      context.properties.default.clock.min-quantum = quantum;
    };

    "pipewire/pipewire-pulse.d/99-lowlatency.conf".source = json.generate "99-lowlatency.conf" {
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
          pulse.min.req = qr;
          pulse.min.quantum = qr;
          pulse.min.frag = qr;
          server.address = [ "unix:native" ];
        };
      }
      ];

      stream.properties = {
        node.latency = qr;
        resample.quality = 1;
      };
    };

    "wireplumber/main.lua.d/99-alsa-lowlatency.lua".text = ''
      alsa_monitor.rules = {
        {
          matches = {{{ "node.name", "matches", "alsa_output.*" }}};
          apply_properties = {
            ["audio.format"] = "S32LE",
            ["audio.rate"] = ${toString (rate * 2)},
            ["api.alsa.period-size"] = 2,
          },
        },
      }
    '';

    "wireplumber/bluetooth.lua.d/51-bluez-config.lua".text = ''
      bluez_monitor.properties = {
        ["bluez5.enable-sbc-xq"] = true,
        ["bluez5.enable-msbc"] = true,
        ["bluez5.enable-hw-volume"] = true,
        ["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
      }
    '';
  };
}
