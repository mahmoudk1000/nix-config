{ pkgs, theme, ... }:

pkgs.stdenvNoCC.mkDerivation {
  name = "phocus";
  version = "96cde99";

  src = pkgs.fetchFromGitHub {
    owner = "mahmoudk1000";
    repo = "phocus-gtk";
    rev = "96cde9959e949f19dc3fcd03ff992dda9808ef4f";
    sha256 = "sha256-ENpuCIgkR4fp8sRbxRFGEx6h0pWwb4IkYY7WSuBz37s=";
  };

  patches = [ ./colors.diff ];

  postPatch = with theme; ''
    substituteInPlace scss/gtk-3.0/_colors.scss \
      --replace-warn "@bg0@" "${base00}" \
      --replace-warn "@bg1@" "${base02}" \
      --replace-warn "@bg2@" "${base0A}" \
      --replace-warn "@bg3@" "${base02}" \
      --replace-warn "@bg4@" "${base0A}" \
      --replace-warn "@red@" "${base03}" \
      --replace-warn "@red_light@" "${base0A}" \
      --replace-warn "@orange@" "#FCBF8D" \
      --replace-warn "@orange_light@" "#FDD9BB" \
      --replace-warn "@yellow@" "${base05}" \
      --replace-warn "@yellow_light@" "${base0C}" \
      --replace-warn "@green@" "${base04}" \
      --replace-warn "@green_light@" "${base0D}" \
      --replace-warn "@blue@" "${base06}" \
      --replace-warn "@blue_light@" "${base0D}" \
      --replace-warn "@purple@" "${base07}" \
      --replace-warn "@purple_light@" "${base0E}" \
      --replace-warn "@cyan@" "${base08}" \
      --replace-warn "@cyan_light@" "${base0F}"
  '';

  nativeBuildInputs = with pkgs; [
    sass
  ];

  buildPhase = ''
    runHook preBuild
    mkdir -p gtk-3.0
    sass scss/gtk-3.0/gtk.scss gtk-3.0/gtk.css
    runHook postBuild
  '';

  installFlags = [
    "DESTDIR=$(out)"
    "PREFIX="
  ];
}
