{ config
, pkgs
, ...
}:

let
  autotools-language-server = import ./autotools-ls.nix { pkgs = pkgs; };
  groovy-language-server = import ./groovyls.nix { pkgs = pkgs; };

  compiler-nvim = pkgs.vimUtils.buildVimPlugin rec {
    pname = "compiler-nvim";
    version = "v3.2.4";
    src = pkgs.fetchFromGitHub {
      owner = "Zeioth";
      repo = "compiler.nvim";
      rev = "5615e4b15b5301144ce507ace6f594409a4d22c5";
      hash = "sha256-6VkQCTpE/nTSQ2NxjJYDtkx5jB54MOxJS5HpT6G6x/E=";
    };
  };

  filetype-nvim = pkgs.vimUtils.buildVimPlugin rec {
    pname = "filetype-nvim";
    version = "v0.4.0";
    src = pkgs.fetchFromGitHub {
      owner = "nathom";
      repo = "filetype.nvim";
      rev = "b522628a45a17d58fc0073ffd64f9dc9530a8027";
      sha256 = "sha256-B+VvgQj8akiKe+MX/dV2/mdaaqF8s2INW3phdPJ5TFA=";
    };
  };
in
{
  home.file.".config/nvim/colors/bluesee.vim".source = ./bluesee.vim;
  programs.neovim = {
    enable = true;
    extraLuaConfig = builtins.readFile ./init.lua;
    package = pkgs.neovim-nightly;
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
      markdownlint-cli
      terraform-lsp
      quick-lint-js
      terraform-ls
      ansible-lint
      nixpkgs-fmt
      tree-sitter
      nixpkgs-fmt
      clang-tools
      shellcheck
      checkstyle
      actionlint
      checkmake
      marksman
      yamllint
      tectonic
      rnix-lsp
      hadolint
      pplatex
      yamlfmt
      ripgrep
      helm-ls
      deadnix
      statix
      tflint
      texlab
      tfsec
      trivy
      taplo
      shfmt
      isort
      black
      gopls
      glow
      sqls
      gcc
      ]
      ++ (with nodePackages_latest; [
        bash-language-server
        jsonlint
      ])
      ++ (with python3Packages; [
        jedi
        pylint
        pynvim
        pyls-isort
        pycodestyle
        python-lsp-black
        python-lsp-server
        jedi-language-server
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
      colorizer
      dressing-nvim
      fzf-vim
      nui-nvim
      nvim-web-devicons
      nvim-ts-autotag
      impatient-nvim
      luasnip
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
      jedi-vim
      vim-shellcheck
      Jenkinsfile-vim-syntax
      vim-jsonnet
      vimtex
      compiler-nvim
      overseer-nvim
      copilot-cmp

    ];
  };
}
