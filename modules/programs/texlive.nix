{
  programs.texlive = {
    enable = true;
    extraPackages = tpkgs: {
      inherit (tpkgs)
        biblatex latexmk latexindent chktex collection-basic
        collection-latexrecommended collection-fontsrecommended
        collection-fontsextra scheme-basic;
    };
  };
}
