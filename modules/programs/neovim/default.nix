{ pkgs, ... }:

let
  groovy-language-server = import ./groovyls.nix { inherit pkgs; };
  # customVimPlugins = import ./vim-plugins.nix { inherit pkgs; };
in
{
  imports = [ ./islet.nix ];

  xdg.configFile = {
    "nvim/lua".source = ./lua;
    "nvim/queries".source = ./queries;
    "nvim/ftplugin".source = ./ftplugin;
    "nvim/crds-catalog".source = import ./crds-catalog.nix { inherit pkgs; };
  };

  programs.neovim = {
    enable = true;
    initLua = builtins.readFile ./init.lua;
    package = pkgs.neovim-unwrapped;
    vimAlias = true;
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
    waylandSupport = false;
    extraPackages = [
      groovy-language-server
    ]
    ++ (with pkgs; [
      ansible-lint
      checkmake
      codespell
      copilot-language-server
      deadnix
      docker-compose-language-service
      dockerfile-language-server
      fd
      file
      gcc
      hadolint
      helm-ls
      jsonnet-language-server
      lua-language-server
      markdownlint-cli
      marksman
      nil
      nixfmt
      ripgrep
      shellcheck
      shfmt
      sqls
      statix
      stylua
      terraform-ls
      tflint
      yamlfix
      yaml-language-server
      yamllint
    ])
    ++ (with pkgs.nodePackages_latest; [
      bash-language-server
    ])
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
      fidget-nvim
      friendly-snippets
      gitsigns-nvim
      incline-nvim
      lualine-nvim
      luasnip
      lze
      lzextras
      nui-nvim
      nvim-highlight-colors
      nvim-lint
      nvim-lspconfig
      nvim-treesitter
      nvim-treesitter-textobjects
      nvim-treesitter-context
      nvim-treesitter.withAllGrammars
      nvim-web-devicons
      snacks-nvim
      tmux-nvim
      vim-helm
      vim-nix
      vim-sleuth
      vim-terraform
      vim-yaml
      vimtex
    ];
  };
}
