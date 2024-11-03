{ lib, buildFirefoxXpiAddon, ... }:

{
  startpage = buildFirefoxXpiAddon rec {
    pname = "startpage";
    version = "3.1.1";
    addonId = "{ebb9ebb2-93b4-44bb-a335-f4b0d0030dc9}";
    url = "https://github.com/mahmoudk1000/${pname}/releases/download/${version}/${pname}-${version}.xpi";
    sha256 = "sha256-l0kf45K1OSu9pu+sygzw14HXbBMjyNWweZmbZMdR+8g=";
    meta = with lib; {
      homepage = "https://github.com/mahmoudk1000/startpage";
      description = "This extension replaces the default startpage";
      license = licenses.gpl3;
      platforms = platforms.all;
    };
  };
}
