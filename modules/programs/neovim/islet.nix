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

    local c = {
      bg = "${base00}",
      fg = "${base01}",
      norm = "#E9ECEF",
      subtle = "#ADB5BD",
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

    local function highlight(group, opts)
        opts.force = true

        vim.api.nvim_set_hl(0, group, opts)
    end

    -- __TEXT__
    highlight("Normal", { fg = c.norm, bg = "NONE" })
    highlight("Title", { fg = c.blue, bold = true })

    -- __Normal__
    highlight("Cursor", { fg = c.bg, bg = c.norm, reverse = false })
    highlight("SpecialKey", { fg = c.light_red })
    highlight("Structure", { fg = c.blue, bold = true })
    highlight("Define", { fg = c.purple, bold = true })
    highlight("Macro", { fg = c.purple, bold = true })
    highlight("Typedef", { fg = c.blue, bold = true })
    highlight("PreCondit", { fg = c.purple, bold = true })
    highlight("SpecialChar", { fg = c.cyan })
    highlight("Tag", { fg = c.blue })
    highlight("Debug", { fg = c.yellow, italic = true })

    -- __CURSOR__
    highlight("LineNr", { fg = c.light_black })
    highlight("SignColumn", { fg = c.subtle })
    highlight("CursorLineNr", { fg = c.white, bold = true })
    highlight("CursorLine", { bg = c.black })
    highlight("CursorColumn", { bg = c.black })
    highlight("highlightColumn", { bg = c.black })
    highlight("FoldColumn", { fg = c.subtle })
    highlight("YankHighlight", { fg = c.white, bg = c.light_black })

    -- __SEARCH__
    highlight("Search", { fg = c.bg, bg = c.yellow, bold = true })
    highlight("CurSearch", { fg = c.bg, bg = c.blue, bold = true })
    highlight("IncSearch", { fg = c.bg, bg = c.blue, bold = true })
    highlight("Substitute", { fg = c.bg, bg = c.purple, bold = true })

    -- __VISUAL__
    highlight("Visual", { bg = c.light_black, fg = "NONE" })
    highlight("VisualNOS", { bg = c.light_black, fg = "NONE" })
    highlight("Ignore", { fg = c.light_black })

    -- __MESSAGE__
    highlight("Error", { fg = c.red, bold = true })
    highlight("ErrorMsg", { link = "Error" })
    highlight("ModeMsg", { fg = c.subtle })
    highlight("MoreMsg", { fg = c.green })
    highlight("MsgArea", { fg = c.norm })
    highlight("WarningMsg", { fg = c.yellow, bold = true })
    highlight("NvimInternalError", { fg = c.red, bold = true })
    highlight("healthError", { fg = c.red })
    highlight("healthSuccess", { fg = c.green })
    highlight("healthWarning", { fg = c.yellow })

    -- __StatusLine__
    highlight("StatusLine", { fg = c.white, bg = c.black })
    highlight("StatusLineNC", { fg = c.light_white, bg = c.light_black })
    highlight("StatusLineTerm", { link = "StatusLine" })
    highlight("StatusLineTermNC", { link = "StatusLineNC" })

    -- __TABLINE__
    highlight("Tabline", { fg = c.white, bg = c.black })
    highlight("TablineSel", { fg = c.black, bg = c.blue })
    highlight("TabLineFill", { reverse = true })

    -- __FLOAT__
    highlight("NormalFloat", { fg = c.fg, bg = c.black })
    highlight("FloatBorder", { fg = c.light_black, bg = c.black })
    highlight("FloatTitle", { fg = c.fg })

    -- __MENU__
    highlight("Pmenu", { link = "NormalFloat" })
    highlight("PmenuSel", { fg = c.black, bg = c.blue })
    highlight("PmenuSbar", { fg = c.white, bg = c.black })
    highlight("PmenuThumb", { bg = c.white })

    -- __OTHER UI__
    highlight("WinSeparator", { fg = c.light_black })
    highlight("EndOfBuffer", { fg = c.black })
    highlight("QuickFixLine", { fg = c.green })

    -- __SYNTAX__
    highlight("Function", { fg = c.subtle, bold = true })
    highlight("Identifier", { fg = c.norm })
    highlight("Type", { fg = c.light_blue, bold = true })
    highlight("Variable", { fg = c.norm })
    highlight("Statement", { fg = c.red, bold = true })
    highlight("Include", { fg = c.fg })
    highlight("Special", { fg = c.cyan })
    highlight("Keyword", { fg = c.blue, bold = true })
    highlight("Conditional", { fg = c.light_blue, bold = true })
    highlight("Repeat", { fg = c.yellow, bold = true })
    highlight("Label", { fg = c.red, bold = true })
    highlight("Exception", { fg = c.light_red, bold = true })
    highlight("PreProc", { fg = c.purple, bold = true })

    -- __CONSTANTS__
    highlight("String", { fg = c.green })
    highlight("Constant", { fg = c.fg, bold = true })
    highlight("Directory", { fg = c.light_blue, bold = true })
    highlight("Character", { fg = c.green })
    highlight("Number", { fg = c.cyan })
    highlight("Boolean", { fg = c.red, bold = true })
    highlight("Float", { fg = c.cyan })

    -- __PUNCTUATION__
    highlight("Quote", { fg = c.green })
    highlight("Operator", { fg = c.red })
    highlight("Delimiter", { fg = c.subtle })
    highlight("MatchParen", { fg = c.blue, bg = c.light_black, bold = true })

    -- __NonText__
    highlight("NonText", { fg = c.light_black })
    highlight("Folded", { fg = c.subtle, bg = c.light_black, italic = true })
    highlight("qfLineNr", { link = "NonText" })

    -- __COMMENT__
    highlight("Todo", { fg = c.yellow, bg = c.light_black, bold = true })
    highlight("Question", { fg = c.green })
    highlight("Comment", { fg = c.light_black, italic = true })
    highlight("SpecialComment", { fg = c.subtle, bold = true, italic = true })
    highlight("Conceal", { fg = c.light_black })

    -- __SPELL__
    highlight("SpellBad", { fg = c.red, underline = true, sp = c.red })
    highlight("SpellCap", { fg = c.yellow, underline = true, sp = c.yellow })
    highlight("SpellRare", { fg = c.purple, underline = true, sp = c.purple })
    highlight("SpellLocal", { fg = c.blue, underline = true, sp = c.blue })

    -- __WILD MENU__
    highlight("WildMenu", { fg = c.light_black, bold = true, underline = true })

    -- __HTML__
    highlight("htmlH1", { link = "Normal" })
    highlight("htmlH2", { link = "Normal" })
    highlight("htmlH3", { link = "Normal" })
    highlight("htmlH4", { link = "Normal" })
    highlight("htmlH5", { link = "Normal" })
    highlight("htmlH6", { link = "Normal" })

    -- __MARKDOWN__
    highlight("markdownH1", { fg = c.blue, bold = true })
    highlight("markdownH2", { fg = c.blue, bold = true })
    highlight("markdownH3", { fg = c.blue, bold = true })
    highlight("markdownH4", { fg = c.blue, bold = true })
    highlight("markdownH5", { fg = c.blue, bold = true })
    highlight("markdownH6", { fg = c.blue, bold = true })
    highlight("markdownListMarker", { fg = c.red, bold = true })
    highlight("markdownCode", { fg = c.purple, bg = c.light_black })
    highlight("markdownInlineCode", { fg = c.purple, bg = c.light_black })
    highlight("markdownCodeDelimiter", { fg = c.subtle })
    highlight("markdownHeadingDelimiter", { fg = c.blue, bold = true })
    highlight("markdownBold", { fg = c.white, bold = true })
    highlight("markdownItalic", { fg = c.white, italic = true })
    highlight("markdownUrl", { fg = c.blue, underline = true })
    highlight("markdownLink", { fg = c.blue })
    highlight("markdownLinkText", { fg = c.green })

    highlight("InfoMsg", { fg = c.blue })
    highlight("HintMsg", { fg = c.purple })
    highlight("Warnings", { fg = c.purple })

    -- Diff
    highlight("DiffAdd", { fg = c.green, bg = c.light_black })
    highlight("DiffChange", { fg = c.yellow, bg = c.light_black })
    highlight("DiffDelete", { fg = c.red, bg = c.light_black })
    highlight("DiffText", { fg = c.blue, bg = c.light_black, bold = true })
    highlight("diffAdded", { fg = c.green })
    highlight("diffRemoved", { fg = c.red })
    highlight("diffChanged", { fg = c.yellow })

    -- __Terminal__
    vim.g.terminal_color_0 = c.black
    vim.g.terminal_color_1 = c.red
    vim.g.terminal_color_2 = c.green
    vim.g.terminal_color_3 = c.yellow
    vim.g.terminal_color_4 = c.blue
    vim.g.terminal_color_5 = c.purple
    vim.g.terminal_color_6 = c.cyan
    vim.g.terminal_color_7 = c.white
    vim.g.terminal_color_8 = c.light_black
    vim.g.terminal_color_9 = c.light_red
    vim.g.terminal_color_10 = c.light_green
    vim.g.terminal_color_11 = c.light_yellow
    vim.g.terminal_color_12 = c.light_blue
    vim.g.terminal_color_13 = c.light_purple
    vim.g.terminal_color_14 = c.light_cyan
    vim.g.terminal_color_15 = c.light_white

    -- __TREE SITTER__
    highlight("@keyword", { link = "Keyword" })
    highlight("@keyword.function", { link = "Keyword" })
    highlight("@keyword.return", { link = "Keyword" })
    highlight("@keyword.operator", { link = "Operator" })
    highlight("@keyword.builtin", { link = "Keyword" })
    highlight("@keyword.macro", { link = "PreProc" })
    highlight("@keyword.method", { link = "Function" })
    highlight("@type", { link = "Type" })
    highlight("@type.builtin", { link = "Type" })
    highlight("@type.definition", { link = "Type" })
    highlight("@property", { link = "Identifier" })
    highlight("@label", { link = "Label" })
    highlight("@annotation", { fg = c.purple })
    highlight("@attribute", { fg = c.purple })
    highlight("@boolean", { link = "Boolean" })
    highlight("@character", { link = "Character" })
    highlight("@comment", { link = "Comment" })
    highlight("@comment.error", { fg = c.red, bold = true })
    highlight("@comment.warning", { fg = c.yellow, bold = true })
    highlight("@comment.todo", { link = "Todo" })
    highlight("@comment.highlight", { fg = c.blue, bold = true })
    highlight("@comment.info", { fg = c.blue })
    highlight("@comment.note", { fg = c.purple })
    highlight("@comment.documentation", { fg = c.subtle, italic = true })
    highlight("@constant", { link = "Constant" })
    highlight("@constant.builtin", { link = "Constant" })
    highlight("@constant.macro", { link = "PreProc" })
    highlight("@constructor", { link = "Function" })
    highlight("@diff.delta", { link = "DiffChange" })
    highlight("@diff.minus", { link = "DiffDelete" })
    highlight("@diff.plus", { link = "DiffAdd" })
    highlight("@error", { link = "Error" })
    highlight("@exception", { link = "Exception" })
    highlight("@function", { link = "Function" })
    highlight("@function.builtin", { link = "Function" })
    highlight("@function.macro", { link = "PreProc" })
    highlight("@function.method", { link = "Function" })
    highlight("@keyword.conditional", { link = "Conditional" })
    highlight("@keyword.import", { link = "Include" })
    highlight("@keyword.repeat", { link = "Repeat" })
    highlight("@markup", { fg = c.norm })
    highlight("@markup.emphasis", { fg = c.white, italic = true })
    highlight("@markup.heading", { fg = c.blue, bold = true })
    highlight("@markup.link.url", { fg = c.blue, underline = true })
    highlight("@markup.link.label", { fg = c.green })
    highlight("@markup.list", { fg = c.red, bold = true })
    highlight("@markup.quote", { fg = c.subtle, italic = true })
    highlight("@markup.raw", { fg = c.purple, bg = c.light_black })
    highlight("@markup.strikethrough", { fg = c.subtle, strikethrough = true })
    highlight("@markup.strong", { fg = c.white, bold = true })
    highlight("@markup.underline", { fg = c.white, underline = true })
    highlight("@module", { link = "Include" })
    highlight("@none", { fg = c.norm })
    highlight("@number", { link = "Number" })
    highlight("@number.float", { link = "Float" })
    highlight("@operator", { link = "Operator" })
    highlight("@property", { link = "Identifier" })
    highlight("@punctuation.bracket", { fg = c.subtle })
    highlight("@punctuation.delimiter", { link = "Delimiter" })
    highlight("@string", { link = "String" })
    highlight("@string.escape", { fg = c.cyan, bold = true })
    highlight("@string.regexp", { fg = c.cyan })
    highlight("@string.special.symbol", { fg = c.blue, bold = true })
    highlight("@string.special.url", { fg = c.blue, underline = true })
    highlight("@tag", { fg = c.blue, bold = true })
    highlight("@tag.delimiter", { link = "Delimiter" })
    highlight("@tag.attribute", { fg = c.purple })
    highlight("@variable", { fg = c.norm })
    highlight("@variable.builtin", { fg = c.red, bold = true })
    highlight("@variable.member", { link = "Identifier" })
    highlight("@variable.parameter", { fg = c.norm, italic = true })
    highlight("@variable.parameter.reference", { fg = c.norm, bold = true })

    -- __DIAGNOSTICS__
    highlight("DiagnosticError", { fg = c.red, bold = true })
    highlight("DiagnosticSignError", { fg = c.red, bold = true })
    highlight("DiagnosticFloatingError", { fg = c.red })
    highlight("DiagnosticVirtualTextError", { fg = c.red, bg = "NONE" })
    highlight("DiagnosticUnderlineError", { underline = true, sp = c.red })

    highlight("DiagnosticWarn", { fg = c.yellow, bold = true })
    highlight("DiagnosticSignWarn", { fg = c.yellow, bold = true })
    highlight("DiagnosticFloatingWarn", { fg = c.yellow })
    highlight("DiagnosticVirtualTextWarn", { fg = c.yellow, bg = "NONE" })
    highlight("DiagnosticUnderlineWarn", { underline = true, sp = c.yellow })

    highlight("DiagnosticInfo", { fg = c.blue })
    highlight("DiagnosticSignInfo", { fg = c.blue })
    highlight("DiagnosticFloatingInfo", { fg = c.blue })
    highlight("DiagnosticVirtualTextInfo", { fg = c.blue, bg = "NONE" })
    highlight("DiagnosticUnderlineInfo", { underline = true, sp = c.blue })

    highlight("DiagnosticHint", { fg = c.subtle })
    highlight("DiagnosticSignHint", { fg = c.subtle })
    highlight("DiagnosticFloatingHint", { fg = c.subtle })
    highlight("DiagnosticVirtualTextHint", { fg = c.subtle, bg = "NONE" })
    highlight("DiagnosticUnderlineHint", { underline = true, sp = c.subtle })

    -- __LSP__
    highlight("LspTroubleNormal", { fg = c.light_purple })
    highlight("LspTroubleText", { fg = c.light_red })
    highlight("LspTroubleCount", { fg = c.red })

    highlight("LspReferenceText", { bold = true, underline = true })
    highlight("LspReferenceRead", { bold = true, underline = true })
    highlight("LspReferenceWrite", { bold = true, underline = true })

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
    highlight("GitGutterAdd", { fg = c.green, bold = true })
    highlight("GitGutterAddNr", { fg = c.green })
    highlight("GitGutterAddLn", { bg = c.light_black })
    highlight("GitGutterChange", { fg = c.yellow, bold = true })
    highlight("GitGutterChangeNr", { fg = c.yellow })
    highlight("GitGutterChangeLn", { bg = c.light_black })
    highlight("GitGutterDelete", { fg = c.red, bold = true })
    highlight("GitGutterDeleteNr", { fg = c.red })
    highlight("GitGutterDeleteLn", { bg = c.light_black })
    highlight("GitGutterCurrentLineBlame", { fg = c.light_black, italic = true })

    -- __TELESCOPE__
    highlight("TelescopePromptBorder", { fg = c.blue })
    highlight("TelescopeResultsBorder", { fg = c.subtle })
    highlight("TelescopePreviewBorder", { fg = c.green })
    highlight("TelescopeSelectionCaret", { fg = c.blue, bold = true })
    highlight("TelescopeSelection", { fg = c.white, bg = c.light_black })
    highlight("TelescopeMatching", { fg = c.yellow, bold = true })
    highlight("TelescopeNormal", { fg = c.norm, bg = c.black })
    highlight("TelescopeBorder", { fg = c.subtle, bg = c.black })
    highlight("TelescopePromptPrefix", { fg = c.blue, bold = true })
    highlight("TelescopePromptTitle", { fg = c.blue, bold = true })
    highlight("TelescopeResultsTitle", { fg = c.subtle })
    highlight("TelescopePreviewTitle", { fg = c.green, bold = true })

    -- __WHICHKEY__
    highlight("WhichKey", { fg = c.white, bold = true })
    highlight("WhichKeyDesc", { link = "Normal" })
    highlight("WhichKeyGroup", { fg = c.blue })
    highlight("WhichKeySeperator", { fg = c.light_black })
    highlight("WhichKeyFloating", { bg = c.black })
    highlight("WhichKeyFloat", { bg = c.black })

    -- __CMP__
    highlight("CmpPmenu", { fg = c.norm, bg = c.black })
    highlight("CmpPmenuBorder", { fg = c.subtle, bg = c.black })
    highlight("CmpItemKind", { fg = c.blue, bold = true })
    highlight("CmpItemAbbrMatch", { fg = c.yellow, bold = true })
    highlight("CmpItemAbbrMatchFuzzy", { fg = c.yellow })
    highlight("CmpItemAbbr", { fg = c.norm })
    highlight("CmpItemMenu", { fg = c.subtle, italic = true })
    highlight("CmpItemKindFunction", { fg = c.purple, bold = true })
    highlight("CmpItemKindMethod", { fg = c.purple, bold = true })
    highlight("CmpItemKindKeyword", { fg = c.red, bold = true })
    highlight("CmpItemKindVariable", { fg = c.norm })
    highlight("CmpItemKindConstant", { fg = c.blue, bold = true })
    highlight("CmpItemKindText", { fg = c.green })
    highlight("CmpItemKindClass", { fg = c.blue, bold = true })
    highlight("CmpItemKindInterface", { fg = c.blue, bold = true })

    -- __COPILOT__
    highlight("CopilotLabel", { fg = c.light_black, italic = true })
    highlight("CmpItemKindCopilot", { fg = c.cyan, bold = true })

    -- __INDENT BLANKLINE__
    highlight("IndentBlanklineChar", { fg = c.light_black })
    highlight("IndentBlanklineContextChar", { fg = c.subtle, bold = true })
    highlight("IndentBlanklineContextStart", { underline = true, sp = c.subtle })

    -- __NEOTREE__
    highlight("NeoTreeNormal", { fg = c.white })
    highlight("NeoTreeFileName", { fg = c.fg })
    highlight("NeoTreeDotfile", { fg = c.light_black })
    highlight("NeoTreeCursorLine", { fg = c.fg })
    highlight("NeoTreeDirectoryName", { fg = c.subtle })
    highlight("NeoTreeDirectoryIcon", { fg = c.blue })
    highlight("NeoTreeGitModified", { fg = c.light_blue })
    highlight("NeoTreeGitUntracked", { fg = c.light_yellow })
    highlight("NeoTreeGitDeleted", { fg = c.light_red })
    highlight("NeoTreeGitRenamed", { fg = c.light_purple })
    highlight("NeoTreeIndentMarker", { fg = c.light_black })
    highlight("NeoTreeExpander", { fg = c.light_black })
    highlight("NeoTreeFileIcon", { fg = c.blue })

    -- __BUFFERLINE__
    highlight("BufferLineFill", { fg = c.bg })
    highlight("BufferLineSeparator", { fg = c.bg })
    highlight("BufferLineIndicatorVisible", { fg = c.bg, bg = c.light_black })
    highlight("BufferLineIndicatorSelected", { fg = c.blue })
    highlight("BufferLineCloseButton", { bg = c.white, fg = c.black })
    highlight("BufferLineCloseButtonVisible", { bg = c.white, fg = c.light_black })
    highlight("BufferLineCloseButtonSelected", { bg = c.red, fg = c.bg })
    highlight("BufferLineBackground", { fg = c.black, bg = c.fg })
    highlight("BufferLineBufferVisible", { bg = c.subtle, fg = c.light_black })
    highlight("BufferLineDuplicate", { fg = c.white, bg = c.black })
    highlight("BufferLineDuplicateVisible", { fg = c.white, bg = c.light_black })
    highlight("BufferLineBufferSelected", { fg = c.bg, bg = c.fg })
    highlight("BufferLineDuplicateSelected", { fg = c.white, bg = c.bg })
    highlight("BufferLineTabSeparator", { fg = c.black, bg = c.bg })
    highlight("BufferLineTabSeparatorSelected", { fg = c.blue, bg = c.bg })
    highlight("BufferLineModifiedSelected", { fg = c.light_black, bg = c.green })
    highlight("BufferLineModifiedVisible", { fg = c.black, bg = c.green })

    -- __LUALINE__
    highlight("LuaLineNormalA", { fg = c.bg, bg = c.blue, bold = true })
    highlight("LuaLineNormalB", { fg = c.fg, bg = c.black })
    highlight("LuaLineNormalC", { fg = c.fg })
    highlight("LuaLineInsertA", { fg = c.bg, bg = c.green, bold = true })
    highlight("LuaLineVisualA", { fg = c.bg, bg = c.purple, bold = true })
    highlight("LuaLineReplaceA", { fg = c.bg, bg = c.yellow, bold = true })

    -- __NvimTree__
    highlight("NvimTreeCursorLine", { link = "CursorLine" })
    highlight("NvimTreeEmptyFolderName", { fg = c.light_black, bg = "NONE" })
    highlight("NvimTreeEndOfBuffer", { link = "EndOfBuffer" })
    highlight("NvimTreeFolderIcon", { link = "Directory" })
    highlight("NvimTreeFolderName", { fg = c.fg, bg = "NONE" })
    highlight("NvimTreeNormal", { link = "Normal" })
    highlight("NvimTreeOpenedFolderName", { link = "NvimTreeFolderName" })
    highlight("NvimTreeRootFolder", { fg = c.fg, bg = "NONE", bold = true })
    highlight("NvimTreeSpecialFile", { fg = c.cyan, bg = "NONE", underline = true })
    highlight("NvimTreeStatusLine", { bg = "NONE" })

    -- __BLINK_PAIRS__
    highlight("BlinkPairsYellow", { fg = c.yellow })
    highlight("BlinkPairsPurple", { fg = c.purple })
    highlight("BlinkPairsCyan", { fg = c.cyan })
  '';
}
