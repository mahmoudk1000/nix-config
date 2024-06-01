{ theme }:

with theme;

''
  {
    "name": "Mont",
      "type": "dark",
      "colors": {
        "editor.background": "${base00}",
        "editor.foreground": "${base01}",
        "activityBarBadge.background": "${base06}",
        "sideBarTitle.foreground": "${base01}",
        "titleBar.activeBackground": "${base00}",
        "editorIndentGuide.background": "${base00}",
        "editorRuler.foreground": "${base00}",
        "scrollbar.shadow": "${base00 + "00"}",
        "debugToolBar.background": "${base00}",
        "editorBracketMatch.background": "${base00}",
        "editorOverviewRuler.border": "${base00}",
        "editorHoverWidget.background": "${base00}",
        "editorGroupHeader.tabsBackground": "${base00}",
        "tab.inactiveBackground": "${base00}",
        "tab.border": "${base00}",
        "statusBar.noFolderBackground": "${base00}",
        "statusBar.border": "${base00 + "60"}",
        "statusBar.background": "${base00}",
        "activityBar.background": "${base00}",
        "activityBar.border": "${base00 + "60"}",
        "titleBar.inactiveBackground": "${base00}",
        "titleBar.border": "${base00 + "60"}",
        "sideBar.background": "${base00}",
        "sideBar.border": "${base00 + "60"}",
        "sideBarSectionHeader.background": "${base00}",
        "sideBarSectionHeader.border": "${base00 + "60"}",
        "dropdown.background": "${base00}",
        "list.hoverBackground": "${base00}",
        "list.activeSelectionBackground": "${base00}",
        "editorSuggestWidget.background": "${base00}",
        "editorWidget.background": "${base00}",
        "panel.border": "${base00 + "60"}",
        "panel.background": "${base00}",
        "notifications.background": "${base00}",
        "breadcrumb.background": "${base00}",
        "breadcrumbPicker.background": "${base00}",
        "menu.background": "${base00}",
        "settings.dropdownBackground": "${base00}",
        "settings.numberInputBackground": "${base00}",
        "settings.textInputBackground": "${base00}",
        "settings.checkboxBackground": "${base00}",
        "sideBar.background": "${base00}",
        "selection.background": "${base01}",
        "progressBar.background": "${base01}",
        "textLink.foreground": "${base01}",
        "pickerGroup.foreground": "${base01}",
        "editorOverviewRuler.findMatchForeground": "${base01}",
        "editor.findMatchBorder": "${base01}",
        "tab.activeBorder": "${base01}",
        "statusBarItem.remoteBackground": "${base01}",
        "activityBarBadge.background": "${base01}",
        "list.activeSelectionForeground": "${base01}",
        "list.inactiveSelectionForeground": "${base01}",
        "list.highlightForeground": "${base01}",
        "scrollbarSlider.activeBackground": "${base01}",
        "editorSuggestWidget.highlightForeground": "${base01}",
        "editorWidget.resizeBorder": "${base01}",
        "panelTitle.activeBorder": "${base01}",
        "notificationLink.foreground": "${base01}",
        "breadcrumb.activeSelectionForeground": "${base01}",
        "menu.selectionForeground": "${base01}",
        "menubar.selectionForeground": "${base01}",
        "settings.headerForeground": "${base01}",
        "settings.modifiedItemIndicator": "${base01}",
        "selection.background": "${base06}",
        "progressBar.background": "${base06}",
        "textLink.foreground": "${base06}",
        "pickerGroup.foreground": "${base06}",
        "editorOverviewRuler.findMatchForeground": "${base06}",
        "editor.findMatchBorder": "${base06}",
        "tab.activeBorder": "${base06}",
        "statusBarItem.remoteBackground": "${base06}",
        "activityBarBadge.background": "${base06}",
        "list.activeSelectionForeground": "${base06}",
        "list.inactiveSelectionForeground": "${base06}",
        "list.highlightForeground": "${base06}",
        "scrollbarSlider.activeBackground": "${base06}",
        "editorSuggestWidget.highlightForeground": "${base06}",
        "editorWidget.resizeBorder": "${base06}",
        "panelTitle.activeBorder": "${base06}",
        "notificationLink.foreground": "${base06}",
        "breadcrumb.activeSelectionForeground": "${base07}",
        "menu.selectionForeground": "${base06}",
        "menubar.selectionForeground": "${base06}",
        "settings.headerForeground": "${base06}",
        "settings.modifiedItemIndicator": "${base06}",
        "focusBorder": "${base01 + "00"}",
        "editorCursor.foreground": "${base05}",
        "editorRuler.foreground": "${base0A}",
        "widget.shadow": "${base0A + "30"}",
        "button.background": "${base07 + "50"}",
        "editorLineNumber.foreground": "${base0A + "80"}",
        "editorLineNumber.activeForeground": "${base0A}",
        "editorBracketMatch.border": "${base05 + "50"}",
        "editorOverviewRuler.errorForeground": "${base03 + "40"}",
        "editorOverviewRuler.infoForeground": "${base06 + "40"}",
        "editorOverviewRuler.warningForeground": "${base05 + "40"}",
        "editorInfo.foreground": "${base06 + "70"}",
        "editorWarning.foreground": "${base00 + "70"}",
        "editorError.foreground": "${base03 + "70"}",
        "editorHoverWidget.border": "${base01 + "10"}",
        "editorIndentGuide.background": "${base0A + "70"}",
        "editorIndentGuide.activeBackground": "${base0A}",
        "editorGroup.border": "${base0A + "30"}",
        "editorGutter.modifiedBackground": "${base06 + "60"}",
        "editorGutter.addedBackground": "${base04 + "60"}",
        "editorGutter.deletedBackground": "${base03 + "60"}",
        "editor.lineHighlightBackground": "${base0A + "50"}",
        "editor.selectionBackground": "${base06 + "50"}",
        "editor.selectionHighlightBackground": "${base05 + "20"}",
        "editor.findMatchBackground": "${base0A}",
        "editor.findMatchHighlightBackground": "${base0A + "50"}",
        "editor.findMatchHighlightBorder": "${base01 + "30"}",
        "tab.activeModifiedBorder": "${base0A}",
        "tab.unfocusedActiveBorder": "${base0A}",
        "tab.activeForeground": "${base01}",
        "tab.inactiveForeground": "${base0A}",
        "statusBar.foreground": "${base0A}",
        "statusBar.debuggingBackground": "${base06}",
        "statusBar.debuggingForeground": "${base01}",
        "statusBarItem.hoverBackground": "${base0A + "20"}",
        "statusBarItem.remoteForeground": "${base0A}",
        "activityBarBadge.foreground": "${base0A}",
        "titleBar.inactiveForeground": "${base0A}",
        "sideBar.foreground": "${base0A}",
        "input.background": "${base0A}",
        "input.foreground": "${base01}",
        "input.border": "${base01 + "10"}",
        "inputValidation.errorBorder": "${base03 + "50"}",
        "inputValidation.infoBorder": "${base06 + "50"}",
        "inputValidation.warningBorder": "${base05 + "50"}",
        "dropdown.border": "${base01 + "10"}",
        "list.hoverForeground": "${base01}",
        "list.inactiveSelectionBackground": "${base0A + "30"}",
        "terminal.ansiWhite": "${base01}",
        "terminal.ansiBlack": "${base02}",
        "terminal.ansiBlue": "${base06}",
        "terminal.ansiCyan": "${base08}",
        "terminal.ansiGreen": "${base04}",
        "terminal.ansiMagenta": "${base06}",
        "terminal.ansiRed": "${base03}",
        "terminal.ansiYellow": "${base05}",
        "terminal.ansiBrightWhite": "${base01}",
        "terminal.ansiBrightBlack": "${base02}",
        "terminal.ansiBrightBlue": "${base06}",
        "terminal.ansiBrightCyan": "${base08}",
        "terminal.ansiBrightGreen": "${base04}",
        "terminal.ansiBrightMagenta": "${base06}",
        "terminal.ansiBrightRed": "${base03}",
        "terminal.ansiBrightYellow": "${base05}",
        "terminalCursor.foreground": "${base01}",
        "terminalCursor.background": "${base0A}",
        "editorSuggestWidget.selectedBackground": "${base07 + "50"}",
        "editorSuggestWidget.border": "${base01 + "10"}",
        "panelTitle.activeForeground": "${base01}",
        "diffEditor.insertedTextBackground": "${base04 + "15"}",
        "diffEditor.removedTextBackground": "${base03 + "20"}",
        "badge.background": "${base0A + "30"}",
        "badge.foreground": "${base0A}",
        "extensionButton.prominentBackground": "${base04 + "90"}",
        "extensionButton.prominentHoverBackground": "${base04}",
        "peekView.border": "${base0A + "30"}",
        "peekViewResult.matchHighlightBackground": "${base06 + "50"}",
        "peekViewEditor.matchHighlightBackground": "${base06 + "50"}",
        "gitDecoration.deletedResourceForeground": "${base03 + "90"}",
        "gitDecoration.conflictingResourceForeground": "${base05 + "90"}",
        "gitDecoration.modifiedResourceForeground": "${base08 + "90"}",
        "gitDecoration.untrackedResourceForeground": "${base04 + "90"}",
        "gitDecoration.ignoredResourceForeground": "${base0A + "90"}",
        "peekViewResult.selectionBackground": "${base0A + "70"}",
        "breadcrumb.foreground": "${base0A}",
        "menu.selectionBackground": "${base0A + "50"}",
        "menu.selectionBorder": "${base0A + "30"}",
        "menubar.selectionBackground": "${base0A + "30"}",
        "menubar.selectionBorder": "${base0A + "30"}",
        "listFilterWidget.background": "${base0A + "30"}",
        "listFilterWidget.outline": "${base0A + "30"}",
        "listFilterWidget.noMatchesOutline": "${base0A + "30"}",
        "tree.indentGuidesStroke": "${base0A}",
        "editorBracketHighlight.foreground1": "${base06}",
        "editorBracketHighlight.foreground2": "${base04}",
        "editorBracketHighlight.foreground3": "${base05}",
        "editorBracketHighlight.foreground4": "${base03}",
        "editorBracketHighlight.foreground5": "${base08}",
        "editorBracketHighlight.foreground6": "${base07}",
        "editorBracketHighlight.unexpectedBracket.foreground": "${base01}"
      },
      "tokenColors": [
      {
        "settings": {
          "background": "${base00}",
          "foreground": "${base01}"
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
          "foreground": "${base0A}"
        }
      },
      {
        "name": "Variables",
        "scope": ["variable", "string constant.other.placeholder"],
        "settings": {
          "foreground": "${base01}"
        }
      },
      {
        "name": "PHP Constants",
        "scope": ["constant.other.php"],
        "settings": {
          "foreground": "${base05}"
        }
      },
      {
        "name": "Colors",
        "scope": ["constant.other.color"],
        "settings": {
          "foreground": "${base01}"
        }
      },
      {
        "name": "Invalid",
        "scope": ["invalid", "invalid.illegal"],
        "settings": {
          "foreground": "${base03}"
        }
      },
      {
        "name": "Invalid deprecated",
        "scope": ["invalid.deprecated"],
        "settings": {
          "foreground": "${base06}"
        }
      },
      {
        "name": "Keyword, Storage",
        "scope": ["keyword", "storage.type", "storage.modifier"],
        "settings": {
          "foreground": "${base06}"
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
          "foreground": "${base08}"
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
          "foreground": "${base03}"
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
          "foreground": "${base06}"
        }
      },
      {
        "name": "C-related Block Level Variables",
        "scope": ["source.cpp meta.block variable.other"],
        "settings": {
          "foreground": "${base03}"
        }
      },
      {
        "name": "Variables constant",
        "scope": ["variable.other.constant"],
        "settings": {
          "foreground": "${base03}"
        }
      },
      {
        "name": "Other Variable, String Link",
        "scope": ["support.other.variable", "string.other.link"],
        "settings": {
          "foreground": "${base03}"
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
          "foreground": "${base05}"
        }
      },
      {
        "name": "Number, Constant, Function Argument, Tag Attribute, Embedded",
        "scope": [
          "variable.parameter.function.language.special",
        "variable.parameter"
        ],
        "settings": {
          "foreground": "${base03}"
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
          "foreground": "${base06}"
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
          "foreground": "${base05}"
        }
      },
      {
        "name": "Entity Types",
        "scope": ["support.type"],
        "settings": {
          "foreground": "${base06}"
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
          "foreground": "${base06}"
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
          "foreground": "${base03}"
        }
      },
      {
        "name": "Language methods",
        "scope": ["variable.language"],
        "settings": {
          "fontStyle": "italic",
          "foreground": "${base03}"
        }
      },
      {
        "name": "entity.name.method.js",
        "scope": ["entity.name.method.js"],
        "settings": {
          "fontStyle": "italic",
          "foreground": "${base06}"
        }
      },
      {
        "name": "meta.method.js",
        "scope": [
          "meta.class-method.js entity.name.function.js",
        "variable.function.constructor"
        ],
        "settings": {
          "foreground": "${base06}"
        }
      },
      {
        "name": "Attributes",
        "scope": ["entity.other.attribute-name"],
        "settings": {
          "fontStyle": "italic",
          "foreground": "${base06}"
        }
      },
      {
        "name": "CSS Classes",
        "scope": ["entity.other.attribute-name.class"],
        "settings": {
          "foreground": "${base05}"
        }
      },
      {
        "name": "CSS ID's",
        "scope": ["source.sass keyword.control"],
        "settings": {
          "foreground": "${base06}"
        }
      },
      {
        "name": "Inserted",
        "scope": ["markup.inserted"],
        "settings": {
          "foreground": "${base06}"
        }
      },
      {
        "name": "Deleted",
        "scope": ["markup.deleted"],
        "settings": {
          "foreground": "${base03}"
        }
      },
      {
        "name": "Changed",
        "scope": ["markup.changed"],
        "settings": {
          "foreground": "${base06}"
        }
      },
      {
        "name": "Regular Expressions",
        "scope": ["string.regexp"],
        "settings": {
          "foreground": "${base08}"
        }
      },
      {
        "name": "Escape Characters",
        "scope": ["constant.character.escape"],
        "settings": {
          "foreground": "${base08}"
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
          "foreground": "${base06}"
        }
      },
      {
        "name": "ES7 Bind Operator",
        "scope": [
          "source.js constant.other.object.key.js string.unquoted.label.js"
        ],
        "settings": {
          "fontStyle": "italic",
          "foreground": "${base03}"
        }
      },
      {
        "name": "JSON Key - Level 0",
        "scope": [
          "source.json meta.structure.dictionary.json support.type.property-name.json"
        ],
        "settings": {
          "foreground": "${base06}"
        }
      },
      {
        "name": "JSON Key - Level 1",
        "scope": [
          "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
        ],
        "settings": {
          "foreground": "${base05}"
        }
      },
      {
        "name": "JSON Key - Level 2",
        "scope": [
          "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
        ],
        "settings": {
          "foreground": "${base04}"
        }
      },
      {
        "name": "JSON Key - Level 3",
        "scope": [
          "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
        ],
        "settings": {
          "foreground": "${base03}"
        }
      },
      {
        "name": "JSON Key - Level 4",
        "scope": [
          "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
        ],
        "settings": {
          "foreground": "${base05}"
        }
      },
      {
        "name": "JSON Key - Level 5",
        "scope": [
          "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
        ],
        "settings": {
          "foreground": "${base06}"
        }
      },
      {
        "name": "JSON Key - Level 6",
        "scope": [
          "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
        ],
        "settings": {
          "foreground": "${base03}"
        }
      },
      {
        "name": "JSON Key - Level 7",
        "scope": [
          "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
        ],
        "settings": {
          "foreground": "${base06}"
        }
      },
      {
        "name": "JSON Key - Level 8",
        "scope": [
          "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json support.type.property-name.json"
        ],
        "settings": {
          "foreground": "${base06}"
        }
      },
      {
        "name": "Markdown - Plain",
        "scope": [
          "text.html.markdown",
        "punctuation.definition.list_item.markdown"
        ],
        "settings": {
          "foreground": "${base01}"
        }
      },
      {
        "name": "Markdown - Markup Raw Inline",
        "scope": ["text.html.markdown markup.inline.raw.markdown"],
        "settings": {
          "foreground": "${base06}"
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
          "foreground": "${base06}"
        }
      },
      {
        "name": "Markup - Italic",
        "scope": ["markup.italic"],
        "settings": {
          "fontStyle": "italic",
          "foreground": "${base03}"
        }
      },
      {
        "name": "Markup - Bold",
        "scope": ["markup.bold", "markup.bold string"],
        "settings": {
          "fontStyle": "bold",
          "foreground": "${base03}"
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
          "foreground": "${base03}"
        }
      },
      {
        "name": "Markup - Underline",
        "scope": ["markup.underline"],
        "settings": {
          "fontStyle": "underline",
          "foreground": "${base05}"
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
          "foreground": "${base06}"
        }
      },
      {
        "name": "Markdown - Link Description",
        "scope": ["string.other.link.description.title.markdown"],
        "settings": {
          "foreground": "${base06}"
        }
      },
      {
        "name": "Markdown - Link Anchor",
        "scope": ["constant.other.reference.link.markdown"],
        "settings": {
          "foreground": "${base05}"
        }
      },
      {
        "name": "Markup - Raw Block",
        "scope": ["markup.raw.block"],
        "settings": {
          "foreground": "${base07}"
        }
      },
      {
        "name": "Markdown - Fenced Bode Block Variable",
        "scope": [
          "markup.fenced_code.block.markdown",
        "markup.inline.raw.string.markdown"
        ],
        "settings": {
          "foreground": "${base01 + "90"}"
        }
      },
      {
        "name": "Markdown - Fenced Language",
        "scope": ["variable.language.fenced.markdown"],
        "settings": {
          "foreground": "${base01 + "50"}"
        }
      },
      {
        "name": "Markdown - Separator",
        "scope": ["meta.separator"],
        "settings": {
          "fontStyle": "bold",
          "foreground": "${base01 + "50"}"
        }
      },
      {
        "name": "Markup - Table",
        "scope": ["markup.table"],
        "settings": {
          "foreground": "${base01}"
        }
      }
    ]
  }
''
