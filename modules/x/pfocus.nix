{ pkgs
, theme
, ...
}:

pkgs.stdenvNoCC.mkDerivation rec {
  name = "pfocus";

  src = pkgs.fetchFromGitHub {
    owner = "mahmoudk1000";
    repo = "phocus-gtk";
    rev = "96cde9959e949f19dc3fcd03ff992dda9808ef4f";
    sha256 = "sha256-ENpuCIgkR4fp8sRbxRFGEx6h0pWwb4IkYY7WSuBz37s=";
  };

  patches = [ ./colors.diff ];

  postPatch = with theme; ''
    substituteInPlace scss/gtk-3.0/_colors.scss \
      --replace "@bg0@" "#${base00}" \
      --replace "@bg1@" "#${base02}" \
      --replace "@bg2@" "#${base09}" \
      --replace "@bg3@" "#${base02}" \
      --replace "@bg4@" "#${base09}" \
      --replace "@red@" "#${base03}" \
      --replace "@red_light@" "#${base0A}" \
      --replace "@orange@" "#FCBF8D" \
      --replace "@orange_light@" "#FDD9BB" \
      --replace "@yellow@" "#${base05}" \
      --replace "@yellow_light@" "#${base0C}" \
      --replace "@green@" "#${base04}" \
      --replace "@green_light@" "#${base0B}" \
      --replace "@blue@" "#${base06}" \
      --replace "@blue_light@" "#${base0D}" \
      --replace "@purple@" "#${base07}" \
      --replace "@purple_light@" "#${base0E}" \
      --replace "@cyan@" "#${base08}" \
      --replace "@cyan_light@" "#${base0F}" \
  '';

  nativeBuildInputs = with pkgs; [ sassc ];

  installFlags = [ "DESTDIR=$(out)" "PREFIX=" ];
}
