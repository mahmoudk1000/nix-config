{ pkgs, ... }:

let
  allGrammears = pkgs.vimUtils.buildVimPlugin {
    name = "treesitter-all-parsers";
    src = pkgs.symlinkJoin {
      name = "treesitter-all-parsers-src";
      paths = pkgs.vimPlugins.nvim-treesitter.withAllGrammars.dependencies;
    };
  };

  arborist-queries = pkgs.vimUtils.buildVimPlugin {
    name = "arborist-queries";
    src = pkgs.fetchFromGitHub {
      owner = "arborist-ts";
      repo = "queries";
      rev = "fdc5479d5f07c83841323429238d8a6f95bd10d7";
      hash = "sha256-MG0K8OkCm94ZFRisJer6W3BGLZeRpn+yhZe7Rr3gYbw=";
    };
  };
in
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
        vscode-langservers-extracted
        yamlfix
        yaml-language-server
        yamllint
      ]
      ++ (with pkgs.python3Packages; [
        pynvim
      ]);
    plugins = with pkgs.vimPlugins; [
      allGrammears
      ansible-vim
      arborist-queries
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
