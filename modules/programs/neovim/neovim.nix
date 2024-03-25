{ config
, pkgs
, ...
}:

let
  autotools-language-server = import ./autotools-ls.nix { inherit pkgs; };
  groovy-language-server = import ./groovyls.nix { inherit pkgs; };
  customVimPlugins = import ./vim-plugins.nix { inherit pkgs; };
in
{
  imports = [
    ./neuewelt.nix
  ];

  programs.neovim = {
    enable = true;
    extraLuaConfig = builtins.readFile ./init.lua;
    package = pkgs.neovim-unwrapped;
    vimAlias = true;
    withPython3 = true;
    withNodeJs = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      dockerfile-language-server-nodejs
      docker-compose-language-service
      vscode-langservers-extracted
      autotools-language-server
      jsonnet-language-server
      ansible-language-server
      groovy-language-server
      yaml-language-server
      java-language-server
      lua-language-server
      quick-lint-js
      terraform-ls
      ansible-lint
      clang-tools
      checkstyle
      actionlint
      checkmake
      codespell
      marksman
      yamllint
      hadolint
      ruff-lsp
      pplatex
      yamlfmt
      ripgrep
      helm-ls
      deadnix
      nixfmt
      tflint
      texlab
      biber
      taplo
      gopls
      shfmt
      nixd
      glow
      sqls
      mdl
      gcc
      fd
      ]
      ++ (with nodePackages_latest; [
        bash-language-server
      ])
      ++ (with python3Packages; [
        jedi-language-server
        python-lsp-server
        pylint
        flake8
        pynvim
    ]);
    plugins = with pkgs.vimPlugins; with customVimPlugins; [

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
        plugin = glow-nvim;
        type = "lua";
        config = builtins.readFile ./config/glow.lua;
      }
      {
        plugin = filetype-nvim;
        type = "lua";
        config = builtins.readFile ./config/filetype.lua;
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
        plugin = none-ls-nvim;
        type = "lua";
        config = builtins.readFile ./config/null.lua;
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
      auto-pairs
      cmp-buffer
      cmp-cmdline
      cmp-nvim-lsp
      cmp-path
      cmp-git
      cmp_luasnip
      cmp-spell
      cmp-nvim-tags
      cmp-nvim-lsp-signature-help
      comment-nvim
      nvim-colorizer-lua
      dressing-nvim
      fzf-vim
      nui-nvim
      nvim-web-devicons
      nvim-ts-autotag
      impatient-nvim
      tmux-nvim
      telescope-fzf-native-nvim
      vim-fugitive
      vim-gitgutter
      vim-nix
      vim-rhubarb
      vim-sleuth
      nvim-surround
      vim-unimpaired
      vim-terraform
      vim-yaml
      ansible-vim
      playground
      friendly-snippets
      Jenkinsfile-vim-syntax
      compiler-nvim
      overseer-nvim
      copilot-cmp
      vim-lsc
      nvim-autopairs

    ];
  };
}
