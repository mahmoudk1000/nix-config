{ config, pkgs, inputs, ... }:

let
    codeium-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
        name = "codeium-vim";
        src = inputs.codeium-nvim;
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
            nodePackages_latest.dockerfile-language-server-nodejs
            nodePackages_latest.typescript-language-server
            nodePackages_latest.bash-language-server
            nodePackages_latest.yaml-language-server
            sumneko-lua-language-server
            python310Packages.python-lsp-server
            python39Packages.yapf
            java-language-server
            quick-lint-js
            nixpkgs-fmt
            tree-sitter
            rnix-lsp
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
                plugin = nvim-tree-lua;
                type = "lua";
                config = builtins.readFile ./config/nvimtree.lua;
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
            auto-pairs
            cmp-buffer
            cmp-cmdline
            cmp-git
            cmp-nvim-lsp
            cmp-path
            comment-nvim
            dressing-nvim
            fzf-vim
            gitsigns-nvim
            impatient-nvim
            luasnip
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
            vimwiki
            playground
            codeium-nvim

        ];
    };
}
