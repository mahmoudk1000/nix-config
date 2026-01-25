{ pkgs, theme, ... }:

{
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor-fhs;
    extraPackages = with pkgs; [
      ansible-lint
      dockerfile-language-server
      go
      gofumpt
      golines
      gopls
      gosimports
      jsonnet-language-server
      lua-language-server
      nil
      nixfmt-rfc-style
      ruff
      shfmt
      terraform-ls
      tflint
      yamlfix
      yamllint
    ];
    userSettings = {
      # UI
      autosave = "on_focus_change";
      ui_font_family = "IosevkaTerm Nerd Font";
      buffer_font_family = "IosevkaTerm Nerd Font";
      ui_font_size = 13.0;
      buffer_font_size = 12.0;
      icon_theme = "Material Icon Theme";
      theme = {
        mode = "system";
        dark = "default";
      };
      project_panel = {
        default_width = 230.0;
        dock = "left";
        entry_spacing = "standard";
        file_icons = true;
        folder_icons = true;
        git_status = true;
        hide_hidden = false;
        hide_root = true;
        indent_size = 10;
        scrollbar.show = null;
      };
      features = {
        edit_prediction_provider = "copilot";
      };

      # Behavior
      vim_mode = true;
      vim = {
        toggle_relative_line_numbers = true;
        use_system_clipboard = "always";
      };
      auto_indent_on_paste = true;
      auto_signature_help = true;
      cursor_blink = false;
      hide_mouse = "on_typing_and_movement";
      hover_popover_delay = 350;
      hover_popover_enabled = true;
      middle_click_paste = true;
      show_completion_documentation = true;
      show_completions_on_input = true;
      show_edit_predictions = true;
      show_wrap_guides = true;
      use_autoclose = true;
      use_auto_surround = true;
      restore_on_startup = "none";
      wrap_guides = [ ];

      # Terminal
      terminal = {
        alternate_scroll = "off";
        blinking = "terminal_controlled";
        copy_on_select = true;
        dock = "bottom";
        default_width = 640;
        default_height = 320;
        shell = {
          program = "zsh";
        };
      };

      # Gutter
      gutter = {
        breakpoints = true;
        code_actions = true;
        folds = true;
        line_numbers = true;
        runnables = true;
      };

      # Indent Guides
      indent_guides = {
        active_line_width = 1;
        background_coloring = "disabled";
        coloring = "fixed";
        enabled = true;
        line_width = 1;
      };

      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      file_types = {
        "Dockerfile" = [
          "Dockerfile"
          "Dockerfile.*"
        ];
      };

      # Languages
      languages = {
        Python = {
          tab_size = 4;
          formatter = "language_server";
          format_on_save = "on";
        };
        Lua = {
          tab_size = 2;
          formatter = "language_server";
          format_on_save = "on";
        };
        Nix = {
          language_servers = [ "nil" ];
          formatter = {
            external = {
              command = "nixpkgs-fmt";
              arguments = [ ];
            };
          };
          format_on_save = "on";
        };
      };

      # LSP
      lsp = {
        nil = {
          binary = {
            path = "nil";
            arguments = [ ];
          };
        };
      };
    };
    userKeymaps = [
      {
        context = "ProjectPanel && not_editing";
        bindings = {
          "a" = "project_panel::NewFile";
          "d" = "project_panel::Delete";
          "r" = "project_panel::Rename";
          "y" = "project_panel::Copy";
          "p" = "project_panel::Paste";
          "x" = "project_panel::Cut";
        };
      }
      {
        context = "TabSwitcher";
        bindings = {
          "j" = "tab_switcher::Toggle";
          "x" = "tab_switcher::CloseSelectedItem";
          "k" = [
            "tab_switcher::Toggle"
            {
              select_last = true;
            }
          ];
        };
      }
    ];
    extensions = [
      "ansible"
      "csharp"
      "csharp-snippets"
      "csv"
      "docker-compose"
      "dockerfile"
      "env"
      "git-firefly"
      "github-actions"
      "github-theme"
      "go-snippets"
      "gosum"
      "gotmpl"
      "graphql"
      "groovy"
      "helm"
      "html"
      "latex"
      "lua"
      "make"
      "material-icon-theme"
      "mcp-server-github"
      "nix"
      "opentofu"
      "postgres-context-server"
      "powershell"
      "python-lsp"
      "rainbow-csv"
      "ruff"
      "seti-icons"
      "sql"
      "terraform"
      "terraform-context-server"
      "toml"
      "basher"
      "snippets"
    ];
    themes = with theme; {
      default = {
        "$schema" = "https://zed.dev/schema/themes/v0.2.0.json";
        name = "default";
        author = "Mahmoud";
        themes = [
          {
            name = "default";
            appearance = "dark";
            style = {
              background = "${base00}";
              "editor.background" = "${base00}";
              "editor.gutter.background" = "${base00}";
              "editor.active_line.background" = "${base01}";
              "status_bar.background" = "${base01}";

              foreground = "${base05}";
              text = "${base05}";

              "editor.line_number" = "${base03}";
              "editor.active_line_number" = "${base0D}";
              "editor.wrap_guide" = "${base02}";

              error = "${base08}";
              warning = "${base0A}";
              "warning.background" = "${base01}";

              players = [
                {
                  cursor = "${base0D}";
                  selection = "${base02}";
                }
              ];

              syntax = {
                comment = {
                  color = "${base03}";
                  font_style = "italic";
                  font_weight = null;
                };
                string = {
                  color = "${base0B}";
                  font_style = null;
                  font_weight = null;
                };
              };
            };
          }
        ];
      };
    };
  };
}
