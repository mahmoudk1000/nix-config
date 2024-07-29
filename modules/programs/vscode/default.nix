{ pkgs, theme, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium-fhs;
    enableUpdateCheck = false;
    extensions =
      with pkgs.vscode-extensions;
      [
        antfu.icons-carbon
        github.vscode-pull-request-github
        usernamehw.errorlens
        foxundermoon.shell-format
        arrterian.nix-env-selector
        kamikillerto.vscode-colorize
        ms-azuretools.vscode-docker
        ms-python.python
        redhat.java
        redhat.vscode-yaml
        ritwickdey.liveserver
        esbenp.prettier-vscode
        davidlday.languagetool-linter
        mads-hartmann.bash-ide-vscode
        pkief.material-icon-theme
        davidanson.vscode-markdownlint
        yzhang.markdown-all-in-one
        shardulm94.trailing-spaces
        streetsidesoftware.code-spell-checker
        ms-ceintl.vscode-language-pack-de
        bbenoist.nix
        ms-python.vscode-pylance
        hashicorp.terraform
        jnoortheen.nix-ide
        vscodevim.vim
        equinusocio.vsc-material-theme-icons
        visualstudioexptteam.vscodeintellicode
        github.copilot
        github.copilot-chat
        ms-vscode.powershell
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "fluent-icons";
          publisher = "miguelsolorio";
          version = "0.0.18";
          sha256 = "sha256-sE0A441QPwokBoLoCqtImDHmlAXd66fj8zsJR7Ci+Qs=t";
        }
      ];
    keybindings = import ./keybind.nix;
    userSettings = {
      editor = {
        fontSize = 12;
        fontFamily = [
          "Iosevka"
          "IosevkaTerm Nerd Font"
        ];
        fontLigatures = true;
        acceptSuggestionOnEnter = "off";
        autoClosingBrackets = "always";
        cursorBlinking = "smooth";
        cursorSmoothCaretAnimation = true;
        formatOnPaste = true;
        formatOnSave = true;
        formatOnType = true;
        renderFinalNewline = false;
        rulers = [ 80 ];
        tabSize = 4;
        smoothScrolling = true;
        stickyTabStops = true;
        wordWrap = "on";
        bracketPairColorization = {
          enabled = true;
        };
        guides = {
          bracketPairs = "active";
        };
      };

      # Window
      window = {
        zoomLevel = -0.5;
        menuBarVisibility = "toggle";
        titleBarStyle = "native";
      };

      # Workbench
      workbench = {
        colorTheme = "Mont";
        iconTheme = "eq-material-theme-icons-light";
        productIconTheme = "fluent-icons";
        editor = {
          showTabs = true;
        };
      };

      # Terminal
      terminal = {
        integrated = {
          fontFamily = "IosevkaTerm Nerd Font";
          fontSize = 12;
          allowChords = false;
          gpuAcceleration = "on";
          cursorStyle = "line";
          cursorBlinking = true;
        };
      };

      # Files
      files = {
        autoSave = "onFocusChange";
        trimTrailingWhitespace = true;
        trimFinalNewlines = true;
        exclude = {
          "**/.classpath" = true;
          "**/.project" = true;
          "**/.settings" = true;
          "**/.factorypath" = true;
        };
      };

      # Telemetry
      telemetry = {
        enableCrashReporter = false;
        enableTelemetry = false;
        telemetryLevel = "off";
      };
      redhat = {
        telemetry = {
          enabled = false;
        };
      };
      githubPullRequests = {
        telemetry = {
          enabled = false;
        };
      };

      # Updates
      update = {
        mode = "none";
      };
      extensions = {
        autoUpdate = false;
        ignoreRecommendations = true;
      };

      # Git
      git = {
        autofetch = true;
      };

      # Python
      python = {
        languageServer = "Pylance";
        analysis = {
          autoImportCompletions = true;
          typeCheckingMode = "basic";
        };
        linting = {
          enabled = true;
          pylintEnabled = true;
          pylintPath = "${pkgs.python3Packages.pylint}/bin/pylint";
        };
      };

      # vim
      vim = {
        useSystemClipboard = true;
      };

      # Languages
      ## Nix
      nix = {
        enableLanguageServer = true;
        nixEnvSelector = {
          nixFile = "\${workspaceRoot}/shell.nix";
        };
        serverPath = "${pkgs.nixd}/bin/nixd";
        serverSettings = {
          nixd = {
            eval = { };
            formatting = {
              command = [ "nixpkgs-fmt" ];
            };
            options = {
              enable = true;
              target = {
                args = [ ];
                installable = "<flakeref>#nixosConfigurations.<name>.options";
              };
            };
          };
        };
      };
      ## java
      groovyLint.java.executable = "groovy-language-server";
      java = {
        configuration.runtimes = [
          {
            name = "JavaSE-17";
            path = "${pkgs.jdk}/lib/openjdk";
            default = true;
          }
        ];
        jdt.ls.java.home = "${pkgs.jdk}/lib/openjdk";
        format.settings.profile = "GoogleStyle";
      };
      ## Docker
      dockerfile = {
        editor.defaultFormatter = "ms-azuretools.vscode-docker";
      };
      ## Web
      "[html][javascript][javascriptreact][json][typescript][typescriptreact][scss]" = {
        editor.defaultFormatter = "esbenp.prettier-vscode";
      };
      ## Bash
      shellscript = {
        editor = {
          tabSize = 4;
          insertSpaces = false;
        };
        shellformat.path = "${pkgs.shfmt}/bin/shfmt";
      };
      ## C, CPP
      "[cpp][c]" = {
        editor.defaultFormatter = "xaver.clang-format";
      };
    };
  };

  home.file.".vscode-oss/extensions/mahmoudk1000.mont/package.json".text = ''
    {
      "name": "Mont",
        "displayName": "Mont Theme",
        "description": "Mont Theme For VSCode",
        "version": "0.1.0",
        "engines": {
          "vscode": "^1.51.0"
        },
        "categories": [
          "Themes"
        ],
        "contributes": {
          "themes": [
          {
            "label": "Mont",
            "uiTheme": "vs-dark",
            "path": "./themes/mont-color-theme.json"
          }
          ]
        }
    }
  '';

  home.file.".vscode-oss/extensions/mahmoudk1000.mont/themes/mont-color-theme.json".text =
    import ./theme.nix
      { inherit theme; };
}
