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
        opts.cterm = opts.cterm or {}

        vim.api.nvim_set_hl(0, group, opts)
    end

    -- __TEXT__
    highlight("Normal", { fg = c.norm, bg = "NONE" })
    highlight("Title", { fg = c.green, bold = true })

    -- __Normal__
    highlight("Cursor", { fg = c.white, reverse = true })
    highlight("SpecialKey", { fg = c.light_red })
    highlight("Structure", { link = "Type" })
    highlight("Define", { link = "PreProc" })
    highlight("Macro", { link = "PreProc" })
    highlight("Typedef", { link = "Type" })
    highlight("PreCondit", { link = "PreProc" })
    highlight("SpecialChar", { fg = c.light_cyan })
    highlight("Tag", { link = "Special" })
    highlight("Debug", { link = "Special" })

    -- __CURSOR__
    highlight("LineNr", { fg = c.light_black })
    highlight("SignColumn", { fg = c.white })
    highlight("CursorLineNr", { fg = c.white })
    highlight("CursorLine", { bg = c.black })
    highlight("CursorColumn", { bg = c.black })
    highlight("highlightColumn", { bg = c.black })
    highlight("FoldColumn", { fg = c.light_cyan })

    -- __SEARCH__
    highlight("Search", { fg = c.blue, bg = c.light_black, reverse = true })
    highlight("CurSearch", { fg = c.blue, bg = c.white, reverse = true })
    highlight("IncSearch", { link = "CurSearch" })
    highlight("Substitute", { link = "Search" })

    -- __VISUAL__
    highlight("Visual", { bg = c.black })
    highlight("VisualNOS", { link = "Visual" })
    highlight("Ignore", { fg = c.bg })

    -- __MESSAGE__
    highlight("Error", { fg = c.red, bold = true })
    highlight("ErrorMsg", { link = "Error" })
    highlight("ModeMsg", { fg = c.white })
    highlight("MoreMsg", { fg = c.white })
    highlight("MsgArea", { fg = c.white })
    highlight("WarningMsg", { fg = c.yellow })
    highlight("NvimInternalError", { fg = c.yellow })
    highlight("healthError", { fg = c.red })
    highlight("healthSuccess", { fg = c.green })
    highlight("healthWarning", { fg = c.purple })

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
    highlight("Function", { fg = c.subtle, bold = true})
    highlight("Identifier", { fg = c.subtle, bold = true })
    highlight("Type", { fg = c.subtle })
    highlight("Variable", { fg = c.light_white })
    highlight("Statement", { fg = c.subtle })
    highlight("Include", { fg = c.light_purple })
    highlight("Special", { fg = c.light_green })
    highlight("Keyword", { fg = c.light_blue, italic = true })
    highlight("Conditional", { fg = c.white })
    highlight("Repeat", { link = "Keyword" })
    highlight("Label", { link = "Keyword" })
    highlight("Exception", { link = "Keyword" })
    highlight("PreProc", { link = "Keyword" })

    -- __CONSTANTS__
    highlight("String", { fg = c.light_green })
    highlight("Constant", { fg = c.light_white })
    highlight("Directory", { fg = c.cyan })
    highlight("Character", { link = "String" })
    highlight("Number", { fg = c.purple })
    highlight("Boolean", { fg = c.light_cyan })
    highlight("Float", { fg = c.purple })

    -- __PUNCTUATION__
    highlight("Quote", { fg = c.light_green })
    highlight("Operator", { fg = c.light_purple })
    highlight("Delimiter", { fg = c.light_white })
    highlight("MatchParen", { fg = c.purple, bold = true })

    -- __NonText__
    highlight("NonText", { fg = c.black })
    highlight("Folded", { link = "NonText" })
    highlight("qfLineNr", { link = "NonText" })

    -- __COMMENT__
    highlight("Todo", { fg = c.yellow, bold = true, italic = true })
    highlight("Question", { fg = c.green })
    highlight("Comment", { fg = c.light_black, italic = true })
    highlight("SpecialComment", { fg = c.cyan })
    highlight("Conceal", { fg = c.black })

    -- __SPELL__
    highlight("SpellBad", { fg = c.red, underline = true })
    highlight("SpellCap", { fg = c.light_green, underline = true })
    highlight("SpellRare", { fg = c.light_red, underline = true })
    highlight("SpellLocal", { fg = c.light_green, underline = true })

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
    highlight("markdownH1", { link = "Statement" })
    highlight("markdownH2", { link = "Statement" })
    highlight("markdownH3", { link = "Statement" })
    highlight("markdownH4", { link = "Statement" })
    highlight("markdownH5", { link = "Statement" })
    highlight("markdownH6", { link = "Statement" })
    highlight("markdownListMarker", { link = "Constant" })
    highlight("markdownCode", { bg = c.black })
    highlight("markdownInlineCode", { fg = c.light_blue, bg = c.light_black })
    highlight("markdownCodeDelimiter", { link = "Constant" })
    highlight("markdownHeadingDelimiter", { link = "Constant" })

    highlight("InfoMsg", { fg = c.blue })
    highlight("HintMsg", { fg = c.purple })
    highlight("Warnings", { fg = c.purple })

    -- Diff
    highlight("DiffAdd", { fg = c.green })
    highlight("DiffChange", { fg = c.yellow })
    highlight("DiffDelete", { fg = c.red })
    highlight("DiffText", { fg = c.purple })
    highlight("diffAdded", { fg = c.green })
    highlight("diffRemoved", { fg = c.red })
    highlight("diffChanged", { fg = c.yellow })

    -- Terminal
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
    highlight("@type.builtin", { link = "@type" })
    highlight("@type.definition", { link = "Type" })
    highlight("@property", { link = "Identifier" })
    highlight("@label", { link = "Label" })
    highlight("@annotation", { link = "Cursor" })
    highlight("@attribute", { link = "Constant" })
    highlight("@boolean", { link = "Boolean" })
    highlight("@character", { link = "Character" })
    highlight("@comment", { link = "Comment" })
    highlight("@comment.error", { link = "Error" })
    highlight("@comment.warning", { link = "Warning" })
    highlight("@comment.todo", { link = "Todo" })
    highlight("@comment.highlight", { link = "Special" })
    highlight("@comment.info", { link = "InfoMsg" })
    highlight("@comment.note", { link = "Statement" })
    highlight("@comment.documentation", { link = "Comment" })
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
    highlight("@keyword.conditional", { link = "Conditional" })
    highlight("@keyword.import", { link = "Keyword" })
    highlight("@keyword.repeat", { link = "Normal" })
    highlight("@markup", { link = "Normal" })
    highlight("@markup.emphasis", { link = "italic" })
    highlight("@markup.heading", { link = "light_green" })
    highlight("@markup.link.url", { link = "Constant" })
    highlight("@markup.link.label", { link = "Constant" })
    highlight("@markup.list", { link = "Keyword" })
    highlight("@markup.quote", { link = "Comment" })
    highlight("@markup.raw", { link = "Keyword" })
    highlight("@markup.strikethrough", { strikethrough = true })
    highlight("@markup.strong", { bold = true })
    highlight("@markup.underline", { underline = true })
    highlight("@module", { link = "Keyword" })
    highlight("@none", { link = "Keyword" })
    highlight("@number", { link = "Number" })
    highlight("@number.float", { link = "Float" })
    highlight("@operator", { link = "Operator" })
    highlight("@property", { link = "@field" })
    highlight("@punctuation.bracket", { link = "Keyword" })
    highlight("@punctuation.delimiter", { link = "Keyword" })
    highlight("@string", { link = "String" })
    highlight("@string.escape", { fg = c.yellow })
    highlight("@string.regexp", { link = "SpecialChar" })
    highlight("@string.special.symbol", { link = "Identifier" })
    highlight("@string.special.url", { link = "Constant" })
    highlight("@tag", { link = "Tag" })
    highlight("@tag.delimiter", { link = "Delimiter" })
    highlight("@tag.attribute", { link = "@attribute" })
    highlight("@variable", { link = "Normal" })
    highlight("@variable.builtin", { fg = c.fg, bold = true })
    highlight("@variable.member", { link = "Normal" })
    highlight("@variable.parameter", { fg = c.subtle, italic = true })
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
    -- Assuming the `c.highlight` function is defined elsewhere, and 'c.light_purple', 'c.light_red', etc., are defined variables
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
    highlight("GitGutterAdd", { fg = c.light_green })
    highlight("GitGutterAddNr", { fg = c.light_green })
    highlight("GitGutterAddLn", { fg = c.light_green })
    highlight("GitGutterChange", { fg = c.light_purple })
    highlight("GitGutterChangeNr", { fg = c.light_purple })
    highlight("GitGutterChangeLn", { fg = c.light_purple })
    highlight("GitGutterDelete", { fg = c.light_red })
    highlight("GitGutterDeleteNr", { fg = c.light_red })
    highlight("GitGutterDeleteLn", { fg = c.light_red })
    highlight("GitGutterCurrentLineBlame", { fg = c.light_black, bold = true })

    -- __TELESCOPE__
    highlight("TelescopePromptBorder", { fg = c.blue })
    highlight("TelescopeResultsBorder", { fg = c.blue })
    highlight("TelescopePreviewBorder", { fg = c.light_green })
    highlight("TelescopeSelectionCaret", { fg = c.blue })
    highlight("TelescopeSelection", { fg = c.blue })
    highlight("TelescopeMatching", { fg = c.blue })
    highlight("TelescopeMatching", { fg = c.purple })
    highlight("TelescopeNormal", { link = "NormalFloat" })
    highlight("TelescopeBorder", { link = "FloatBorder" })
    highlight("TelescopePromptBorder", { link = "FloatBorder" })
    highlight("TelescopePreviewBorder", { link = "FloatBorder" })
    highlight("TelescopeResultsBorder", { link = "FloatBorder" })

    -- __WHICHKEY__
    highlight("WhichKey", { fg = c.white, bold = true })
    highlight("WhichKeyDesc", { link = "Normal" })
    highlight("WhichKeyGroup", { fg = c.blue })
    highlight("WhichKeySeperator", { fg = c.light_black })
    highlight("WhichKeyFloating", { bg = c.black })
    highlight("WhichKeyFloat", { bg = c.black })

    -- __CMP__
    highlight("CmpPmenu", { link = "NormalFloat" })
    highlight("CmpPmenuBorder", { link = "FloatBorder" })
    highlight("CmpItemKind", { fg = c.blue })
    highlight("CmpItemAbbrMatch", { fg = c.white, bold = true })
    highlight("CmpItemAbbrMatchFuzzy", { fg = c.light_white, bold = true })
    highlight("CmpItemAbbr", { fg = c.white })
    highlight("CmpItemMenu", { fg = c.light_purple })

    -- __COPILOT__
    highlight("CopilotLabel", { fg = c.light_black })
    highlight("CmpItemKindCopilot", { fg = c.blue })

    -- __INDENT BLANKLINE__
    highlight("IndentBlanklineChar", { fg = c.light_black })
    highlight("IndentBlanklineContextChar", { fg = c.light_black })

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
    highlight("BufferLineFill", { fg = c.black })
    highlight("BufferLineSeparator", { fg = c.black })
    highlight("BufferLineIndicatorVisible", { fg = c.light_black, bg = c.black })
    highlight("BufferLineIndicatorSelected", { fg = c.blue })
    highlight("BufferLineCloseButton", { bg = c.white, fg = c.black })
    highlight("BufferLineCloseButtonVisible", { bg = c.white, fg = c.black })
    highlight("BufferLineCloseButtonSelected", { bg = c.red, fg = c.light_black })
    highlight("BufferLineBackground", { fg = c.black, bg = c.fg })
    highlight("BufferLineBufferVisible", { bg = c.subtle, fg = c.black })
    highlight("BufferLineDuplicate", { fg = c.white, bg = c.black })
    highlight("BufferLineDuplicateVisible", { fg = c.white, bg = c.light_black })
    highlight("BufferLineBufferSelected", { fg = c.light_black, bg = c.fg })
    highlight("BufferLineDuplicateSelected", { fg = c.white, bg = c.bg })
    highlight("BufferLineTabSeparator", { fg = c.black, bg = c.bg })
    highlight("BufferLineTabSeparatorSelected", { fg = c.blue, bg = c.bg })
    highlight("BufferLineDevIconDefaultInactive", { bg = "NONE", ctermfg = "NONE" })
    highlight("BufferLineModifiedSelected", { fg = c.light_black, bg = c.green })
    highlight("BufferLineModifiedVisible", { fg = c.black, bg = c.green })
    highlight("BufferLineIcon", { fg = c.blue, bg = c.black })

    -- __LUALINE__
    highlight("LuaLineNormalA", { fg = c.bg, bg = c.blue, bold = true })
    highlight("LuaLineNormalB", { fg = c.fg, bg = c.light_black })
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
  '';
}
