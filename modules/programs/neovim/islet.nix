{ theme, lib, ... }:

with theme;

let
  name = "islet";

  fromHex =
    hex:
    let
      digits = {
        "0" = 0;
        "1" = 1;
        "2" = 2;
        "3" = 3;
        "4" = 4;
        "5" = 5;
        "6" = 6;
        "7" = 7;
        "8" = 8;
        "9" = 9;
        "a" = 10;
        "b" = 11;
        "c" = 12;
        "d" = 13;
        "e" = 14;
        "f" = 15;
        "A" = 10;
        "B" = 11;
        "C" = 12;
        "D" = 13;
        "E" = 14;
        "F" = 15;
      };
      chars = lib.stringToCharacters hex;
    in
    if builtins.length chars == 1 then
      digits.${builtins.elemAt chars 0}
    else if builtins.length chars == 2 then
      digits.${builtins.elemAt chars 0} * 16 + digits.${builtins.elemAt chars 1}
    else
      throw "Invalid hex string: ${hex}";

  toHex =
    n:
    let
      digits = [
        "0"
        "1"
        "2"
        "3"
        "4"
        "5"
        "6"
        "7"
        "8"
        "9"
        "a"
        "b"
        "c"
        "d"
        "e"
        "f"
      ];
      toHexDigit = d: builtins.elemAt digits d;
    in
    if n < 16 then toHexDigit n else toHexDigit (n / 16) + toHexDigit (n - (n / 16) * 16);

  adjustBrightness =
    color: adjustment:
    let
      safeAdjustment =
        if adjustment > 1.0 then
          1.0
        else if adjustment < -1.0 then
          -1.0
        else
          adjustment;

      cleanColor = lib.strings.removePrefix "#" color;

      r = fromHex (builtins.substring 0 2 cleanColor);
      g = fromHex (builtins.substring 2 2 cleanColor);
      b = fromHex (builtins.substring 4 2 cleanColor);

      adjustComponent =
        component:
        if safeAdjustment >= 0 then
          let
            remaining = 255 - component;
          in
          component + builtins.floor (remaining * safeAdjustment)
        else
          component + builtins.floor (component * safeAdjustment);

      newR = lib.trivial.max 0 (lib.trivial.min 255 (adjustComponent r));
      newG = lib.trivial.max 0 (lib.trivial.min 255 (adjustComponent g));
      newB = lib.trivial.max 0 (lib.trivial.min 255 (adjustComponent b));

      padHex =
        n:
        let
          hex = toHex n;
        in
        if builtins.stringLength hex == 1 then "0${hex}" else hex;
    in
    "#${padHex newR}${padHex newG}${padHex newB}";

  norm = adjustBrightness base01 (-0.1);
  subtle = adjustBrightness base01 (-0.3);
  white = adjustBrightness base01 0.4;
  bright_white = adjustBrightness base01 0.6;
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
      none = "NONE",
      bg = "${base00}",
      fg = "${base01}",
      norm = "${norm}",
      subtle = "${subtle}",
      black = "${base02}",
      red = "${base03}",
      green = "${base04}",
      yellow = "${base05}",
      blue = "${base06}",
      purple = "${base07}",
      cyan = "${base08}",
      white = "${white}",
      bright_black = "${base09}",
      bright_red = "${base0A}",
      bright_green = "${base0B}",
      bright_yellow = "${base0C}",
      bright_blue = "${base0D}",
      bright_purple = "${base0E}",
      bright_cyan = "${base0F}",
      bright_white = "${bright_white}",
    }

    local function highlight(group, opts)
      if opts.link then
        local link_attrs = vim.api.nvim_get_hl(0, { name = opts.link, link = false }) or {}
        local new_opts = vim.tbl_deep_extend("force", {}, link_attrs, opts)
        new_opts.link = nil
        vim.api.nvim_set_hl(0, group, new_opts)
      else
        vim.api.nvim_set_hl(0, group, opts)
      end
    end

    -- __TEXT__
    highlight("Normal", { fg = c.norm, bg = c.none })
    highlight("Title", { fg = c.white, bold = true })

    -- __Normal__
    highlight("Cursor", { fg = c.bg, bg = c.norm, reverse = false })
    highlight("SpecialKey", { fg = c.bright_black })
    highlight("Structure", { fg = c.subtle, bold = true })
    highlight("Define", { fg = c.subtle })
    highlight("Macro", { fg = c.subtle })
    highlight("Typedef", { fg = c.subtle, bold = true })
    highlight("PreCondit", { fg = c.subtle })
    highlight("SpecialChar", { fg = c.cyan })
    highlight("Tag", { fg = c.subtle })
    highlight("Debug", { fg = c.red, italic = true })

    -- __CURSOR__
    highlight("LineNr", { fg = c.bright_black })
    highlight("SignColumn", { fg = c.bright_black, bg = c.none })
    highlight("CursorLineNr", { fg = c.yellow, bold = true })
    highlight("CursorLine", { bg = c.black })
    highlight("CursorColumn", { bg = c.black })
    highlight("highlightColumn", { bg = c.black })
    highlight("FoldColumn", { fg = c.bright_black })
    highlight("YankHighlight", { fg = c.white, bg = c.bright_black })

    -- __SEARCH__
    highlight("Search", { fg = c.bg, bg = c.yellow, bold = true })
    highlight("CurSearch", { fg = c.bg, bg = c.blue, bold = true })
    highlight("IncSearch", { fg = c.bg, bg = c.blue, bold = true })
    highlight("Substitute", { fg = c.bg, bg = c.cyan, bold = true })

    -- __VISUAL__
    highlight("Visual", { fg = c.bg, bg = c.blue })
    highlight("VisualNOS", { fg = c.bg, bg = c.blue })
    highlight("Ignore", { fg = c.bright_black })

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
    highlight("FloatBorder", { fg = c.bright_black, bg = c.bg })
    highlight("FloatTitle", { fg = c.fg })

    -- __MENU__
    highlight("Pmenu", { fg = c.norm, bg = c.bg })
    highlight("PmenuSel", { fg = c.bg, bg = c.blue, bold = true })
    highlight("PmenuSbar", { bg = c.bg })
    highlight("PmenuThumb", { bg = c.bright_black })
    highlight("PmenuKind", { fg = c.red, bg = c.bg })
    highlight("PmenuKindSel", { fg = c.red, bg = c.blue })
    highlight("PmenuExtra", { fg = c.subtle, bg = c.bg })
    highlight("PmenuExtraSel", { fg = c.bg, bg = c.blue })
    highlight("PmenuMatch", { fg = c.purple, bg = c.bg })
    highlight("PmenuMatchSel", { fg = c.purple, bg = c.blue, bold = true })

    -- __OTHER UI__
    highlight("WinSeparator", { fg = c.black })
    highlight("EndOfBuffer", { fg = c.bright_black })
    highlight("QuickFixLine", { fg = c.cyan, bg = c.bg, reverse = true })
    highlight("ColorColumn", { bg = c.bg })
    highlight("WildMenu", { fg = c.subtle, bg = c.bright_black, bold = true })
    highlight("ToolbarButton", { fg = c.norm, bg = c.black, bold = true })
    highlight("ToolbarLine", { bg = "NONE" })

    -- __SYNTAX__
    highlight("Function", { fg = c.white, bold = true })
    highlight("Identifier", { fg = c.norm })
    highlight("Type", { fg = c.subtle })
    highlight("Variable", { fg = c.norm })
    highlight("Statement", { fg = c.blue })
    highlight("Include", { fg = c.bright_blue })
    highlight("Special", { fg = c.cyan })
    highlight("Keyword", { fg = c.blue })
    highlight("Conditional", { fg = c.fg, italic = true })
    highlight("Repeat", { fg = c.fg, italic = true })
    highlight("Label", { fg = c.fg })
    highlight("Exception", { fg = c.red })
    highlight("PreProc", { fg = c.bright_yellow })
    highlight("StorageClass", { fg = c.norm })
    highlight("Member", { fg = c.subtle })
    highlight("Property", { fg = c.norm })

    -- __CONSTANTS__
    highlight("String", { fg = c.green })
    highlight("Constant", { fg = c.white, bold = true })
    highlight("Directory", { fg = c.blue })
    highlight("Character", { fg = c.green, italic = true })
    highlight("Number", { fg = c.purple })
    highlight("Boolean", { fg = c.bright_blue, bold = true })
    highlight("Float", { fg = c.purple })

    -- __PUNCTUATION__
    highlight("Quote", { fg = c.green })
    highlight("Operator", { fg = c.yellow })
    highlight("Delimiter", { fg = c.fg })
    highlight("MatchParen", { bg = c.bright_black, bold = true, underline = true })

    -- __NonText__
    highlight("NonText", { fg = c.bright_black })
    highlight("Folded", { fg = c.bright_black, bg = c.bg })
    highlight("qfLineNr", { link = "NonText" })

    -- __COMMENT__
    highlight("Todo", { fg = c.yellow, bg = c.black, bold = true, italic = true })
    highlight("Question", { fg = c.blue, bold = true })
    highlight("Comment", { fg = c.bright_black, italic = true })
    highlight("SpecialComment", { link = "Comment" })
    highlight("Conceal", { fg = c.bright_black })

    -- __SPELL__
    highlight("SpellBad", { fg = c.red, underline = true, sp = c.red })
    highlight("SpellCap", { fg = c.yellow, underline = true, sp = c.yellow })
    highlight("SpellRare", { fg = c.purple, underline = true, sp = c.purple })
    highlight("SpellLocal", { fg = c.blue, underline = true, sp = c.blue })

    -- __WILD MENU__
    highlight("WildMenu", { fg = c.bright_black, bold = true, underline = true })

    -- __HTML__
    highlight("htmlH1", { link = "Normal" })
    highlight("htmlH2", { link = "Normal" })
    highlight("htmlH3", { link = "Normal" })
    highlight("htmlH4", { link = "Normal" })
    highlight("htmlH5", { link = "Normal" })
    highlight("htmlH6", { link = "Normal" })

    -- __MARKDOWN__
    highlight("markdownH1", { fg = c.white, bold = true })
    highlight("markdownH2", { fg = c.white, bold = true })
    highlight("markdownH3", { fg = c.white, bold = true })
    highlight("markdownH4", { fg = c.norm, bold = true })
    highlight("markdownH5", { fg = c.norm, bold = true })
    highlight("markdownH6", { fg = c.norm, bold = true })
    highlight("markdownListMarker", { fg = c.blue })
    highlight("markdownCode", { fg = c.cyan, bg = c.bright_black })
    highlight("markdownInlineCode", { fg = c.cyan, bg = c.bright_black })
    highlight("markdownCodeDelimiter", { fg = c.subtle })
    highlight("markdownHeadingDelimiter", { fg = c.subtle })
    highlight("markdownBold", { fg = c.white, bold = true })
    highlight("markdownItalic", { fg = c.norm, italic = true })
    highlight("markdownUrl", { fg = c.blue, underline = true })
    highlight("markdownLink", { fg = c.blue })
    highlight("markdownLinkText", { fg = c.norm })

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
    vim.g.terminal_color_8 = c.bright_black
    vim.g.terminal_color_9 = c.bright_red
    vim.g.terminal_color_10 = c.bright_green
    vim.g.terminal_color_11 = c.bright_yellow
    vim.g.terminal_color_12 = c.bright_blue
    vim.g.terminal_color_13 = c.bright_purple
    vim.g.terminal_color_14 = c.bright_cyan
    vim.g.terminal_color_15 = c.bright_white

    -- __TREE SITTER__
    highlight("@keyword", { link = "Keyword" })
    highlight("@keyword.function", { link = "keyword", italic = true })
    highlight("@keyword.return", { link = "Keyword", italic = true })
    highlight("@keyword.operator", { link = "Operator" })
    highlight("@keyword.builtin", { link = "Keyword" })
    highlight("@keyword.macro", { link = "Keyword" })
    highlight("@keyword.method", { link = "Keyword" })
    highlight("@keyword.conditional", { link = "Keyword" })
    highlight("@keyword.import", { link = "Include" })
    highlight("@keyword.repeat", { link = "Repeat" })
    highlight("@type", { link = "Type" })
    highlight("@type.builtin", { link = "Type" })
    highlight("@type.definition", { fg = c.norm, bold = true })
    highlight("@property", { link = "Property" })
    highlight("@label", { link = "Label" })
    highlight("@annotation", { fg = c.green })
    highlight("@attribute", { link = "Special" })
    highlight("@boolean", { link = "Boolean" })
    highlight("@character", { link = "Character" })
    highlight("@comment", { link = "Comment" })
    highlight("@comment.error", { fg = c.red, bold = true })
    highlight("@comment.warning", { fg = c.yellow, bold = true })
    highlight("@comment.todo", { link = "Todo" })
    highlight("@comment.highlight", { fg = c.blue, bold = true })
    highlight("@comment.info", { fg = c.blue })
    highlight("@comment.note", { link = "@comment" })
    highlight("@comment.documentation", { link = "Comment" })
    highlight("@constant", { link = "Constant" })
    highlight("@constant.builtin", { link = "@constant", bold = true })
    highlight("@constant.macro", { link = "@keyword" })
    highlight("@constructor", { link = "Function" })
    highlight("@diff.delta", { link = "DiffChange" })
    highlight("@diff.minus", { link = "DiffDelete" })
    highlight("@diff.plus", { link = "DiffAdd" })
    highlight("@error", { link = "Error" })
    highlight("@exception", { link = "Exception" })
    highlight("@function", { link = "Function" })
    highlight("@function.builtin", { link = "@function", italic = true })
    highlight("@function.macro", { link = "@keyword" })
    highlight("@function.method", { link = "@function" })
    highlight("@markup", { link = "Normal" })
    highlight("@markup.emphasis", { fg = c.norm, italic = true })
    highlight("@markup.heading", { fg = c.white, bold = true })
    highlight("@markup.link.url", { fg = c.subtle })
    highlight("@markup.link.label", { fg = c.white })
    highlight("@markup.list", { fg = c.yellow, bold = true })
    highlight("@markup.quote", { fg = c.subtle, italic = true })
    highlight("@markup.raw", { fg = c.cyan, bg = c.bright_black })
    highlight("@markup.strikethrough", { fg = c.subtle, strikethrough = true })
    highlight("@markup.strong", { fg = c.white, bold = true })
    highlight("@markup.underline", { fg = c.norm, underline = true })
    highlight("@module", { fg = c.norm })
    highlight("@namespace", { fg = c.norm })
    highlight("@none", { link = "Normal" })
    highlight("@number", { link = "Number" })
    highlight("@number.float", { link = "Float" })
    highlight("@operator", { link = "Operator" })
    highlight("@punctuation.bracket", { link = "Delimiter" })
    highlight("@punctuation.delimiter", { link = "Delimiter" })
    highlight("@punctuation.special", { link = "Delimiter" })
    highlight("@string", { link = "String" })
    highlight("@string.escape", { fg = c.cyan, bold = true })
    highlight("@string.regexp", { link = "@string", bg = c.bright_black, italic = true })
    highlight("@string.special.symbol", { link = "Special" })
    highlight("@string.special.url", { link = "@string", underline = true })
    highlight("@tag", { fg = c.cyan })
    highlight("@tag.delimiter", { link = "Delimiter" })
    highlight("@tag.attribute", { fg = c.norm })
    highlight("@variable", { link = "Variable" })
    highlight("@variable.builtin", { link = "@variable", italic = true })
    highlight("@variable.member", { link = "Member" })
    highlight("@variable.parameter", { link = "@variable" })
    highlight("@variable.parameter.reference", { link = "@variable.parameter" })
    highlight("@field", { link = "@variable" })
    highlight("@method", { link = "Function" })
    highlight("@method.call", { link = "@method" })
    highlight("@parameter", { link = "@variable" })
    highlight("@text.strong", { fg = c.white, bold = true })
    highlight("@text.emphasis", { fg = c.norm, italic = true })
    highlight("@text.underline", { fg = c.norm, underline = true })
    highlight("@text.strike", { fg = c.subtle, strikethrough = true })
    highlight("@text.title", { fg = c.white, bold = true })
    highlight("@text.literal", { fg = c.cyan })
    highlight("@text.uri", { fg = c.blue, underline = true })
    highlight("@text.math", { fg = c.cyan })
    highlight("@text.reference", { fg = c.blue })
    highlight("@symbol", { fg = c.cyan })
    highlight("@include", { link = "Include" })
    highlight("@preproc", { link = "PreProc" })
    highlight("@define", { link = "PreProc" })
    highlight("@storageclass", { link = "StorageClass" })
    highlight("@structure", { link = "Statement", bold = true })
    highlight("@typedef", { link = "@type", bold = true })
    highlight("@typedef.definition", { link = "@type.definition" })

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

    highlight("DiagnosticInfo", { fg = c.subtle })
    highlight("DiagnosticSignInfo", { fg = c.subtle })
    highlight("DiagnosticFloatingInfo", { fg = c.subtle })
    highlight("DiagnosticVirtualTextInfo", { fg = c.subtle, bg = "NONE" })
    highlight("DiagnosticUnderlineInfo", { underline = true, sp = c.subtle })

    highlight("DiagnosticHint", { fg = c.subtle })
    highlight("DiagnosticSignHint", { fg = c.subtle })
    highlight("DiagnosticFloatingHint", { fg = c.subtle })
    highlight("DiagnosticVirtualTextHint", { fg = c.subtle, bg = "NONE" })
    highlight("DiagnosticUnderlineHint", { underline = true, sp = c.subtle })

    -- __LSP__
    highlight("LspTroubleNormal", { fg = c.bright_purple })
    highlight("LspTroubleText", { fg = c.bright_red })
    highlight("LspTroubleCount", { fg = c.red })

    highlight("LspReferenceText", { fg = c.norm, bg = c.black })
    highlight("LspReferenceRead", { fg = c.norm, bg = c.black })
    highlight("LspReferenceWrite", { fg = c.norm, bg = c.black })

    -- Legacy LSP diagnostics (for older versions)
    highlight("LspDiagnosticsDefaultError", { link = "DiagnosticError" })
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

    -- LSP semantic tokens
    highlight("@lsp.type.class", { link = "@type" })
    highlight("@lsp.type.comment", { link = "Comment" })
    highlight("@lsp.type.decorator", { fg = c.green })
    highlight("@lsp.type.enum", { link = "@type" })
    highlight("@lsp.type.enumMember", { link = "@constant" })
    highlight("@lsp.type.function", { link = "@function" })
    highlight("@lsp.type.interface", { link = "@type" })
    highlight("@lsp.type.keyword", { link = "@keyword" })
    highlight("@lsp.type.macro", { link = "@keyword" })
    highlight("@lsp.type.method", { link = "@method" })
    highlight("@lsp.type.namespace", { link = "@namespace" })
    highlight("@lsp.type.parameter", { link = "@parameter" })
    highlight("@lsp.type.property", { link = "@property" })
    highlight("@lsp.type.struct", { link = "@type" })
    highlight("@lsp.type.type", { link = "@type" })
    highlight("@lsp.type.typeParameter", { link = "@type" })
    highlight("@lsp.type.variable", { link = "@variable" })

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
