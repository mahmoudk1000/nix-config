{ pkgs, ... }:

let
  groovy-language-server = import ./groovyls.nix { inherit pkgs; };
  # customVimPlugins = import ./vim-plugins.nix { inherit pkgs; };
in
{
  imports = [ ./islet.nix ];

  programs.neovim = {
    enable = true;
    extraLuaConfig = builtins.readFile ./init.lua;
    package = pkgs.neovim-unwrapped;
    vimAlias = true;
    defaultEditor = true;
    extraPackages = [
      groovy-language-server
    ]
    ++ (with pkgs; [
      dockerfile-language-server-nodejs
      docker-compose-language-service
      vscode-langservers-extracted
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
      nixd
      ruff
      gcc
      fd
      go
    ])
    ++ (with pkgs.nodePackages_latest; [ bash-language-server ])
    ++ (with pkgs.python3Packages; [
      pynvim
    ]);
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      alpha-nvim
      bufferline-nvim
      indent-blankline-nvim
      nvim-lspconfig
      lualine-nvim
      nvim-tree-lua
      toggleterm-nvim
      blink-cmp
      which-key-nvim
      gitsigns-nvim
      telescope-nvim
      copilot-lua
      fidget-nvim
      luasnip
      vimtex
      nvim-lint
      conform-nvim
      blink-pairs
      lze
      nvim-colorizer-lua
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
      blink-copilot
      lzextras
    ];
  };
}
