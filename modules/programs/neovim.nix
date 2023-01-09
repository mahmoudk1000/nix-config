{ config, pkgs, ... }:

{
    programs.neovim = {
        enable = true;
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
            python-language-server
            python39Packages.yapf
            java-language-server
            rnix-lsp
            gcc
        ];
        plugins = with pkgs.vimPlugins; [

            (nvim-treesitter.withPlugins (
                _: pkgs.tree-sitter.allGrammars
            ))
            alpha-nvim
            auto-pairs
            bufferline-nvim
            cmp-buffer
            cmp-cmdline
            cmp-nvim-lsp
            cmp-path
            comment-nvim
            dressing-nvim
            fzf-vim
            gitsigns-nvim
            impatient-nvim
            indent-blankline-nvim
            lualine-nvim
            luasnip
            neoscroll-nvim
            nvim-cmp
            nvim-lspconfig
            nvim-tree-lua
            popup-nvim
            telescope-fzf-native-nvim
            telescope-nvim
            toggleterm-nvim
            vim-fugitive
            vim-gitgutter
            vim-nix
            vim-rhubarb
            vim-sleuth
            vim-surround
            vim-unimpaired
            vimwiki

        ];
    };
}
