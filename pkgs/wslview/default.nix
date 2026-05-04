{
  stdenv,
  emptyDirectory,
}:

stdenv.mkDerivation {
  name = "wslview";
  src = emptyDirectory;

  passAsFile = [
    "desktopFile"
  ];

  desktopFile = ''
    [Desktop Entry]
    Name=WSLView
    Comment=Open files and addresses in Windows
    Icon=windows
    Exec=wslview %U
    Terminal=false
    Type=Application
    Categories=Utility;
    MimeType=x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/file
  '';

  installPhase = ''
    mkdir -p $out/bin $out/share/applications
    cp ${./wslview} $out/bin/wslview
    chmod +x $out/bin/wslview
    cp $desktopFilePath $out/share/applications/wslview.desktop
  '';
}
