{ config, pkgs, inputs, ... }:

let
    autotools-language-server = import ./autotools-ls.nix { pkgs = pkgs; };
    groovy-language-server = import ./groovyls.nix { pkgs = pkgs; };
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
            groovy-language-server
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
            tectonic
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
            vimtex

        ];
    };
}
