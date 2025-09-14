{ pkgs, ... }:

let
  groovy-language-server = import ./groovyls.nix { inherit pkgs; };
  crds-catalog = import ./crds-catalog.nix { inherit pkgs; };
  # customVimPlugins = import ./vim-plugins.nix { inherit pkgs; };
in
{
  imports = [ ./islet.nix ];

  xdg.configFile = {
    "nvim/lua".source = ./lua;
    "nvim/crds-catalog".source = "${crds-catalog}";
  };

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
      ansible-vim
      blink-cmp
      blink-copilot
      blink-pairs
      bufferline-nvim
      codecompanion-nvim
      conform-nvim
      copilot-lua
      fidget-nvim
      gitsigns-nvim
      lualine-nvim
      luasnip
      lze
      lzextras
      nui-nvim
      nvim-highlight-colors
      nvim-lint
      nvim-lspconfig
      nvim-treesitter-textsubjects
      nvim-treesitter.withAllGrammars
      nvim-web-devicons
      snacks-nvim
      tmux-nvim
      vim-helm
      vim-nix
      vim-sleuth
      vim-terraform
      vimtex
      vim-yaml
    ];
  };
}
