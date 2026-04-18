{ pkgs, ... }:

{
  imports = [ ./islet.nix ];

  xdg.configFile = {
    "nvim/lua".source = ./lua;
    "nvim/queries".source = ./queries;
    "nvim/ftplugin".source = ./ftplugin;
  };

  programs.neovim = {
    enable = true;
    initLua = builtins.readFile ./init.lua;
    package = pkgs.neovim-unwrapped;
    vimAlias = true;
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = false;
    waylandSupport = false;
    extraPackages =
      with pkgs;
      [
        ansible-lint
        bash-language-server
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
      ]
      ++ (with luajitPackages; [
        tree-sitter-cli
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
