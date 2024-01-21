{ pkgs
, ...
}:

pkgs.stdenv.mkDerivation rec {
  pname = "groovy-language-server";
  version = "4866a3f";

  src = ./groovy_ls/.;

  dontUnpack = true;
  dontBuild = true;

  nativeBuildInputs = with pkgs; [ makeWrapper jre ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin $out/share/java/
    cp -r $src/*.jar $out/share/java/
    makeWrapper ${pkgs.jdk}/bin/java $out/bin/${pname} \
      --add-flags "-jar $out/share/java/groovy-language-server-all.jar"

    runHook postInstall
  '';
}
