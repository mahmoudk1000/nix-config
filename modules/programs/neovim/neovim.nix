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
        extraPython3Packages = pyPkgs: with pyPkgs; [
            jedi
            pylint
            pynvim
            pyls-isort
            pycodestyle
            python-lsp-black
            python-lsp-server
            jedi-language-server
        ];
        extraPackages = with pkgs; [
            nodePackages_latest.dockerfile-language-server-nodejs
            nodePackages_latest.typescript-language-server
            nodePackages_latest.bash-language-server
            python310Packages.jedi
            python310Packages.pylint
            python310Packages.pynvim
            python310Packages.pyls-isort
            python310Packages.pycodestyle
            python310Packages.python-lsp-black
            python310Packages.python-lsp-server
            python310Packages.jedi-language-server
            docker-compose-language-service
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
