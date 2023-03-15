{ config, pkgs, theme, ... }:

{
    programs.vscode = {
        enable = true;
        package = pkgs.vscodium-fhs;
        extensions = with pkgs.vscode-extensions; [
            vadimcn.vscode-lldb
            antfu.icons-carbon
            github.github-vscode-theme
            github.vscode-pull-request-github
            usernamehw.errorlens
            eamodio.gitlens
            foxundermoon.shell-format
            jnoortheen.nix-ide
            arrterian.nix-env-selector
            tamasfe.even-better-toml
            kamikillerto.vscode-colorize
            ms-azuretools.vscode-docker
            ms-python.python
            ms-vscode.cpptools
            redhat.java
            redhat.vscode-yaml
            ritwickdey.liveserver
            esbenp.prettier-vscode
            davidlday.languagetool-linter
            mads-hartmann.bash-ide-vscode
            pkief.material-icon-theme
            davidanson.vscode-markdownlint
            yzhang.markdown-all-in-one
            eamodio.gitlens
            redhat.vscode-yaml
            vscjava.vscode-maven
            vscjava.vscode-java-dependency
            vscjava.vscode-java-test
            vscjava.vscode-java-debug
            shardulm94.trailing-spaces
            streetsidesoftware.code-spell-checker
            ms-ceintl.vscode-language-pack-de
            jnoortheen.nix-ide
            bbenoist.nix
            ms-python.vscode-pylance
        ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
            {
                name = "fluent-icons";
                publisher = "miguelsolorio";
                version = "0.0.18";
                sha256 = "sha256-sE0A441QPwokBoLoCqtImDHmlAXd66fj8zsJR7Ci+Qs=t";
            }
            {
                name = "vsc-material-theme-icons";
                publisher = "Equinusocio";
                version = "2.4.0";
                sha256 = "sha256-2M/Pvfaxeouc6h5FwmXxky4aQX+Nqqj0CQhJq83SOD8=";
            }
            {
                name = "vscodeintellicode";
                publisher = "VisualStudioExptTeam";
                version = "1.2.29";
                sha256 = "sha256-Wl++d7mCOjgL7vmVVAKPQQgWRSFlqL4ry7v0wob1OyU=";
            }
        ];
        keybindings = [
            {
                key = "alt+d";
                command = "editor.action.deleteLines";
                when = "textInputFocus && !editorReadonly";
            }
            {
                key = "alt+down";
                command = "editor.action.moveLinesDownAction";
                when = "editorTextFocus && !editorReadonly";
            }
            {
                key = "alt+up";
                command = "editor.action.moveLinesUpAction";
                when = "editorTextFocus && !editorReadonly";
            }
            {
                key = "ctrl+alt+d";
                command = "editor.action.duplicateSelection";
            }
            {
                key = "ctrl+alt+down";
                command = "editor.action.copyLinesDownAction";
                when = "editorTextFocus && !editorReadonly";
            }
            {
                key = "ctrl+alt+up";
                command = "editor.action.copyLinesUpAction";
                when = "editorTextFocus && !editorReadonly";
            }
            {
                key = "alt+a";
                command = "workbench.action.toggleActivityBarVisibility";
            }
            {
                key = "alt+b";
                command = "workbench.action.toggleSidebarVisibility";
            }
            {
                key = "alt+m";
                command = "workbench.action.toggleMenuBar";
            }
            {
                key = "alt+t";
                command = "workbench.action.terminal.toggleTerminal";
                when = "terminal.active";
            }
            {
                key = "ctrl+a";
                command = "cursorLineStart";
            }
            {
                key = "ctrl+e";
                command = "cursorLineEnd";
            }
            {
                key = "ctrl+1";
                command = "workbench.action.openEditorAtIndex1";
            }
            {
                key = "ctrl+2";
                command = "workbench.action.openEditorAtIndex2";
            }
            {
                key = "ctrl+3";
                command = "workbench.action.openEditorAtIndex3";
            }
            {
                key = "ctrl+4";
                command = "workbench.action.openEditorAtIndex4";
            }
            {
                key = "ctrl+5";
                command = "workbench.action.openEditorAtIndex5";
            }
            {
                key = "ctrl+6";
                command = "workbench.action.openEditorAtIndex6";
            }
            {
                key = "ctrl+7";
                command = "workbench.action.openEditorAtIndex7";
            }
            {
                key = "ctrl+8";
                command = "workbench.action.openEditorAtIndex8";
            }
            {
                key = "ctrl+9";
                command = "workbench.action.openEditorAtIndex9";
            }
            {
                key = "alt+p";
                command = "workbench.action.quickOpen";
            }
            {
                key = "alt+e";
                command = "workbench.view.explorer";
            }
        ];
        userSettings =  {
            # Editor
            "editor.fontSize" = 12;
            "editor.fontFamily" = "'Iosevka', 'IosevkaTerm Nerd Font'";
            "editor.fontLigatures" = true;
            "editor.acceptSuggestionOnEnter" = "off";
            "editor.autoClosingBrackets" = "always";
            "editor.cursorBlinking" = "smooth";
            "editor.cursorSmoothCaretAnimation" = true;
            "editor.formatOnPaste" = true;
            "editor.formatOnSave" = true;
            "editor.formatOnType" = true;
            "editor.renderFinalNewline" = false;
            "editor.rulers" = [ 80 ];
            "editor.tabSize" = 4;
            "editor.smoothScrolling" = true;
            "editor.stickyTabStops" = true;
            "editor.wordWrap" = "on";
            "editor.bracketPairColorization.enabled" = true;
            "editor.guides.bracketPairs" = "active";

            # Window
            "window.zoomLevel" = -0.5;
            "window.menuBarVisibility" = "toggle";
            "window.titleBarStyle" = "native";
            "extensions.autoUpdate" = false;

            # Workbench
            "workbench.colorTheme" = "Mont";
            "workbench.iconTheme" = "eq-material-theme-icons-light";
            "workbench.productIconTheme" = "fluent-icons";
            "workbench.editor.showTabs" = true;

            # Terminal
            "terminal.integrated.fontFamily" = "IosevkaTerm Nerd Font";
            "terminal.integrated.fontSize" = 12;
            "terminal.integrated.allowChords" = false;
            "terminal.integrated.gpuAcceleration" = "on";
            "terminal.integrated.cursorStyle" = "line";
            "terminal.integrated.cursorBlinking" = true;

            # Files
            "files.autoSave" = "onFocusChange";
            "files.trimTrailingWhitespace" = true;
            "files.trimFinalNewlines" = true;
            "files.exclude" = {
                "**/.classpath" = true;
                "**/.project" = true;
                "**/.settings" = true;
                "**/.factorypath" = true;
            };

            # Telemetry
            "telemetry.enableCrashReporter" = false;
            "telemetry.enableTelemetry" = false;
            "redhat.telemetry.enabled" = false;
            "githubPullRequests.telemetry.enabled" = false;
            "telemetry.telemetryLevel" = "off";

            # Updates
            "update.mode" = "none";

            # Git
            "git.autofetch" = true;
            "gitlens.codeLens.enabled" = false;
            "gitlens.currentLine.enabled" = false;

            # Python
            "python.languageServer" = "Pylance";
            "python.analysis.autoImportCompletions" = true;
            "python.analysis.typeCheckingMode" = "basic";
            "python.linting.enabled" = true;
            "python.linting.pylintEnabled" = true;
            "python.linting.pylintPath" = "${pkgs.python3Packages.pylint}/bin/pylint";
            "python.formatting.autopep8Path" = "${pkgs.python3Packages.autopep8}/bin/autopep8";

            # Languages
            ## Nix
            "nix.enableLanguageServer" = true;
            "nixEnvSelector.nixFile" = "\${workspaceRoot}/shell.nix";
            "nix.serverPath" = "${pkgs.rnix-lsp}/bin/rnix-lsp";
            "[nix]" = {
                "editor.tabSize" = 4;
                "formatterPath" = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt";
                "editor.defaultFormatter" = "jnoortheen.nix-ide";
            };
            ## java
            "[java]" = {
                "editor.defaultFormatter" = "redhat.java";
                "java.format.settings.profile" = "GoogleStyle";
            };
            ## Docker
            "[dockerfile]" = {
                "editor.defaultFormatter" = "ms-azuretools.vscode-docker";
            };
            ## Web
            "[html][javascript][javascriptreact][json][typescript][typescriptreact][scss]" = {
                "editor.defaultFormatter" = "esbenp.prettier-vscode";
            };
            ## Bash
            "[shellscript]" = {
                "editor.tabSize" = 2;
                "editor.insertSpaces" = false;
                "shellformat.path" = "${pkgs.shfmt}/bin/shfmt";
            };
            ## C, CPP
            "[cpp][c]" = {
                "editor.defaultFormatter" = "xaver.clang-format";
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

    home.file.".vscode-oss/extensions/mahmoudk1000.mont/themes/mont-color-theme.json".text = ''
        {
            "name": "Mont",
            "type": "dark",
            "colors": {
                "editor.background": "${theme.base00}",
                "editor.foreground": "${theme.base01}",
                "activityBarBadge.background": "${theme.base06}",
                "sideBarTitle.foreground": "${theme.base01}",
                "titleBar.activeBackground": "${theme.base00}",
                "editorIndentGuide.background": "${theme.base00}",
                "editorRuler.foreground": "${theme.base00}",
                "scrollbar.shadow": "${theme.base00 + "00"}",
                "debugToolBar.background": "${theme.base00}",
                "editorBracketMatch.background": "${theme.base00}",
                "editorOverviewRuler.border": "${theme.base00}",
                "editorHoverWidget.background": "${theme.base00}",
                "editorGroupHeader.tabsBackground": "${theme.base00}",
                "tab.inactiveBackground": "${theme.base00}",
                "tab.border": "${theme.base00}",
                "statusBar.noFolderBackground": "${theme.base00}",
                "statusBar.border": "${theme.base00 + "60"}",
                "statusBar.background": "${theme.base00}",
                "activityBar.background": "${theme.base00}",
                "activityBar.border": "${theme.base00 + "60"}",
                "titleBar.inactiveBackground": "${theme.base00}",
                "titleBar.border": "${theme.base00  + "60"}",
                "sideBar.background": "${theme.base00}",
                "sideBar.border": "${theme.base00 + "60"}",
                "sideBarSectionHeader.background": "${theme.base00}",
                "sideBarSectionHeader.border": "${theme.base00 + "60"}",
                "dropdown.background": "${theme.base00}",
                "list.hoverBackground": "${theme.base00}",
                "list.activeSelectionBackground": "${theme.base00}",
                "editorSuggestWidget.background": "${theme.base00}",
                "editorWidget.background": "${theme.base00}",
                "panel.border": "${theme.base00 + "60"}",
                "panel.background": "${theme.base00}",
                "notifications.background": "${theme.base00}",
                "breadcrumb.background": "${theme.base00}",
                "breadcrumbPicker.background": "${theme.base00}",
                "menu.background": "${theme.base00}",
                "settings.dropdownBackground": "${theme.base00}",
                "settings.numberInputBackground": "${theme.base00}",
                "settings.textInputBackground": "${theme.base00}",
                "settings.checkboxBackground": "${theme.base00}",
                "sideBar.background": "${theme.base00}",
                "selection.background": "${theme.base01}",
                "progressBar.background": "${theme.base01}",
                "textLink.foreground": "${theme.base01}",
                "pickerGroup.foreground": "${theme.base01}",
                "editorOverviewRuler.findMatchForeground": "${theme.base01}",
                "editor.findMatchBorder": "${theme.base01}",
                "tab.activeBorder": "${theme.base01}",
                "statusBarItem.remoteBackground": "${theme.base01}",
                "activityBarBadge.background": "${theme.base01}",
                "list.activeSelectionForeground": "${theme.base01}",
                "list.inactiveSelectionForeground": "${theme.base01}",
                "list.highlightForeground": "${theme.base01}",
                "scrollbarSlider.activeBackground": "${theme.base01}",
                "editorSuggestWidget.highlightForeground": "${theme.base01}",
                "editorWidget.resizeBorder": "${theme.base01}",
                "panelTitle.activeBorder": "${theme.base01}",
                "notificationLink.foreground": "${theme.base01}",
                "breadcrumb.activeSelectionForeground": "${theme.base01}",
                "menu.selectionForeground": "${theme.base01}",
                "menubar.selectionForeground": "${theme.base01}",
                "settings.headerForeground": "${theme.base01}",
                "settings.modifiedItemIndicator": "${theme.base01}",
                "selection.background": "${theme.base06}",
                "progressBar.background": "${theme.base06}",
                "textLink.foreground": "${theme.base06}",
                "pickerGroup.foreground": "${theme.base06}",
                "editorOverviewRuler.findMatchForeground": "${theme.base06}",
                "editor.findMatchBorder": "${theme.base06}",
                "tab.activeBorder": "${theme.base06}",
                "statusBarItem.remoteBackground": "${theme.base06}",
                "activityBarBadge.background": "${theme.base06}",
                "list.activeSelectionForeground": "${theme.base06}",
                "list.inactiveSelectionForeground": "${theme.base06}",
                "list.highlightForeground": "${theme.base06}",
                "scrollbarSlider.activeBackground": "${theme.base06}",
                "editorSuggestWidget.highlightForeground": "${theme.base06}",
                "editorWidget.resizeBorder": "${theme.base06}",
                "panelTitle.activeBorder": "${theme.base06}",
                "notificationLink.foreground": "${theme.base06}",
                "breadcrumb.activeSelectionForeground": "${theme.base07}",
                "menu.selectionForeground": "${theme.base06}",
                "menubar.selectionForeground": "${theme.base06}",
                "settings.headerForeground": "${theme.base06}",
                "settings.modifiedItemIndicator": "${theme.base06}",
                "focusBorder": "${theme.base01 + "00"}",
                "editorCursor.foreground": "${theme.base05}",
                "editorRuler.foreground": "${theme.base09}",
                "widget.shadow": "${theme.BLACK + "30"}",
                "button.background": "${theme.base07 + "50"}",
                "editorLineNumber.foreground": "${theme.base09 + "80"}",
                "editorLineNumber.activeForeground": "${theme.base09}",
                "editorBracketMatch.border": "${theme.base05 + "50"}",
                "editorOverviewRuler.errorForeground": "${theme.base03 + "40"}",
                "editorOverviewRuler.infoForeground": "${theme.base06 + "40"}",
                "editorOverviewRuler.warningForeground": "${theme.base05 + "40"}",
                "editorInfo.foreground": "${theme.base06 + "70"}",
                "editorWarning.foreground": "${theme.base00 + "70"}",
                "editorError.foreground": "${theme.base03 + "70"}",
                "editorHoverWidget.border": "${theme.base01 + "10"}",
                "editorIndentGuide.background": "${theme.base09 + "70"}",
                "editorIndentGuide.activeBackground": "${theme.base09}",
                "editorGroup.border": "${theme.BLACK + "30"}",
                "editorGutter.modifiedBackground": "${theme.base06 + "60"}",
                "editorGutter.addedBackground": "${theme.base04 + "60"}",
                "editorGutter.deletedBackground": "${theme.base03 + "60"}",
                "editor.lineHighlightBackground": "${theme.BLACK + "50"}",
                "editor.selectionBackground": "${theme.base06 + "50"}",
                "editor.selectionHighlightBackground": "${theme.base05 + "20"}",
                "editor.findMatchBackground": "${theme.BLACK}",
                "editor.findMatchHighlightBackground": "${theme.BLACK + "50"}",
                "editor.findMatchHighlightBorder": "${theme.base01 + "30"}",
                "tab.activeModifiedBorder": "${theme.base09}",
                "tab.unfocusedActiveBorder": "${theme.base09}",
                "tab.activeForeground": "${theme.base01}",
                "tab.inactiveForeground": "${theme.base09}",
                "statusBar.foreground": "${theme.base09}",
                "statusBar.debuggingBackground": "${theme.base06}",
                "statusBar.debuggingForeground": "${theme.base01}",
                "statusBarItem.hoverBackground": "${theme.base09 + "20"}",
                "statusBarItem.remoteForeground": "${theme.BLACK}",
                "activityBarBadge.foreground": "${theme.BLACK}",
                "titleBar.inactiveForeground": "${theme.base09}",
                "sideBar.foreground": "${theme.base09}",
                "input.background": "${theme.base09}",
                "input.foreground": "${theme.base01}",
                "input.border": "${theme.base01 + "10"}",
                "inputValidation.errorBorder": "${theme.base03 + "50"}",
                "inputValidation.infoBorder": "${theme.base06 + "50"}",
                "inputValidation.warningBorder": "${theme.base05 + "50"}",
                "dropdown.border": "${theme.base01 + "10"}",
                "list.hoverForeground": "${theme.base01}",
                "list.inactiveSelectionBackground": "${theme.BLACK + "30"}",
                "terminal.ansiWhite": "${theme.base01}",
                "terminal.ansiBlack": "${theme.base02}",
                "terminal.ansiBlue": "${theme.base06}",
                "terminal.ansiCyan": "${theme.base08}",
                "terminal.ansiGreen": "${theme.base04}",
                "terminal.ansiMagenta": "${theme.base06}",
                "terminal.ansiRed": "${theme.base03}",
                "terminal.ansiYellow": "${theme.base05}",
                "terminal.ansiBrightWhite": "${theme.base01}",
                "terminal.ansiBrightBlack": "${theme.base02}",
                "terminal.ansiBrightBlue": "${theme.base06}",
                "terminal.ansiBrightCyan": "${theme.base08}",
                "terminal.ansiBrightGreen": "${theme.base04}",
                "terminal.ansiBrightMagenta": "${theme.base06}",
                "terminal.ansiBrightRed": "${theme.base03}",
                "terminal.ansiBrightYellow": "${theme.base05}",
                "terminalCursor.foreground": "${theme.base01}",
                "terminalCursor.background": "${theme.BLACK}",
                "editorSuggestWidget.selectedBackground": "${theme.base07 + "50"}",
                "editorSuggestWidget.border": "${theme.base01 + "10"}",
                "panelTitle.activeForeground": "${theme.base01}",
                "diffEditor.insertedTextBackground": "${theme.base04 + "15"}",
                "diffEditor.removedTextBackground": "${theme.base03 + "20"}",
                "badge.background": "${theme.BLACK + "30"}",
                "badge.foreground": "${theme.base09}",
                "extensionButton.prominentBackground": "${theme.base04 + "90"}",
                "extensionButton.prominentHoverBackground": "${theme.base04}",
                "peekView.border": "${theme.BLACK + "30"}",
                "peekViewResult.matchHighlightBackground": "${theme.base06 + "50"}",
                "peekViewEditor.matchHighlightBackground": "${theme.base06 + "50"}",
                "gitDecoration.deletedResourceForeground": "${theme.base03 + "90"}",
                "gitDecoration.conflictingResourceForeground": "${theme.base05 + "90"}",
                "gitDecoration.modifiedResourceForeground": "${theme.base08 + "90"}",
                "gitDecoration.untrackedResourceForeground": "${theme.base04 + "90"}",
                "gitDecoration.ignoredResourceForeground": "${theme.base09 + "90"}",
                "peekViewResult.selectionBackground": "${theme.base09 + "70"}",
                "breadcrumb.foreground": "${theme.base09}",
                "menu.selectionBackground": "${theme.BLACK + "50"}",
                "menu.selectionBorder": "${theme.BLACK + "30"}",
                "menubar.selectionBackground": "${theme.BLACK + "30"}",
                "menubar.selectionBorder": "${theme.BLACK + "30"}",
                "listFilterWidget.background": "${theme.BLACK + "30"}",
                "listFilterWidget.outline": "${theme.BLACK + "30"}",
                "listFilterWidget.noMatchesOutline": "${theme.BLACK + "30"}",
                "tree.indentGuidesStroke": "${theme.base09}",
                "editorBracketHighlight.foreground1": "${theme.base06}",
                "editorBracketHighlight.foreground2": "${theme.base04}",
                "editorBracketHighlight.foreground3": "${theme.base05}",
                "editorBracketHighlight.foreground4": "${theme.base03}",
                "editorBracketHighlight.foreground5": "${theme.base08}",
                "editorBracketHighlight.foreground6": "${theme.base07}",
                "editorBracketHighlight.unexpectedBracket.foreground": "${theme.base01}"
            },
            "tokenColors": [
                {
                "settings": {
                    "background": "${theme.base00}",
                    "foreground": "${theme.base01}"
                }
                },
                {
                "name": "Comment",
                "scope": [
                    "comment",
                    "punctuation.definition.comment",
                    "string.quoted.docstring"
                ],
                "settings": {
                    "fontStyle": "italic",
                    "foreground": "${theme.base09}"
                }
                },
                {
                "name": "Variables",
                "scope": ["variable", "string constant.other.placeholder"],
                "settings": {
                    "foreground": "${theme.base01}"
                }
                },
                {
                "name": "PHP Constants",
                "scope": ["constant.other.php"],
                "settings": {
                    "foreground": "${theme.base05}"
                }
                },
                {
                "name": "Colors",
                "scope": ["constant.other.color"],
                "settings": {
                    "foreground": "${theme.base01}"
                }
                },
                {
                "name": "Invalid",
                "scope": ["invalid", "invalid.illegal"],
                "settings": {
                    "foreground": "${theme.base03}"
                }
                },
                {
                "name": "Invalid deprecated",
                "scope": ["invalid.deprecated"],
                "settings": {
                    "foreground": "${theme.base06}"
                }
                },
                {
                "name": "Keyword, Storage",
                "scope": ["keyword", "storage.type", "storage.modifier"],
                "settings": {
                    "foreground": "${theme.base06}"
                }
                },
                {
                "name": "Keyword, Storage",
                "scope": ["Keyword", "Storage"],
                "settings": {
                    "fontStyle": "italic"
                }
                },
                {
                "name": "Operator, Misc",
                "scope": [
                    "keyword.control",
                    "constant.other.color",
                    "punctuation.definition.tag",
                    "punctuation",
                    "punctuation.separator.inheritance.php",
                    "punctuation.definition.tag.html",
                    "punctuation.definition.tag.begin.html",
                    "punctuation.definition.tag.end.html",
                    "punctuation.section.embedded",
                    "keyword.other.template",
                    "keyword.other.substitution"
                ],
                "settings": {
                    "foreground": "${theme.base08}"
                }
                },
                {
                "name": "Keyword Control",
                "scope": ["keyword.control"],
                "settings": {
                    "fontStyle": "italic"
                }
                },
                {
                "name": "Tag",
                "scope": [
                    "entity.name.tag",
                    "meta.tag.sgml",
                    "markup.deleted.git_gutter"
                ],
                "settings": {
                    "foreground": "${theme.base03}"
                }
                },
                {
                "name": "Function, Special Method",
                "scope": [
                    "entity.name.function",
                    "variable.function",
                    "support.function",
                    "keyword.other.special-method"
                ],
                "settings": {
                    "foreground": "${theme.base06}"
                }
                },
                {
                "name": "C-related Block Level Variables",
                "scope": ["source.cpp meta.block variable.other"],
                "settings": {
                    "foreground": "${theme.base03}"
                }
                },
                {
                "name": "Variables constant",
                "scope": ["variable.other.constant"],
                "settings": {
                    "foreground": "${theme.base03}"
                }
                },
                {
                "name": "Other Variable, String Link",
                "scope": ["support.other.variable", "string.other.link"],
                "settings": {
                    "foreground": "${theme.base03}"
                }
                },
                {
                "name": "Number, Constant, Function Argument, Tag Attribute, Embedded",
                "scope": [
                    "constant.numeric",
                    "constant.language",
                    "support.constant",
                    "constant.character",
                    "constant.escape",
                    "keyword.other.unit",
                    "keyword.other"
                ],
                "settings": {
                    "foreground": "${theme.base05}"
                }
                },
                {
                "name": "Number, Constant, Function Argument, Tag Attribute, Embedded",
                "scope": [
                    "variable.parameter.function.language.special",
                    "variable.parameter"
                ],
                "settings": {
                    "foreground": "${theme.base03}"
                }
                },
                {
                "name": "String, Symbols, Inherited Class, Markup Heading",
                "scope": [
                    "string",
                    "constant.other.symbol",
                    "constant.other.key",
                    "entity.other.inherited-class",
                    "markup.heading",
                    "markup.inserted.git_gutter",
                    "meta.group.braces.curly constant.other.object.key.js string.unquoted.label.js"
                ],
                "settings": {
                    "fontStyle": "normal",
                    "foreground": "${theme.base06}"
                }
                },
                {
                "name": "Class, Support",
                "scope": [
                    "entity.name",
                    "support.type",
                    "support.class",
                    "support.orther.namespace.use.php",
                    "meta.use.php",
                    "support.other.namespace.php",
                    "markup.changed.git_gutter",
                    "support.type.sys-types"
                ],
                "settings": {
                    "foreground": "${theme.base05}"
                }
                },
                {
                "name": "Entity Types",
                "scope": ["support.type"],
                "settings": {
                    "foreground": "${theme.base06}"
                }
                },
                {
                "name": "CSS Class and Support",
                "scope": [
                    "source.css support.type.property-name",
                    "source.sass support.type.property-name",
                    "source.scss support.type.property-name",
                    "source.less support.type.property-name",
                    "source.stylus support.type.property-name",
                    "source.postcss support.type.property-name"
                ],
                "settings": {
                    "foreground": "${theme.base06}"
                }
                },
                {
                "name": "Sub-methods",
                "scope": [
                    "entity.name.module.js",
                    "variable.import.parameter.js",
                    "variable.other.class.js"
                ],
                "settings": {
                    "foreground": "${theme.base03}"
                }
                },
                {
                "name": "Language methods",
                "scope": ["variable.language"],
                "settings": {
                    "fontStyle": "italic",
                    "foreground": "${theme.base03}"
                }
                },
                {
                "name": "entity.name.method.js",
                "scope": ["entity.name.method.js"],
                "settings": {
                    "fontStyle": "italic",
                    "foreground": "${theme.base06}"
                }
                },
                {
                "name": "meta.method.js",
                "scope": [
                    "meta.class-method.js entity.name.function.js",
                    "variable.function.constructor"
                ],
                "settings": {
                    "foreground": "${theme.base06}"
                }
                },
                {
                "name": "Attributes",
                "scope": ["entity.other.attribute-name"],
                "settings": {
                    "fontStyle": "italic",
                    "foreground": "${theme.base06}"
                }
                },
                {
                "name": "CSS Classes",
                "scope": ["entity.other.attribute-name.class"],
                "settings": {
                    "foreground": "${theme.base05}"
                }
                },
                {
                "name": "CSS ID's",
                "scope": ["source.sass keyword.control"],
                "settings": {
                    "foreground": "${theme.base06}"
                }
                },
                {
                "name": "Inserted",
                "scope": ["markup.inserted"],
                "settings": {
                    "foreground": "${theme.base06}"
                }
                },
                {
                "name": "Deleted",
                "scope": ["markup.deleted"],
                "settings": {
                    "foreground": "${theme.base03}"
                }
                },
                {
                "name": "Changed",
                "scope": ["markup.changed"],
                "settings": {
                    "foreground": "${theme.base06}"
                }
                },
                {
                "name": "Regular Expressions",
                "scope": ["string.regexp"],
                "settings": {
                    "foreground": "${theme.base08}"
                }
                },
                {
                "name": "Escape Characters",
                "scope": ["constant.character.escape"],
                "settings": {
                    "foreground": "${theme.base08}"
                }
                },
                {
                "name": "URL",
                "scope": ["*url*", "*link*", "*uri*"],
                "settings": {
                    "fontStyle": "underline"
                }
                },
                {
                "name": "Decorators",
                "scope": [
                    "tag.decorator.js entity.name.tag.js",
                    "tag.decorator.js punctuation.definition.tag.js"
                ],
                "settings": {
                    "fontStyle": "italic",
                    "foreground": "${theme.base06}"
                }
                },
                {
                "name": "ES7 Bind Operator",
                "scope": [
                    "source.js constant.other.object.key.js string.unquoted.label.js"
                ],
                "settings": {
                    "fontStyle": "italic",
                    "foreground": "${theme.base03}"
                }
                },
                {
                "name": "JSON Key - Level 0",
                "scope": [
                    "source.json meta.structure.dictionary.json support.type.property-name.json"
                ],
                "settings": {
                    "foreground": "${theme.base06}"
                }
                },
                {
                "name": "JSON Key - Level 1",
                "scope": [
                    "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
                ],
                "settings": {
                    "foreground": "${theme.base05}"
                }
                },
                {
                "name": "JSON Key - Level 2",
                "scope": [
                    "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
                ],
                "settings": {
                    "foreground": "${theme.base04}"
                }
                },
                {
                "name": "JSON Key - Level 3",
                "scope": [
                    "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
                ],
                "settings": {
                    "foreground": "${theme.base03}"
                }
                },
                {
                "name": "JSON Key - Level 4",
                "scope": [
                    "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
                ],
                "settings": {
                    "foreground": "${theme.base05}"
                }
                },
                {
                "name": "JSON Key - Level 5",
                "scope": [
                    "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
                ],
                "settings": {
                    "foreground": "${theme.base06}"
                }
                },
                {
                "name": "JSON Key - Level 6",
                "scope": [
                    "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
                ],
                "settings": {
                    "foreground": "${theme.base03}"
                }
                },
                {
                "name": "JSON Key - Level 7",
                "scope": [
                    "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
                ],
                "settings": {
                    "foreground": "${theme.base06}"
                }
                },
                {
                "name": "JSON Key - Level 8",
                "scope": [
                    "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
                ],
                "settings": {
                    "foreground": "${theme.base06}"
                }
                },
                {
                "name": "Markdown - Plain",
                "scope": [
                    "text.html.markdown",
                    "punctuation.definition.list_item.markdown"
                ],
                "settings": {
                    "foreground": "${theme.base01}"
                }
                },
                {
                "name": "Markdown - Markup Raw Inline",
                "scope": ["text.html.markdown markup.inline.raw.markdown"],
                "settings": {
                    "foreground": "${theme.base06}"
                }
                },
                {
                "name": "Markdown - Markup Raw Inline Punctuation",
                "scope": [
                    "text.html.markdown markup.inline.raw.markdown punctuation.definition.raw.markdown"
                ],
                "settings": {
                    "foreground": "#DCDDED50"
                }
                },
                {
                "name": "Markdown - Line Break",
                "scope": ["text.html.markdown meta.dummy.line-break"],
                "settings": {
                    "foreground": ""
                }
                },
                {
                "name": "Markdown - Heading",
                "scope": [
                    "markdown.heading",
                    "markup.heading | markup.heading entity.name",
                    "markup.heading.markdown punctuation.definition.heading.markdown"
                ],
                "settings": {
                    "foreground": "${theme.base06}"
                }
                },
                {
                "name": "Markup - Italic",
                "scope": ["markup.italic"],
                "settings": {
                    "fontStyle": "italic",
                    "foreground": "${theme.base03}"
                }
                },
                {
                "name": "Markup - Bold",
                "scope": ["markup.bold", "markup.bold string"],
                "settings": {
                    "fontStyle": "bold",
                    "foreground": "${theme.base03}"
                }
                },
                {
                "name": "Markup - Bold-Italic",
                "scope": [
                    "markup.bold markup.italic",
                    "markup.italic markup.bold",
                    "markup.quote markup.bold",
                    "markup.bold markup.italic string",
                    "markup.italic markup.bold string",
                    "markup.quote markup.bold string"
                ],
                "settings": {
                    "fontStyle": "bold",
                    "foreground": "${theme.base03}"
                }
                },
                {
                "name": "Markup - Underline",
                "scope": ["markup.underline"],
                "settings": {
                    "fontStyle": "underline",
                    "foreground": "${theme.base05}"
                }
                },
                {
                "name": "Markup - Strike",
                "scope": ["markup.strike"],
                "settings": {
                    "fontStyle": "strike",
                    "foreground": ""
                }
                },
                {
                "name": "Markdown - Blockquote",
                "scope": ["markup.quote punctuation.definition.blockquote.markdown"],
                "settings": {
                    "foreground": "#DCDDED50"
                }
                },
                {
                "name": "Markup - Quote",
                "scope": ["markup.quote"],
                "settings": {
                    "fontStyle": "italic",
                    "foreground": ""
                }
                },
                {
                "name": "Markdown - Link",
                "scope": ["string.other.link.title.markdown"],
                "settings": {
                    "foreground": "${theme.base06}"
                }
                },
                {
                "name": "Markdown - Link Description",
                "scope": ["string.other.link.description.title.markdown"],
                "settings": {
                    "foreground": "${theme.base06}"
                }
                },
                {
                "name": "Markdown - Link Anchor",
                "scope": ["constant.other.reference.link.markdown"],
                "settings": {
                    "foreground": "${theme.base05}"
                }
                },
                {
                "name": "Markup - Raw Block",
                "scope": ["markup.raw.block"],
                "settings": {
                    "foreground": "${theme.base07}"
                }
                },
                {
                "name": "Markdown - Fenced Bode Block Variable",
                "scope": [
                    "markup.fenced_code.block.markdown",
                    "markup.inline.raw.string.markdown"
                ],
                "settings": {
                    "foreground": "${theme.base01 + "90"}"
                }
                },
                {
                "name": "Markdown - Fenced Language",
                "scope": ["variable.language.fenced.markdown"],
                "settings": {
                    "foreground": "${theme.base01 + "50"}"
                }
                },
                {
                "name": "Markdown - Separator",
                "scope": ["meta.separator"],
                "settings": {
                    "fontStyle": "bold",
                    "foreground": "${theme.base01 + "50"}"
                }
                },
                {
                "name": "Markup - Table",
                "scope": ["markup.table"],
                "settings": {
                    "foreground": "${theme.base01}"
                }
                }
            ]
        }
    '';
}
