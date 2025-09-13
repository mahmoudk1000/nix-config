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
    highlight("Title", { fg = c.green, bold = true })

    -- __Normal__
    highlight("Cursor", { fg = c.bg, bg = c.norm, reverse = false })
    highlight("SpecialKey", { fg = c.light_black })
    highlight("Structure", { fg = c.cyan, bold = true })
    highlight("Define", { fg = c.cyan, bold = true })
    highlight("Macro", { fg = c.cyan, bold = true })
    highlight("Typedef", { fg = c.yellow, bold = true })
    highlight("PreCondit", { fg = c.cyan, bold = true })
    highlight("SpecialChar", { fg = c.red })
    highlight("Tag", { fg = c.blue })
    highlight("Debug", { fg = c.red, italic = true })

    -- __CURSOR__
    highlight("LineNr", { fg = c.light_black })
    highlight("SignColumn", { fg = c.light_black })
    highlight("CursorLineNr", { fg = c.yellow, bold = true })
    highlight("CursorLine", { bg = c.black })
    highlight("CursorColumn", { bg = c.black })
    highlight("highlightColumn", { bg = c.black })
    highlight("FoldColumn", { fg = c.light_black })
    highlight("YankHighlight", { fg = c.white, bg = c.light_black })

    -- __SEARCH__
    highlight("Search", { fg = c.bg, bg = c.green, bold = true })
    highlight("CurSearch", { fg = c.bg, bg = c.light_cyan, bold = true })
    highlight("IncSearch", { fg = c.bg, bg = c.light_cyan, bold = true })
    highlight("Substitute", { fg = c.bg, bg = c.purple, bold = true })

    -- __VISUAL__
    highlight("Visual", { fg = c.bg, bg = c.blue })
    highlight("VisualNOS", { fg = c.bg, bg = c.blue })
    highlight("Ignore", { fg = c.light_black })

    -- __MESSAGE__
    highlight("Error", { fg = c.red, bg = c.bg, bold = true, reverse = true })
    highlight("ErrorMsg", { fg = c.bg, bg = c.red, bold = true })
    highlight("ModeMsg", { fg = c.yellow, bold = true })
    highlight("MoreMsg", { fg = c.yellow, bold = true })
    highlight("MsgArea", { fg = c.norm })
    highlight("WarningMsg", { fg = c.red, bold = true })
    highlight("NvimInternalError", { fg = c.red, bold = true })
    highlight("healthError", { fg = c.red })
    highlight("healthSuccess", { fg = c.green })
    highlight("healthWarning", { fg = c.yellow })

    -- __StatusLine__
    highlight("StatusLine", { fg = c.norm, bg = c.bg })
    highlight("StatusLineNC", { fg = c.subtle, bg = c.black })
    highlight("StatusLineTerm", { link = "StatusLine" })
    highlight("StatusLineTermNC", { link = "StatusLineNC" })

    -- __TABLINE__
    highlight("Tabline", { fg = c.subtle, bg = c.black })
    highlight("TablineSel", { fg = c.norm, bg = c.bg, bold = true })
    highlight("TabLineFill", { fg = c.norm, bg = c.black })

    -- __FLOAT__
    highlight("NormalFloat", { fg = c.fg, bg = c.bg })
    highlight("FloatBorder", { fg = c.light_black, bg = c.bg })
    highlight("FloatTitle", { fg = c.fg })

    -- __MENU__
    highlight("Pmenu", { fg = c.norm, bg = c.bg })
    highlight("PmenuSel", { fg = c.bg, bg = c.blue, bold = true })
    highlight("PmenuSbar", { bg = c.bg })
    highlight("PmenuThumb", { bg = c.light_black })
    highlight("PmenuKind", { fg = c.red, bg = c.bg })
    highlight("PmenuKindSel", { fg = c.red, bg = c.blue })
    highlight("PmenuExtra", { fg = c.subtle, bg = c.bg })
    highlight("PmenuExtraSel", { fg = c.bg, bg = c.blue })
    highlight("PmenuMatch", { fg = c.purple, bg = c.bg })
    highlight("PmenuMatchSel", { fg = c.purple, bg = c.blue, bold = true })

    -- __OTHER UI__
    highlight("WinSeparator", { fg = c.black })
    highlight("EndOfBuffer", { fg = c.light_black })
    highlight("QuickFixLine", { fg = c.cyan, bg = c.bg, reverse = true })
    highlight("ColorColumn", { bg = c.bg })
    highlight("WildMenu", { fg = c.blue, bg = c.light_black, bold = true })
    highlight("ToolbarButton", { fg = c.norm, bg = c.black, bold = true })
    highlight("ToolbarLine", { bg = "NONE" })

    -- __SYNTAX__
    highlight("Function", { fg = c.green, bold = true })
    highlight("Identifier", { fg = c.norm })
    highlight("Type", { fg = c.yellow, bold = true })
    highlight("Variable", { fg = c.fg })
    highlight("Statement", { fg = c.red })
    highlight("Include", { fg = c.cyan, bold = true })
    highlight("Special", { fg = c.light_cyan })
    highlight("Keyword", { fg = c.blue, bold = true })
    highlight("Conditional", { fg = c.red })
    highlight("Repeat", { fg = c.red })
    highlight("Label", { fg = c.red, italic = true })
    highlight("Exception", { fg = c.red, bold = true })
    highlight("PreProc", { fg = c.cyan })
    highlight("StorageClass", { fg = c.subtle, bold = true })

    -- __CONSTANTS__
    highlight("String", { fg = c.green })
    highlight("Constant", { fg = c.purple, bold = true })
    highlight("Directory", { fg = c.green, bold = true })
    highlight("Character", { fg = c.purple })
    highlight("Number", { fg = c.purple })
    highlight("Boolean", { fg = c.purple, bold = true })
    highlight("Float", { fg = c.purple })

    -- __PUNCTUATION__
    highlight("Quote", { fg = c.green })
    highlight("Operator", { fg = c.subtle })
    highlight("Delimiter", { fg = c.fg })
    highlight("MatchParen", { bg = c.light_black, bold = true, underline = true })

    -- __NonText__
    highlight("NonText", { fg = c.light_black })
    highlight("Folded", { fg = c.light_black, bg = c.bg })
    highlight("qfLineNr", { link = "NonText" })

    -- __COMMENT__
    highlight("Todo", { fg = c.norm, bg = c.bg, bold = true })
    highlight("Question", { fg = c.light_cyan, bold = true })
    highlight("Comment", { fg = c.light_black, italic = true })
    highlight("SpecialComment", { fg = c.red })
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
    highlight("DiffAdd", { fg = c.green, bg = c.bg, reverse = true })
    highlight("DiffChange", { fg = c.cyan, bg = c.bg, reverse = true })
    highlight("DiffDelete", { fg = c.red, bg = c.bg, reverse = true })
    highlight("DiffText", { fg = c.yellow, bg = c.bg, reverse = true })
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
    highlight("@keyword", { fg = c.blue, bold = true })
    highlight("@keyword.function", { fg = c.blue, bold = true })
    highlight("@keyword.return", { fg = c.blue, bold = true })
    highlight("@keyword.operator", { fg = c.subtle })
    highlight("@keyword.builtin", { fg = c.blue, bold = true })
    highlight("@keyword.macro", { link = "PreProc" })
    highlight("@keyword.method", { fg = c.green, bold = true })
    highlight("@type", { link = "Type" })
    highlight("@type.builtin", { fg = c.yellow, bold = true })
    highlight("@type.definition", { fg = c.yellow, bold = true })
    highlight("@property", { fg = c.subtle })
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
    highlight("@constant.builtin", { fg = c.purple, bold = true })
    highlight("@constant.macro", { link = "PreProc" })
    highlight("@constructor", { fg = c.green, bold = true })
    highlight("@diff.delta", { link = "DiffChange" })
    highlight("@diff.minus", { link = "DiffDelete" })
    highlight("@diff.plus", { link = "DiffAdd" })
    highlight("@error", { link = "Error" })
    highlight("@exception", { link = "Exception" })
    highlight("@function", { fg = c.norm, bold = true })
    highlight("@function.builtin", { fg = c.green, bold = true })
    highlight("@function.macro", { fg = c.cyan, bold = true })
    highlight("@function.method", { fg = c.light_blue, bold = true })
    highlight("@keyword.conditional", { fg = c.red })
    highlight("@keyword.import", { link = "Include" })
    highlight("@keyword.repeat", { fg = c.red })
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
    highlight("@module", { fg = c.cyan, bold = true })
    highlight("@none", { fg = c.norm })
    highlight("@number", { link = "Number" })
    highlight("@number.float", { link = "Float" })
    highlight("@operator", { fg = c.subtle })
    highlight("@property", { fg = c.subtle })
    highlight("@punctuation.bracket", { fg = c.fg })
    highlight("@punctuation.delimiter", { fg = c.fg })
    highlight("@string", { link = "String" })
    highlight("@string.escape", { fg = c.cyan, bold = true })
    highlight("@string.regexp", { fg = c.cyan })
    highlight("@string.special.symbol", { fg = c.blue, bold = true })
    highlight("@string.special.url", { fg = c.blue, underline = true })
    highlight("@tag", { fg = c.blue, bold = true })
    highlight("@tag.delimiter", { fg = c.fg })
    highlight("@tag.attribute", { fg = c.purple })
    highlight("@variable", { fg = c.norm })
    highlight("@variable.builtin", { fg = c.norm, bold = true })
    highlight("@variable.member", { fg = c.subtle })
    highlight("@variable.parameter", { fg = c.fg, italic = true })
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

    -- __LUALINE__
    highlight("LuaLineNormalA", { fg = c.bg, bg = c.blue, bold = true })
    highlight("LuaLineNormalB", { fg = c.norm, bg = c.black })
    highlight("LuaLineNormalC", { fg = c.norm })
    highlight("LuaLineInsertA", { fg = c.bg, bg = c.green, bold = true })
    highlight("LuaLineVisualA", { fg = c.bg, bg = c.purple, bold = true })
    highlight("LuaLineReplaceA", { fg = c.bg, bg = c.yellow, bold = true })

    -- __BLINK_PAIRS__
    highlight("BlinkPairsYellow", { fg = c.yellow })
    highlight("BlinkPairsPurple", { fg = c.purple })
    highlight("BlinkPairsCyan", { fg = c.cyan })
  '';
}
