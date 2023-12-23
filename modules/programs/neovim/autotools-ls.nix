{ pkgs, ... }:

let
    tree-sitter-lsp = pkgs.python3.pkgs.buildPythonPackage rec {
        pname = "tree-sitter-lsp";
        version = "0.0.10";
        format = "pyproject";
        src = pkgs.fetchPypi {
            inherit pname version;
            hash = "sha256-88/rVY/yTcOEexZU6W9/l+LjLEo+QXl/thGRrp2CDGU=";
        };
        propagatedBuildInputs = with pkgs.python311Packages; [
            colorama
            jinja2
            jsonschema
            pygls
            tree-sitter
        ];
        nativeBuildInputs = with pkgs.python311Packages; [
            setuptools
            setuptools-generate
            setuptools-scm
        ];
    };

    tree-sitter-languages = pkgs.python3.pkgs.buildPythonPackage rec {
        pname = "tree-sitter-languages";
        version = "1.8.0";
        format = "wheel";
        src = pkgs.fetchurl {
            url = "https://files.pythonhosted.org/packages/7a/07/7ee99ec9222cf5f1505bfb34c95c8acddd49debad6848d9ff555e2b56817/tree_sitter_languages-1.8.0-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
            hash = "sha256-ltva/50xfRk0UbxbVmCYcXCWOB1nZ0+eZfuPDr6YyEc=";
        };
        propagatedBuildInputs = with pkgs.python311Packages; [
            tree-sitter
            tree-sitter-lsp
        ];
    };
in 
pkgs.python3.pkgs.buildPythonPackage rec {
    pname = "autotools-language-server";
    version = "0.0.13";
    format = "pyproject";
    src = pkgs.fetchPypi {
        inherit pname version;
        hash = "sha256-xYHGmDeVyXrDzVqmpqaAKylaVB+hj+grZBF+sHAvFQg=";
    };
    propagatedBuildInputs = with pkgs; [
        tree-sitter-languages
    ];
    nativeBuildInputs = with pkgs.python311Packages; [
        setuptools
        setuptools-generate
        setuptools-scm
    ];
}
