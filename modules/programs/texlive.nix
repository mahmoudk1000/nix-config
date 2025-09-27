{
  programs.texlive = {
    enable = true;
    extraPackages = tpkgs: {
      inherit (tpkgs)
        biblatex
        latexmk
        latexindent
        chktex
        collection-basic
        amsfonts
        collection-latexrecommended
        collection-fontsrecommended
        fontspec
        collection-fontsextra
        scheme-basic
        enumitem
        datetime
        fancyhdr
        lipsum
        varwidth
        eulervm
        needspace
        biblatex-trad
        biblatex-software
        xkeyval
        xurl
        xifthen
        titlesec
        moderncv
        luatexbase
        ;
    };
  };
}
