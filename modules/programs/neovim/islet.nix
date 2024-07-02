{ theme, ... }:

with theme;

let
  name = "islet";
in
{
  home.file.".config/nvim/colors/${name}.lua".text = ''
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
    end

    vim.g.colors_name = "${name}"

    vim.o.background = "dark"
    vim.o.termguicolors = true

    local palette = {
      background = "${base00}",
      foreground = "${base01}",
      norm = "#696C6F",
      subtle= "#C0C0C0",
      black = "${base02}",
      red = "${base03}",
      green = "${base04}",
      yellow = "${base05}",
      blue = "${base06}",
      purple = "${base07}",
      cyan = "${base08}",
      white = "${base09}",
      light_black = "${base0A}",
      light_red = "${base0B}",
      light_green = "${base0C}",
      light_yellow = "${base0D}",
      light_blue = "${base0E}",
      light_purple = "${base0F}",
      light_cyan = "${base0G}",
      light_white = "${base0H}",
    }

    local function highlight(name, opts)
        opts.force = true
        vim.api.nvim_set_hl(0, name, opts)
    end

    -- __TEXT__
    highlight("Normal", { fg = palette.foreground })
    highlight("Title", { fg = palette.green, bold = true })

    -- __Normal__
    highlight("Cursor", { fg = palette.white, reverse = true })
    highlight("SpecialKey", { fg = palette.cyan })
    highlight("Structure", { link = "Type" })
    highlight("Define", { link = "PreProc" })
    highlight("Macro", { link = "PreProc" })
    highlight("Typedef", { link = "Type" })
    highlight("PreCondit", { link = "PreProc" })
    highlight("SpecialChar", { link = "Special" })
    highlight("Tag", { link = "Special" })
    highlight("Debug", { link = "Special" })

    -- __CURSOR__
    highlight("LineNr", { fg = palette.light_black })
    highlight("SignColumn", { fg = palette.white })
    highlight("CursorLineNr", { fg = palette.white })
    highlight("CursorLine", { bg = palette.black })
    highlight("CursorColumn", { bg = palette.black })
    highlight("highlightColumn", { bg = palette.black })
    highlight("FoldColumn", { fg = palette.light_cyan })

    -- __SEARCH__
    highlight("Search", { fg = palette.blue, bg = palette.light_black, reverse = true })
    highlight("CurSearch", { fg = palette.blue, bg = palette.white, reverse = true })
    highlight("IncSearch", { link = "CurSearch" })
    highlight("Substitute", { link = "Search" })

    -- __VISUAL__
    highlight("Visual", { bg = palette.black })
    highlight("VisualNOS", { link = "Visual" })
    highlight("Ignore", { fg = palette.background })

    -- __MESSAGE__
    highlight("Error", { fg = palette.red, bold = true })
    highlight("ErrorMsg", { link = "Error" })
    highlight("ModeMsg", { fg = palette.white })
    highlight("MoreMsg", { fg = palette.white })
    highlight("MsgArea", { fg = palette.white })
    highlight("WarningMsg", { fg = palette.yellow })
    highlight("NvimInternalError", { fg = palette.yellow })
    highlight("healthError", { fg = palette.red })
    highlight("healthSuccess", { fg = palette.green })
    highlight("healthWarning", { fg = palette.purple })

    -- __StatusLine__
    highlight("StatusLine", { fg = palette.white, bg = palette.black })
    highlight("StatusLineNC", { fg = palette.light_white, bg = palette.light_black })
    highlight("StatusLineTerm", { link = "StatusLine" })
    highlight("StatusLineTermNC", { link = "StatusLineNC" })

    -- __TABLINE__
    highlight("Tabline", { fg = palette.white, bg = palette.black })
    highlight("TablineSel", { fg = palette.black, bg = palette.blue })
    highlight("TabLineFill", { reverse = true })

    -- __FLOAT__
    highlight("NormalFloat", { fg = palette.foreground, bg = palette.black })
    highlight("FloatBorder", { fg = palette.light_black, bg = palette.black })
    highlight("FloatTitle", { fg = palette.foreground })

    -- __MENU__
    highlight("Pmenu", { fg = palette.white, bg = palette.black })
    highlight("PmenuSel", { fg = palette.black, bg = palette.blue })
    highlight("PmenuSbar", { fg = palette.white, bg = palette.black })
    highlight("PmenuThumb", { bg = palette.white })

    -- __OTHER UI__
    highlight("WinSeparator", { fg = palette.light_black })
    highlight("EndOfBuffer", { fg = palette.black })
    highlight("QuickFixLine", { fg = palette.green })

    -- __SYNTAX__
    highlight("Function", { fg = palette.light_yellow })
    highlight("Identifier", { fg = palette.subtle, bold = true })
    highlight("Type", { fg = palette.green })
    highlight("Variable", { fg = palette.light_white })
    highlight("Statement", { fg = palette.subtle })
    highlight("Include", { fg = palette.light_purple })
    highlight("Special", { fg = palette.light_green })
    highlight("Keyword", { fg = palette.light_blue, italic = true })
    highlight("Conditional", { fg = palette.norm })
    highlight("Repeat", { link = "Keyword" })
    highlight("Label", { link = "Keyword" })
    highlight("Exception", { link = "Keyword" })
    highlight("PreProc", { link = "Keyword" })

    -- __CONSTANTS__
    highlight("String", { fg = palette.light_green })
    highlight("Constant", { fg = palette.light_white })
    highlight("Directory", { fg = palette.cyan })
    highlight("Character", { link = "String" })
    highlight("Number", { fg = palette.purple })
    highlight("Boolean", { fg = palette.light_cyan })
    highlight("Float", { fg = palette.purple })

    -- __PUNCTUATION__
    highlight("Quote", { fg = palette.light_green })
    highlight("Operator", { fg = palette.light_purple })
    highlight("Delimiter", { fg = palette.light_white })
    highlight("MatchParen", { fg = palette.purple, bold = true })

    -- __NonText__
    highlight("NonText", { fg = palette.black })
    highlight("Folded", { link = "NonText" })
    highlight("qfLineNr", { link = "NonText" })

    -- __COMMENT__
    highlight("Todo", { fg = palette.yellow, bold = true, italic = true })
    highlight("Question", { fg = palette.green })
    highlight("Comment", { fg = palette.light_black, italic = true })
    highlight("SpecialComment", { fg = palette.cyan })
    highlight("Conceal", { fg = palette.black })

    -- __SPELL__
    highlight("SpellBad", { fg = palette.red, underline = true })
    highlight("SpellCap", { fg = palette.light_green, underline = true })
    highlight("SpellRare", { fg = palette.light_red, underline = true })
    highlight("SpellLocal", { fg = palette.light_green, underline = true })

    -- __WILD MENU__
    highlight("WildMenu", { fg = palette.light_black, bold = true, underline = true })

    -- __HTML__
    highlight("htmlH1", { link = "Normal" })
    highlight("htmlH2", { link = "Normal" })
    highlight("htmlH3", { link = "Normal" })
    highlight("htmlH4", { link = "Normal" })
    highlight("htmlH5", { link = "Normal" })
    highlight("htmlH6", { link = "Normal" })

    -- __MARKDOWN__
    highlight("markdownH1", { link = "Statement" })
    highlight("markdownH2", { link = "Statement" })
    highlight("markdownH3", { link = "Statement" })
    highlight("markdownH4", { link = "Statement" })
    highlight("markdownH5", { link = "Statement" })
    highlight("markdownH6", { link = "Statement" })
    highlight("markdownListMarker", { link = "Constant" })
    highlight("markdownCode", { link = "Constant" })
    highlight("markdownCodeBlock", { link = "Constant" })
    highlight("markdownCodeDelimiter", { link = "Constant" })
    highlight("markdownHeadingDelimiter", { link = "Constant" })

    highlight("InfoMsg", { fg = palette.blue })
    highlight("HintMsg", { fg = palette.purple })
    highlight("Warnings", { fg = palette.purple })

    -- Diff
    highlight("DiffAdd", { fg = palette.green, reverse = true })
    highlight("DiffChange", { fg = palette.yellow, reverse = true })
    highlight("DiffDelete", { fg = palette.red, reverse = true })
    highlight("DiffText", { fg = palette.purple, reverse = true })
    highlight("diffAdded", { fg = palette.green })
    highlight("diffRemoved", { fg = palette.red })
    highlight("diffChanged", { fg = palette.yellow })

    -- GitSigns
    highlight("GitSignsAdd", { fg = palette.green })
    highlight("GitSignsChange", { fg = palette.yellow })
    highlight("GitSignsDelete", { fg = palette.red })

    -- Terminal
    vim.g.terminal_color_0 = palette.black
    vim.g.terminal_color_1 = palette.red
    vim.g.terminal_color_2 = palette.green
    vim.g.terminal_color_3 = palette.yellow
    vim.g.terminal_color_4 = palette.blue
    vim.g.terminal_color_5 = palette.purple
    vim.g.terminal_color_6 = palette.cyan
    vim.g.terminal_color_7 = palette.white
    vim.g.terminal_color_8 = palette.light_black
    vim.g.terminal_color_9 = palette.light_red
    vim.g.terminal_color_10 = palette.light_green
    vim.g.terminal_color_11 = palette.light_yellow
    vim.g.terminal_color_12 = palette.light_blue
    vim.g.terminal_color_13 = palette.light_purple
    vim.g.terminal_color_14 = palette.light_cyan
    vim.g.terminal_color_15 = palette.light_white

    -- __ TREE SITTER __
    highlight("@keyword", { link = "Keyword" })
    highlight("@keyword.function", { link = "Function" })
    highlight("@keyword.return", { link = "Special" })
    highlight("@keyword.operator", { link = "Operator" })
    highlight("@keyword.builtin", { link = "Special" })
    highlight("@keyword.macro", { link = "PreProc" })
    highlight("@keyword.method", { link = "Identifier" })
    highlight("@attribute", { link = "Special" })
    highlight("@type", { link = "Type" })
    highlight("@type.definition", { link = "Type" })
    highlight("@property", { link = "Identifier" })
    highlight("@label", { link = "Label" })
    highlight("@annotation", { link = "Cursor" })
    highlight("@attribute", { link = "Constant" })
    highlight("@boolean", { link = "Constant" })
    highlight("@character", { link = "Constant" })
    highlight("@comment", { link = "Comment" })
    highlight("@constant", { link = "Constant" })
    highlight("@constant.builtin", { link = "Constant" })
    highlight("@constant.macro", { link = "PreProc" })
    highlight("@constructor", { link = "Normal" })
    highlight("@diff.delta", { link = "DiffChange" })
    highlight("@diff.minus", { link = "DiffDelete" })
    highlight("@diff.plus", { link = "DiffAdd" })
    highlight("@error", { link = "Error" })
    highlight("@exception", { link = "Error" })
    highlight("@function", { link = "Function" })
    highlight("@function.builtin", { link = "Keyword" })
    highlight("@function.macro", { link = "PreProc" })
    highlight("@function.method", { link = "Normal" })
    highlight("@keyword.conditional", { link = "Normal" })
    highlight("@keyword.import", { link = "Keyword" })
    highlight("@keyword.repeat", { link = "Normal" })
    highlight("@label", { link = "Keyword" })
    highlight("@markup", { link = "Normal" })
    highlight("@markup.emphasis", { link = "italic" })
    highlight("@markup.heading", { link = "light_green" })
    highlight("@markup.link.url", { link = "Constant" })
    highlight("@markup.link.label", { link = "Constant" })
    highlight("@markup.list", { link = "Keyword" })
    highlight("@markup.quote", { link = "Comment" })
    highlight("@markup.raw", { link = "Keyword" })
    highlight("@markup.strike", { link = "strikethrough" })
    highlight("@markup.strong", { link = "bold" })
    highlight("@markup.underline", { link = "Underlined" })
    highlight("@module", { link = "Keyword" })
    highlight("@none", { link = "Keyword" })
    highlight("@number", { link = "Constant" })
    highlight("@number.float", { link = "Constant" })
    highlight("@operator", { link = "Normal" })
    highlight("@property", { link = "@field" })
    highlight("@punctuation.bracket", { link = "Keyword" })
    highlight("@punctuation.delimiter", { link = "Keyword" })
    highlight("@string", { link = "String" })
    highlight("@string.escape", { fg = palette.yellow })
    highlight("@string.regexp", { link = palette.cyan })
    highlight("@string.special.url", { link = "Constant" })
    highlight("@tag", { link = "Tag" })
    highlight("@tag.delimiter", { link = "Delimiter" })
    highlight("@type", { link = "Type" })
    highlight("@type.builtin", { link = "@type" })
    highlight("@variable", { link = "Normal" })
    highlight("@variable.builtin", { link = "Normal" })
    highlight("@variable.member", { link = "Normal" })
    highlight("@variable.parameter", { link = "Statement" })
    highlight("@variable.parameter.reference", { link = "Statement" })

    -- __DIAGNOSTICS__
    highlight("DiagnosticError", { link = "ErrorMsg" })
    highlight("DiagnosticSignError", { link = "ErrorMsg" })
    highlight("DiagnosticFloatingError", { link = "ErrorMsg" })
    highlight("DiagnosticVirtualTextError", { link = "ErrorMsg" })
    highlight("DiagnosticUnderlineError", { link = "ErrorMsg" })

    highlight("DiagnosticWarn", { link = "WarningMsg" })
    highlight("DiagnosticSignWarn", { link = "WarningMsg" })
    highlight("DiagnosticFloatingWarn", { link = "WarningMsg" })
    highlight("DiagnosticVirtualTextWarn", { link = "WarningMsg" })
    highlight("DiagnosticUnderlineWarn", { link = "WarningMsg" })

    highlight("DiagnosticInfo", { link = "InfoMsg" })
    highlight("DiagnosticSignInfo", { link = "InfoMsg" })
    highlight("DiagnosticFloatingInfo", { link = "InfoMsg" })
    highlight("DiagnosticVirtualTextInfo", { link = "InfoMsg" })
    highlight("DiagnosticUnderlineInfo", { link = "InfoMsg" })

    highlight("DiagnosticHint", { link = "HintMsg" })
    highlight("DiagnosticSignHint", { link = "HintMsg" })
    highlight("DiagnosticFloatingHint", { link = "HintMsg" })
    highlight("DiagnosticVirtualTextHint", { link = "HintMsg" })
    highlight("DiagnosticUnderlineHint", { link = "HintMsg" })

    -- __LSP__
    -- Assuming the `palette.highlight` function is defined elsewhere, and 'palette.light_purple', 'palette.light_red', etc., are defined variables
    highlight("LspTroubleNormal", { fg = palette.light_purple })
    highlight("LspTroubleText", { fg = palette.light_red })
    highlight("LspTroubleCount", { fg = palette.red })

    highlight("LspReferenceText", { fg = palette.white, bold = true })
    highlight("LspReferenceRead", { fg = palette.white, bold = true })
    highlight("LspReferenceWrite", { fg = palette.white, bold = true })

    highlight("LspDiagnosticsDefaultError", { link = "Error" })
    highlight("LspDiagnosticsSignError", { link = "DiagnosticSignError" })
    highlight("LspDiagnosticsFloatingError", { link = "DiagnosticFloatingError" })
    highlight("LspDiagnosticsVirtualTextError", { link = "DiagnosticVirtualTextError" })
    highlight("LspDiagnosticsUnderlineError", { link = "DiagnosticUnderlineError" })

    highlight("LspDiagnosticsDefaultWarning", { link = "DiagnosticWarn" })
    highlight("LspDiagnosticsSignWarning", { link = "DiagnosticSignWarn" })
    highlight("LspDiagnosticsFloatingWarning", { link = "DiagnosticFloatingWarn" })
    highlight("LspDiagnosticsVirtualTextWarning", { link = "DiagnosticVirtualTextWarn" })
    highlight("LspDiagnosticsUnderlineWarning", { link = "DiagnosticUnderlineWarn" })

    highlight("LspDiagnosticsDefaultInformation", { link = "DiagnosticInfo" })
    highlight("LspDiagnosticsSignInformation", { link = "DiagnosticSignInfo" })
    highlight("LspDiagnosticsFloatingInformation", { link = "DiagnosticFloatingInfo" })
    highlight("LspDiagnosticsVirtualTextInformation", { link = "DiagnosticVirtualTextInfo" })
    highlight("LspDiagnosticsUnderlineInformation", { link = "DiagnosticUnderlineInfo" })

    highlight("LspDiagnosticsDefaultHint", { link = "DiagnosticHint" })
    highlight("LspDiagnosticsSignHint", { link = "DiagnosticSignHint" })
    highlight("LspDiagnosticsFloatingHint", { link = "DiagnosticFloatingHint" })
    highlight("LspDiagnosticsVirtualTextHint", { link = "DiagnosticVirtualTextHint" })
    highlight("LspDiagnosticsUnderlineHint", { link = "DiagnosticUnderlineHint" })

    -- __GIT GUTTER__
    highlight("GitGutterAdd", { fg = palette.light_green })
    highlight("GitGutterChange", { fg = palette.light_purple })
    highlight("GitGutterDelete", { fg = palette.light_red })

    -- __GITSIGNS__
    highlight("GitSignsAdd", { fg = palette.light_green })
    highlight("GitSignsAddNr", { fg = palette.light_green })
    highlight("GitSignsAddLn", { fg = palette.light_green })
    highlight("GitSignsChange", { fg = palette.light_purple })
    highlight("GitSignsChangeNr", { fg = palette.light_purple })
    highlight("GitSignsChangeLn", { fg = palette.light_purple })
    highlight("GitSignsDelete", { fg = palette.light_red })
    highlight("GitSignsDeleteNr", { fg = palette.light_red })
    highlight("GitSignsDeleteLn", { fg = palette.light_red })
    highlight("GitSignsCurrentLineBlame", { fg = palette.light_black, bold = true })

    -- __TELESCOPE__
    highlight("TelescopePromptBorder", { fg = palette.blue })
    highlight("TelescopeResultsBorder", { fg = palette.blue })
    highlight("TelescopePreviewBorder", { fg = palette.light_green })
    highlight("TelescopeSelectionCaret", { fg = palette.blue })
    highlight("TelescopeSelection", { fg = palette.blue })
    highlight("TelescopeMatching", { fg = palette.blue })
    highlight("TelescopeMatching", { fg = palette.purple })
    highlight("TelescopeNormal", { link = "NormalFloat" })
    highlight("TelescopeBorder", { link = "FloatBorder" })
    highlight("TelescopePromptBorder", { link = "FloatBorder" })
    highlight("TelescopePreviewBorder", { link = "FloatBorder" })
    highlight("TelescopeResultsBorder", { link = "FloatBorder" })

    -- __WHICHKEY__
    highlight("WhichKey", { fg = palette.white, bold = true })
    highlight("WhichKeyGroup", { fg = palette.white })
    highlight("WhichKeyDesc", { fg = palette.light_cyan, italic = true })
    highlight("WhichKeySeperator", { fg = palette.white })
    highlight("WhichKeyFloating", { bg = palette.black })
    highlight("WhichKeyFloat", { bg = palette.black })

    -- __CMP__
    highlight("CmpPmenu", { link = "NormalFloat" })
    highlight("CmpPmenuBorder", { link = "FloatBorder" })
    highlight("CmpItemKind", { fg = palette.blue })
    highlight("CmpItemAbbrMatch", { fg = palette.white, bold = true })
    highlight("CmpItemAbbrMatchFuzzy", { fg = palette.light_white, bold = true })
    highlight("CmpItemAbbr", { fg = palette.white })
    highlight("CmpItemMenu", { fg = palette.light_purple })

    -- __COPILOT__
    highlight("CopilotLabel", { fg = palette.light_black })
    highlight("CmpItemKindCopilot", { fg = palette.blue })

    -- __INDENT BLANKLINE__
    highlight("IndentBlanklineChar", { fg = palette.light_black })
    highlight("IndentBlanklineContextChar", { fg = palette.light_black })

    -- __NEOTREE__
    highlight("NeoTreeNormal", { fg = palette.white })
    highlight("NeoTreeFileName", { fg = palette.foreground })
    highlight("NeoTreeDotfile", { fg = palette.light_black })
    highlight("NeoTreeCursorLine", { fg = palette.foreground })
    highlight("NeoTreeDirectoryName", { fg = palette.light_cyan })
    highlight("NeoTreeDirectoryIcon", { fg = palette.light_cyan })
    highlight("NeoTreeGitModified", { fg = palette.light_blue })
    highlight("NeoTreeGitUntracked", { fg = palette.light_yellow })
    highlight("NeoTreeGitDeleted", { fg = palette.light_red })
    highlight("NeoTreeGitRenamed", { fg = palette.light_purple })
    highlight("NeoTreeIndentMarker", { fg = palette.light_black })
    highlight("NeoTreeExpander", { fg = palette.light_black })
    highlight("NeoTreeFileIcon", { fg = palette.blue })

    -- __BUFFERLINE__
    highlight("BufferLineFill", { bg = palette.black })
    highlight("BufferLineSeparator", { fg = palette.light_black })
    highlight("BufferLineIndicatorSelected", { fg = palette.blue })
    highlight("BufferLineCloseButton", { fg = palette.white, bg = palette.black })
    highlight("BufferLineCloseButtonVisible", { fg = palette.white, bg = palette.light_black })
    highlight("BufferLineCloseButtonSelected", { fg = palette.red })
    highlight("BufferLineBackground", { fg = palette.white, bg = palette.black })
    highlight("BufferLineBufferVisible", { fg = palette.white, bg = palette.light_black })
    highlight("BufferLineDuplicate", { fg = palette.white, bg = palette.black })
    highlight("BufferLineDuplicateVisible", { fg = palette.white, bg = palette.light_black })
    highlight("BufferLineDuplicateSelected", { fg = palette.white, bg = palette.background })
    highlight("BufferLineTabSeparator", { fg = palette.black, bg = palette.background })
    highlight("BufferLineTabSeparatorSelected", { fg = palette.blue, bg = palette.background })

    -- __LUALINE__
    highlight("LuaLineNormalA", { fg = palette.background, bg = palette.blue, bold = true })
    highlight("LuaLineNormalB", { fg = palette.foreground, bg = palette.black })
    highlight("LuaLineNormalC", { fg = palette.foreground })
    highlight("LuaLineInsertA", { fg = palette.background, bg = palette.green, bold = true })
    highlight("LuaLineVisualA", { fg = palette.background, bg = palette.purple, bold = true })
    highlight("LuaLineReplaceA", { fg = palette.background, bg = palette.yellow, bold = true })
  '';
}
