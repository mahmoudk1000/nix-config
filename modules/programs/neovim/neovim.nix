{ config, pkgs, inputs, ... }:

let
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
        ];
    };

    autotools-language-server = pkgs.python3.pkgs.buildPythonPackage rec {
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
    };
in
{
    programs.neovim = {
        enable = true;
        extraLuaConfig = builtins.readFile ./init.lua;
        package = pkgs.neovim-nightly;
        vimAlias = true;
        withPython3 = true;
        withNodeJs = true;
        defaultEditor = true;
        extraPackages = with pkgs; [
            docker-compose-language-service
            autotools-language-server
            ansible-language-server
            yaml-language-server
            java-language-server
            lua-language-server
            terraform-lsp
            quick-lint-js
            terraform-ls
            ansible-lint
            nixpkgs-fmt
            tree-sitter
            shellcheck
            marksman
            yamllint
            rnix-lsp
            yamlfmt
            ripgrep
            helm-ls
            tflint
            texlab
            taplo
            shfmt
            glow
            gcc
        ]
        ++ (with nodePackages_latest; [
            dockerfile-language-server-nodejs
            typescript-language-server
            bash-language-server
        ])
        ++ (with python310Packages; [
            jedi
            pylint
            pynvim
            pyls-isort
            pycodestyle
            python-lsp-black
            python-lsp-server
            jedi-language-server
        ]);
        plugins = with pkgs.vimPlugins; [

            {
                plugin = nvim-treesitter.withAllGrammars;
                type = "lua";
                config = builtins.readFile ./config/treesitter.lua;
            }
            {
                plugin = alpha-nvim;
                type = "lua";
                config = builtins.readFile ./config/alpha.lua;
            }
            {
                plugin = bufferline-nvim;
                type = "lua";
                config = builtins.readFile ./config/bufferline.lua;
            }
            {
                plugin = indent-blankline-nvim;
                type = "lua";
                config = builtins.readFile ./config/indent.lua;
            }
            {
                plugin = nvim-lspconfig;
                type = "lua";
                config = builtins.readFile ./config/lspconfig.lua;
            }
            {
                plugin = lualine-nvim;
                type = "lua";
                config = builtins.readFile ./config/lualine.lua;
            }
            {
                plugin = neo-tree-nvim;
                type = "lua";
                config = builtins.readFile ./config/neotree.lua;
            }
            {
                plugin = toggleterm-nvim;
                type = "lua";
                config = builtins.readFile ./config/toggleterm.lua;
            }
            {
                plugin = nvim-cmp;
                type = "lua";
                config = builtins.readFile ./config/cmp.lua;
            }
            {
                plugin = which-key-nvim;
                type = "lua";
                config = builtins.readFile ./config/whichkey.lua;
            }
            {
                plugin = mason-nvim;
                type = "lua";
                config = builtins.readFile ./config/mason.lua;
            }
            auto-pairs
            cmp-buffer
            cmp-cmdline
            cmp-nvim-lsp
            cmp-path
            cmp-git
            cmp_luasnip
            comment-nvim
            colorizer
            mason-lspconfig-nvim
            dressing-nvim
            fzf-vim
            nui-nvim
            nvim-web-devicons
            nvim-ts-autotag
            gitsigns-nvim
            impatient-nvim
            luasnip
            lspkind-nvim
            neoscroll-nvim
            tmux-nvim
            popup-nvim
            telescope-fzf-native-nvim
            telescope-nvim
            vim-fugitive
            vim-gitgutter
            vim-nix
            vim-rhubarb
            vim-sleuth
            vim-surround
            vim-unimpaired
            vim-terraform
            vim-yaml
            ansible-vim
            vimwiki
            playground
            friendly-snippets
            fidget-nvim
            glow-nvim
            jedi-vim
            vim-shellcheck
            Jenkinsfile-vim-syntax

        ];
    };
}
