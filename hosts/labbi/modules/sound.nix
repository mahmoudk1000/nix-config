{ pkgs
, lib
, ...
}:

{
  imports = [
    ./lowLatency.nix
  ];

  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    lowLatency = {
      enable = true;
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
}
