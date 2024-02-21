{
  programs.texlive = {
    enable = true;
    extraPackages = tpkgs: {
      inherit (tpkgs)
      biblatex
      latexmk
      collection-basic
      collection-latexrecommended
      collection-fontsrecommended
      collection-fontsextra
      scheme-basic;
    };
  };
}
