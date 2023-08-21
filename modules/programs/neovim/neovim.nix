{ config, pkgs, inputs, ... }:

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
            nodePackages_latest.dockerfile-language-server-nodejs
            nodePackages_latest.typescript-language-server
            nodePackages_latest.bash-language-server
            nodePackages_latest.yaml-language-server
            python310Packages.python-lsp-server
            docker-compose-language-service
            sumneko-lua-language-server
            ansible-language-server
            java-language-server
            terraform-lsp
            quick-lint-js
            terraform-ls
            ansible-lint
            nixpkgs-fmt
            tree-sitter
            rnix-lsp
            yamllint
            yamlfmt
            ripgrep
            tflint
            shfmt
            gcc
        ];
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
            auto-pairs
            cmp-buffer
            cmp-cmdline
            cmp-nvim-lsp
            cmp-path
            cmp_luasnip
            comment-nvim
            colorizer
            mason-nvim
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
            glow-nvim

        ];
    };
}
