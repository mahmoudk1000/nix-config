{ pkgs, ... }:

let
  groovy-language-server = import ./groovyls.nix { inherit pkgs; };
in
# customVimPlugins = import ./vim-plugins.nix { inherit pkgs; };
{
  imports = [ ./islet.nix ];

  programs.neovim = {
    enable = true;
    extraLuaConfig = builtins.readFile ./init.lua;
    package = pkgs.neovim-unwrapped;
    vimAlias = true;
    withPython3 = true;
    withNodeJs = true;
    defaultEditor = true;
    extraPackages =
      [ groovy-language-server ]
      ++ (with pkgs; [
        dockerfile-language-server-nodejs
        docker-compose-language-service
        vscode-langservers-extracted
        autotools-language-server
        jsonnet-language-server
        ansible-language-server
        yaml-language-server
        java-language-server
        lua-language-server
        goimports-reviser
        markdownlint-cli
        nixfmt-rfc-style
        golangci-lint
        terraform-ls
        ansible-lint
        shellcheck
        checkmake
        codespell
        marksman
        yamllint
        hadolint
        python3
        yamlfix
        ripgrep
        helm-ls
        golines
        deadnix
        statix
        stylua
        tflint
        texlab
        biber
        shfmt
        gopls
        ruff
        # nixd
        nil
        gcc
        fd
        go
      ])
      ++ (with pkgs.nodePackages_latest; [ bash-language-server ])
      ++ (with pkgs.python3Packages; [
        jedi-language-server
        pynvim
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
        config = builtins.readFile ./config/lsp.lua;
      }
      {
        plugin = lualine-nvim;
        type = "lua";
        config = builtins.readFile ./config/lualine.lua;
      }
      {
        plugin = nvim-tree-lua;
        type = "lua";
        config = builtins.readFile ./config/tree.lua;
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
        plugin = gitsigns-nvim;
        type = "lua";
        config = builtins.readFile ./config/gitsigns.lua;
      }
      {
        plugin = telescope-nvim;
        type = "lua";
        config = builtins.readFile ./config/telescope.lua;
      }
      {
        plugin = copilot-lua;
        type = "lua";
        config = builtins.readFile ./config/copilot.lua;
      }
      {
        plugin = fidget-nvim;
        type = "lua";
        config = builtins.readFile ./config/fidget.lua;
      }
      {
        plugin = luasnip;
        type = "lua";
        config = builtins.readFile ./config/luasnip.lua;
      }
      {
        plugin = vimtex;
        type = "lua";
        config = builtins.readFile ./config/vimtex.lua;
      }
      {
        plugin = nvim-lint;
        type = "lua";
        config = builtins.readFile ./config/lint.lua;
      }
      {
        plugin = conform-nvim;
        type = "lua";
        config = builtins.readFile ./config/conform.lua;
      }
      cmp-buffer
      cmp-cmdline
      cmp-nvim-lsp
      cmp-path
      cmp-git
      cmp_luasnip
      copilot-cmp
      cmp-nvim-lsp-signature-help
      nvim-colorizer-lua
      dressing-nvim
      nui-nvim
      nvim-web-devicons
      tmux-nvim
      vim-gitgutter
      vim-nix
      vim-sleuth
      vim-terraform
      vim-yaml
      vim-helm
      ansible-vim
      playground
      friendly-snippets
      compiler-nvim
      overseer-nvim
      nvim-autopairs
      markview-nvim
    ];
  };
}
