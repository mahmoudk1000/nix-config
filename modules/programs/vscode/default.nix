{
  pkgs,
  theme,
  font,
  ...
}:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium-fhs;
    profiles = {
      default = {
        enableUpdateCheck = false;
        extensions = with pkgs.vscode-extensions; [
          ms-azuretools.vscode-containers
          ms-vscode-remote.remote-containers
          ms-azuretools.vscode-docker
          miguelsolorio.fluent-icons
          github.vscode-github-actions
          github.copilot
          github.copilot-chat
          github.github-vscode-theme
          eamodio.gitlens
          tim-koehler.helm-intellisense
          zainchen.json
          ms-kubernetes-tools.vscode-kubernetes-tools
          davidanson.vscode-markdownlint
          miguelsolorio.min-theme
          ms-vscode.powershell
          esbenp.prettier-vscode
          ms-vscode-remote.remote-ssh
          ms-vscode-remote.remote-ssh-edit
          ms-vscode-remote.vscode-remote-extensionpack
          ms-vscode.remote-explorer
          ms-vscode-remote.remote-wsl
          redhat.vscode-yaml
          antfu.icons-carbon
          foxundermoon.shell-format
          arrterian.nix-env-selector
          kamikillerto.vscode-colorize
          ms-python.python
          davidlday.languagetool-linter
          mads-hartmann.bash-ide-vscode
          pkief.material-icon-theme
          shardulm94.trailing-spaces
          streetsidesoftware.code-spell-checker
          ms-ceintl.vscode-language-pack-de
          bbenoist.nix
          ms-python.vscode-pylance
          hashicorp.terraform
          jnoortheen.nix-ide
          vscodevim.vim
          visualstudioexptteam.vscodeintellicode
        ];
        keybindings = import ./keybind.nix;
        userSettings = {
          editor = {
            fontSize = 12;
            fontFamily = [
              font.name
              font.nameTerm
            ];
            fontLigatures = true;
            acceptSuggestionOnEnter = "off";
            autoClosingBrackets = "always";
            cursorBlinking = "smooth";
            renderIndentGuides = false;
            renderWhitespace = "none";

            cursorSmoothCaretAnimation = true;
            formatOnPaste = true;
            formatOnSave = true;
            formatOnType = true;
            renderFinalNewline = false;
            rulers = [ 80 ];
            tabSize = 2;
            smoothScrolling = true;
            stickyTabStops = true;
            wordWrap = "on";
            minimap = {
              renderCharacters = false;
            };
            bracketPairColorization = {
              enabled = true;
            };
            guides = {
              bracketPairs = "active";
            };
          };

          window = {
            zoomLevel = -0.5;
            menuBarVisibility = "toggle";
            titleBarStyle = "native";
          };

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
              fontFamily = font.nameTerm;
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

          update = {
            mode = "none";
          };
          extensions = {
            autoUpdate = false;
            ignoreRecommendations = true;
          };

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

          vim = {
            useSystemClipboard = true;
          };
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
