{ lib, buildFirefoxXpiAddon, ... }:

{
  startpage = buildFirefoxXpiAddon rec {
    pname = "startpage";
    version = "3.1.1";
    addonId = "{5c012457-9c2d-4f94-8f1e-285afa7ae0e2}";
    url = "https://github.com/mahmoudk1000/${pname}/releases/download/${version}/${pname}-${version}.xpi";
    sha256 = "sha256-F16v4esxac87QrFSAra3wmfe15dxIGCOW3LvrRqZ5fU=";
    meta = with lib; {
      homepage = "https://github.com/mahmoudk1000/startpage";
      description = "This extension replaces the default startpage";
      license = licenses.gpl3;
      platforms = platforms.all;
    };
  };
}
