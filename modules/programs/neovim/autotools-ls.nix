{ pkgs, ... }:

with pkgs;

let
  lsp-tree-sitter = python3.pkgs.buildPythonPackage rec {
    pname = "lsp-tree-sitter";
    version = "0.0.14";
    format = "pyproject";
    src = pkgs.fetchPypi {
      inherit pname version;
      hash = "sha256-2ut/eo2uLrB1oQ7M8iH5hhm9xoEajeVqmrkYTePCe4g=";
    };

    propagatedBuildInputs = with pkgs.python3Packages; [
      colorama
      jinja2
      jsonschema
      pygls
      tree-sitter
    ];

    nativeBuildInputs = with pkgs.python3Packages; [
      setuptools
      setuptools-generate
      setuptools-scm
    ];
  };

  makeLS = fetchGit {
    name = "vender_make";
    url = "https://github.com/alemuller/tree-sitter-make.git";
    rev = "a4b9187417d6be349ee5fd4b6e77b4172c6827dd";
  };

  tree-sitter-languages = python3.pkgs.buildPythonPackage rec {
    pname = "tree-sitter-languages";
    version = "1.10.2";
    src = pkgs.fetchFromGitHub {
      owner = "grantjenks";
      repo = "py-${pname}";
      rev = "42f4baffec92848be4937b0cc52b2872201fe322";
      hash = "sha256-AuPK15xtLiQx6N2OATVJFecsL8k3pOagrWu1GascbwM=";
    };

    buildInputs = with pkgs.python3Packages; [
      tree-sitter
      cython
    ];

    buildPhase = ''
      runHook preBuild

      ${python3.pythonOnBuildForHost.interpreter} - <<EOF
      from tree_sitter import Language

      Language.build_library(
        "tree_sitter_languages/languages.so",
          [
            "${makeLS}"
          ]
        )
      EOF

      ${python3.pythonOnBuildForHost.interpreter} setup.py bdist_wheel

      runHook postBuild
    '';
  };
in
python3.pkgs.buildPythonPackage rec {
  pname = "autotools-language-server";
  version = "0.0.15";
  format = "pyproject";

  src = pkgs.fetchPypi {
    inherit pname version;
    hash = "sha256-sNznwFdw4UuJejofBi2FPF7wB3TQH5buqAvQRpPp5tA=";
  };

  propagatedBuildInputs = with pkgs; [
    tree-sitter-languages
    lsp-tree-sitter
  ];

  nativeBuildInputs = with pkgs.python3Packages; [
    setuptools
    setuptools-generate
    setuptools-scm
  ];
}
