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
      base00 = "${base00}",
      base01 = "${base01}",
      base02 = "${base02}",
      base03 = "${base03}",
      base04 = "${base04}",
      base05 = "${base05}",
      base06 = "${base06}",
      base07 = "${base07}",
      base08 = "${base08}",
      base09 = "${base09}",
      base0A = "${base0A}",
      base0B = "${base0B}",
      base0C = "${base0C}",
      base0D = "${base0D}",
      base0E = "${base0E}",
      base0F = "${base0F}",
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

    -- ============================================================================
    -- COMMON UI ELEMENTS
    -- ============================================================================

    -- Editor
    highlight("Normal", { fg = c.base07 })
    highlight("NormalFloat", { fg = c.base05, bg = c.base01 })
    highlight("ColorColumn", { bg = c.base02 })
    highlight("Conceal", { fg = c.base0D })
    highlight("Cursor", { fg = c.base00, bg = c.base05 })
    highlight("lCursor", { fg = c.base00, bg = c.base05 })
    highlight("CursorIM", { fg = c.base00, bg = c.base05 })
    highlight("CursorColumn", { bg = c.base02 })
    highlight("CursorLine", { bg = c.base02 })
    highlight("Directory", { fg = c.base0D })
    highlight("DiffAdd", { fg = c.base0B, reverse = true })
    highlight("DiffChange", { fg = c.base09, reverse = true })
    highlight("DiffDelete", { fg = c.base08, reverse = true })
    highlight("DiffText", { fg = c.base0D, reverse = true })
    highlight("EndOfBuffer", { fg = c.base03 })
    highlight("ErrorMsg", { fg = c.base08, bold = true })
    highlight("VertSplit", { fg = c.base02 })
    highlight("WinSeparator", { fg = c.base02 })
    highlight("Folded", { fg = c.base03, bg = c.base01 })
    highlight("FoldColumn", { fg = c.base03 })
    highlight("SignColumn", { fg = c.base05 })
    highlight("IncSearch", { fg = c.base00, bg = c.base09 })
    highlight("Substitute", { fg = c.base00, bg = c.base0C })
    highlight("LineNr", { fg = c.base02 })
    highlight("CursorLineNr", { fg = c.base05, bold = true })
    highlight("MatchParen", { bg = c.base02, bold = true, underline = true })
    highlight("ModeMsg", { fg = c.base0B })
    highlight("MsgArea", { fg = c.base05 })
    highlight("MsgSeparator", { fg = c.base03 })
    highlight("MoreMsg", { fg = c.base0C, bold = true })
    highlight("NonText", { fg = c.base03 })
    highlight("Pmenu", { fg = c.base05, bg = c.base01 })
    highlight("PmenuSel", { fg = c.base07, bg = c.base02, bold = true })
    highlight("PmenuSbar", { bg = c.base00 })
    highlight("PmenuThumb", { bg = c.base03 })
    highlight("PmenuKind", { fg = c.base08 })
    highlight("PmenuKindSel", { fg = c.base08 })
    highlight("PmenuExtra", { fg = c.base06, bg = c.base01 })
    highlight("PmenuExtraSel", { fg = c.base0B, bg = c.base02, bold = true })
    highlight("PmenuMatch", { fg = c.base0A, bold = true })
    highlight("Question", { fg = c.base0B, bold = true })
    highlight("QuickFixLine", { fg = c.base0D, underline = true })
    highlight("Search", { fg = c.base00, bg = c.base0A, bold = true })
    highlight("CurSearch", { fg = c.base00, bg = c.base0D, bold = true })
    highlight("SpecialKey", { fg = c.base03 })
    highlight("SpellBad", { sp = c.base08, underline = true })
    highlight("SpellCap", { sp = c.base0A, underline = true })
    highlight("SpellLocal", { sp = c.base0C, underline = true })
    highlight("SpellRare", { sp = c.base0E, underline = true })
    highlight("StatusLine", { fg = c.base05, bg = c.base01 })
    highlight("StatusLineNC", { fg = c.base03, bg = c.base01 })
    highlight("TabLine", { fg = c.base04, bg = c.base01 })
    highlight("TabLineFill", { fg = c.base03, bg = c.base01 })
    highlight("TabLineSel", { fg = c.base00, bg = c.base05, bold = true })
    highlight("Terminal", { fg = c.base05 })
    highlight("Title", { fg = c.base0D, bold = true })
    highlight("Visual", { bg = c.base02 })
    highlight("VisualNOS", { bg = c.base02 })
    highlight("WarningMsg", { fg = c.base09, bold = true })
    highlight("Whitespace", { fg = c.base03 })
    highlight("WildMenu", { fg = c.base00, bg = c.base0D, bold = true })
    highlight("WinBar", { fg = c.base05, bg = c.base01 })
    highlight("WinBarNC", { fg = c.base02 })

    -- Float
    highlight("FloatBorder", { fg = c.base03, bg = c.base01 })
    highlight("FloatTitle", { fg = c.base0D })

    -- ============================================================================
    -- SYNTAX HIGHLIGHTING
    -- ============================================================================

    highlight("Boolean", { fg = c.base0C, bold = true })
    highlight("Character", { fg = c.base0B })
    highlight("Comment", { fg = c.base03, italic = true })
    highlight("Conditional", { fg = c.base0E })
    highlight("Constant", { fg = c.base06 })
    highlight("Define", { fg = c.base0E })
    highlight("Delimiter", { fg = c.base04 })
    highlight("Error", { fg = c.base08, bg = c.base00, bold = true })
    highlight("Exception", { fg = c.base0E })
    highlight("Float", { fg = c.base0C })
    highlight("Function", { fg = c.base06, italic = true })
    highlight("Identifier", { fg = c.base05 })
    highlight("Include", { fg = c.base05 })
    highlight("Keyword", { fg = c.base0E, bold = true })
    highlight("Label", { fg = c.base0D })
    highlight("Macro", { fg = c.base0C })
    highlight("Number", { fg = c.base0C })
    highlight("Operator", { fg = c.base08 })
    highlight("PreCondit", { fg = c.base03 })
    highlight("PreProc", { fg = c.base0C })
    highlight("Repeat", { fg = c.base0E })
    highlight("Special", { fg = c.base0F })
    highlight("SpecialChar", { fg = c.base0F })
    highlight("SpecialComment", { fg = c.base03 })
    highlight("Statement", { fg = c.base0E })
    highlight("StorageClass", { fg = c.base0E })
    highlight("String", { fg = c.base0B, italic = true })
    highlight("Structure", { fg = c.base0E })
    highlight("Tag", { fg = c.base0D })
    highlight("Todo", { fg = c.base0A, bg = c.base01, bold = true, italic = true })
    highlight("Type", { fg = c.base04 })
    highlight("Typedef", { fg = c.base07 })

    -- ============================================================================
    -- TREESITTER (Linked to Syntax)
    -- ============================================================================

    -- Literals
    highlight("@boolean", { link = "Boolean" })
    highlight("@character", { link = "Character" })
    highlight("@character.special", { link = "SpecialChar" })
    highlight("@number", { link = "Number" })
    highlight("@number.float", { link = "Float" })
    highlight("@string", { link = "String" })
    highlight("@string.escape", { fg = c.base0D, bold = true })
    highlight("@string.regexp", { fg = c.base0F })
    highlight("@string.special.symbol", { fg = c.base0C })
    highlight("@string.special.url", { fg = c.base09, underline = true })

    -- Functions & Methods
    highlight("@function", { link = "Function" })
    highlight("@function.builtin", { fg = c.base0D, bold = true })
    highlight("@function.call", { fg = c.base0D })
    highlight("@function.macro", { link = "Macro" })
    highlight("@function.method", { fg = c.base07, bold = true })
    highlight("@function.method.call", { fg = c.base0D })
    highlight("@constructor", { fg = c.base0D, bold = true })
    highlight("@constructor.lua", { fg = c.base0D })

    -- Keywords
    highlight("@keyword", { link = "Keyword" })
    highlight("@keyword.conditional", { link = "Conditional" })
    highlight("@keyword.exception", { link = "Exception" })
    highlight("@keyword.function", { fg = c.base07, bold = true })
    highlight("@keyword.import", { link = "Include" })
    highlight("@keyword.operator", { link = "Operator" })
    highlight("@keyword.return", { fg = c.base0E, italic = true })
    highlight("@keyword.repeat", { link = "Repeat" })

    -- Variables & Constants
    highlight("@variable", { fg = c.base05 })
    highlight("@variable.builtin", { fg = c.base05, italic = true })
    highlight("@variable.member", { fg = c.base07 })
    highlight("@variable.parameter", { fg = c.base05 })
    highlight("@constant", { link = "Constant" })
    highlight("@constant.builtin", { fg = c.base0F, bold = true })
    highlight("@constant.macro", { link = "Macro" })

    -- Types
    highlight("@type", { link = "Type" })
    highlight("@type.builtin", { link = "Typedef" })
    highlight("@type.definition", { link = "Typedef" })
    highlight("@type.declaration", { fg = c.base0D })

    -- Identifiers
    highlight("@property", { fg = c.base07 })
    highlight("@field", { fg = c.base04 })
    highlight("@parameter", { fg = c.base05 })
    highlight("@label", { link = "Label" })
    highlight("@module", { fg = c.base07 })
    highlight("@namespace", { link = "Type" })

    -- Operators & Punctuation
    highlight("@operator", { link = "Operator" })
    highlight("@punctuation.delimiter", { fg = c.base04 })
    highlight("@punctuation.bracket", { fg = c.base04 })
    highlight("@punctuation.special", { fg = c.base0F })

    -- Tags (HTML/JSX)
    highlight("@tag", { fg = c.base0E })
    highlight("@tag.attribute", { fg = c.base05 })
    highlight("@tag.delimiter", { fg = c.base04 })

    -- Markup (Markdown, etc.)
    highlight("@markup", { fg = c.base05 })
    highlight("@markup.strong", { fg = c.base05, bold = true })
    highlight("@markup.emphasis", { fg = c.base05, italic = true })
    highlight("@markup.underline", { fg = c.base05, underline = true })
    highlight("@markup.strikethrough", { fg = c.base05, strikethrough = true })
    highlight("@markup.heading", { fg = c.base0D, bold = true })
    highlight("@markup.link", { fg = c.base0B })
    highlight("@markup.link.label", { fg = c.base0C })
    highlight("@markup.link.url", { fg = c.base0C, underline = true })
    highlight("@markup.list", { fg = c.base09 })
    highlight("@markup.quote", { fg = c.base03, italic = true })
    highlight("@markup.raw", { fg = c.base0B, bg = c.base01 })
    highlight("@markup.math", { fg = c.base0C })

    -- Comments
    highlight("@comment", { link = "Comment" })
    highlight("@comment.documentation", { link = "Comment" })
    highlight("@comment.error", { fg = c.base08, bold = true })
    highlight("@comment.warning", { fg = c.base09, bold = true })
    highlight("@comment.todo", { link = "Todo" })
    highlight("@comment.note", { fg = c.base0C, bold = true })
    highlight("@comment.info", { fg = c.base0C })
    highlight("@comment.highlight", { fg = c.base0D, bold = true })

    -- Misc
    highlight("@attribute", { fg = c.base0C })
    highlight("@annotation", { fg = c.base0F })
    highlight("@error", { link = "Error" })
    highlight("@none", { fg = c.base05 })

    -- Diff
    highlight("@diff.plus", { fg = c.base0B })
    highlight("@diff.minus", { fg = c.base08 })
    highlight("@diff.delta", { fg = c.base09 })
    highlight("@text.diff.add", { fg = c.base0B })
    highlight("@text.diff.delete", { fg = c.base08 })

    -- Legacy treesitter groups
    highlight("@text.strong", { link = "@markup.strong" })
    highlight("@text.emphasis", { link = "@markup.emphasis" })
    highlight("@text.underline", { link = "@markup.underline" })
    highlight("@text.strike", { link = "@markup.strikethrough" })
    highlight("@text.title", { link = "@markup.heading" })
    highlight("@text.literal", { link = "@markup.raw" })
    highlight("@text.uri", { link = "@markup.link.url" })
    highlight("@text.math", { link = "@markup.math" })
    highlight("@text.reference", { fg = c.base0C })
    highlight("@method", { link = "@function.method" })
    highlight("@method.call", { link = "@function.method.call" })
    highlight("@include", { link = "Include" })
    highlight("@preproc", { link = "PreProc" })
    highlight("@define", { link = "Define" })
    highlight("@storageclass", { link = "StorageClass" })
    highlight("@structure", { link = "Structure" })
    highlight("@typedef", { link = "Typedef" })
    highlight("@typedef.definition", { link = "@type.definition" })
    highlight("@symbol", { fg = c.base0C })

    -- ============================================================================
    -- LSP SEMANTIC TOKENS & DIAGNOSTICS
    -- ============================================================================

    -- LSP Semantic Tokens (linked to existing groups)
    highlight("@lsp.type.class", { link = "@type" })
    highlight("@lsp.type.comment", { link = "Comment" })
    highlight("@lsp.type.decorator", { fg = c.base0F })
    highlight("@lsp.type.enum", { link = "@type" })
    highlight("@lsp.type.enumMember", { link = "@constant" })
    highlight("@lsp.type.function", { link = "@function" })
    highlight("@lsp.type.interface", { link = "@type" })
    highlight("@lsp.type.keyword", { link = "@keyword" })
    highlight("@lsp.type.macro", { link = "@keyword" })
    highlight("@lsp.type.method", { link = "@function.method" })
    highlight("@lsp.type.namespace", { link = "Type" })
    highlight("@lsp.type.parameter", { link = "@parameter" })
    highlight("@lsp.type.property", { link = "@property" })
    highlight("@lsp.type.struct", { link = "@type" })
    highlight("@lsp.type.type", { link = "@type" })
    highlight("@lsp.type.typeParameter", { link = "@type" })
    highlight("@lsp.type.variable", { link = "@variable" })
    highlight("@lsp.type.builtinConstant", { link = "@constant.builtin" })
    highlight("@lsp.type.builtinType", { link = "@type.builtin" })
    highlight("@lsp.typemod.function.defaultLibrary", { link = "@function.builtin" })
    highlight("@lsp.typemod.function.definition", { link = "@function" })
    highlight("@lsp.typemod.variable.defaultLibrary", { link = "@constant.builtin" })
    highlight("@lsp.typemod.variable.definition", { link = "@property" })

    -- Diagnostics
    highlight("DiagnosticError", { fg = c.base08, bold = true })
    highlight("DiagnosticWarn", { fg = c.base09, bold = true })
    highlight("DiagnosticInfo", { fg = c.base0C })
    highlight("DiagnosticHint", { fg = c.base0A })
    highlight("DiagnosticOk", { fg = c.base0B })

    highlight("DiagnosticSignError", { fg = c.base08, bold = true })
    highlight("DiagnosticSignWarn", { fg = c.base09, bold = true })
    highlight("DiagnosticSignInfo", { fg = c.base0C })
    highlight("DiagnosticSignHint", { fg = c.base0A })

    highlight("DiagnosticFloatingError", { fg = c.base08 })
    highlight("DiagnosticFloatingWarn", { fg = c.base09 })
    highlight("DiagnosticFloatingInfo", { fg = c.base0C })
    highlight("DiagnosticFloatingHint", { fg = c.base0A })

    highlight("DiagnosticVirtualTextError", { fg = c.base08 })
    highlight("DiagnosticVirtualTextWarn", { fg = c.base09 })
    highlight("DiagnosticVirtualTextInfo", { fg = c.base0C })
    highlight("DiagnosticVirtualTextHint", { fg = c.base0A })

    highlight("DiagnosticUnderlineError", { sp = c.base08, underline = true })
    highlight("DiagnosticUnderlineWarn", { sp = c.base09, underline = true })
    highlight("DiagnosticUnderlineInfo", { sp = c.base0C, underline = true })
    highlight("DiagnosticUnderlineHint", { sp = c.base0A, underline = true })

    -- LSP References
    highlight("LspReferenceText", { bg = c.base02 })
    highlight("LspReferenceRead", { bg = c.base02 })
    highlight("LspReferenceWrite", { bg = c.base02 })

    -- Legacy LSP Diagnostics
    highlight("LspDiagnosticsDefaultError", { link = "DiagnosticError" })
    highlight("LspDiagnosticsDefaultWarning", { link = "DiagnosticWarn" })
    highlight("LspDiagnosticsDefaultInformation", { link = "DiagnosticInfo" })
    highlight("LspDiagnosticsDefaultHint", { link = "DiagnosticHint" })

    -- ============================================================================
    -- PLUGIN SPECIFIC: Blink
    -- ============================================================================

    highlight("BlinkCmpMenuBorder", { fg = c.base02, bg = c.base01 })
    highlight("BlinkCmpLabel", { fg = c.base04 })
    highlight("BlinkCmpLabelDepricated", { fg = c.base04, strikethrough = true })
    highlight("BlinkCmpLabelMatch", { fg = c.base08, bold = true })
    highlight("BlinkCmpGhostText", { fg = c.base02 })
    highlight("BlinkCmpKind", { bg = c.base00 })
    highlight("BlinkCmpKindText", { fg = c.base04 })
    highlight("BlinkCmpKindFunction", { fg = c.base08 })
    highlight("BlinkCmpKindProperty", { fg = c.base0D })
    highlight("BlinkCmpKindVariable", { fg = c.base0B })
    highlight("BlinkCmpKindEnum", { fg = c.base0A })
    highlight("BlinkCmpKindSnippet", { fg = c.base0C })
    highlight("BlinkCmpKindField", { fg = c.base0F })
    highlight("BlinkCmpKindConstant", { fg = c.base09 })
    highlight("BlinkCmpKindMethod", { fg = c.base0D })
    highlight("BlinkCmpSource", { bg = c.base00 })

    highlight("BlinkPairsYellow", { fg = c.base0A })
    highlight("BlinkPairsPurple", { fg = c.base0E })
    highlight("BlinkPairsCyan", { fg = c.base0C })

    -- ============================================================================
    -- PLUGIN SPECIFIC: Lualine
    -- ============================================================================

    highlight("LuaLineNormalA", { fg = c.base00, bg = c.base0D, bold = true })
    highlight("LuaLineNormalB", { fg = c.base05, bg = c.base00 })
    highlight("LuaLineNormalC", { fg = c.base05, bg = c.base00 })
    highlight("LuaLineInsertA", { fg = c.base00, bg = c.base0B, bold = true })
    highlight("LuaLineVisualA", { fg = c.base00, bg = c.base0E, bold = true })
    highlight("LuaLineReplaceA", { fg = c.base00, bg = c.base08, bold = true })

    -- ============================================================================
    -- PLUGIN SPECIFIC: Gitsigns
    -- ============================================================================

    highlight("GitSignsAdd", { fg = c.base0B })
    highlight("GitSignsChange", { fg = c.base09 })
    highlight("GitSignsDelete", { fg = c.base08 })
    highlight("GitSignsAddNr", { fg = c.base0B })
    highlight("GitSignsChangeNr", { fg = c.base09 })
    highlight("GitSignsDeleteNr", { fg = c.base08 })
    highlight("GitSignsAddLn", { fg = c.base0B })
    highlight("GitSignsChangeLn", { fg = c.base09 })
    highlight("GitSignsDeleteLn", { fg = c.base08 })

    -- ============================================================================
    -- PLUGIN SPECIFIC: Snacks (picker, input, indent)
    -- ============================================================================

    -- Snacks Picker
    highlight("SnacksPicker", { fg = c.base05, bg = c.base00 })
    highlight("SnacksPickerBorder", { fg = c.base03 })
    highlight("SnacksPickerMatch", { fg = c.base0A, bold = true })
    highlight("SnacksPickerPrompt", { fg = c.base0C })
    highlight("SnacksPickerGitStatusAdded", { fg = c.base0B })
    highlight("SnacksPickerGitStatusModified", { fg = c.base09 })
    highlight("SnacksPickerGitStatusStaged", { fg = c.base0E })

    -- Snacks Input
    highlight("SnacksInputBorder", { fg = c.base03 })
    highlight("SnacksInputPrompt", { fg = c.base03 })
    highlight("SnacksInputTitle", { fg = c.base0D })
    highlight("SnacksInputIcon", { fg = c.base0C })

    -- Snacks Indent
    highlight("SnacksIndent", { fg = c.base01 })
    highlight("SnacksIndentScope", { fg = c.base03 })

    -- ============================================================================
    -- PLUGIN SPECIFIC: Incline (floating filename)
    -- ============================================================================

    highlight("InclineNormal", { fg = c.base05, bg = c.base02 })
    highlight("InclineNormalNC", { fg = c.base06, bg = c.base01 })

    -- ============================================================================
    -- PLUGIN SPECIFIC: Fidget (LSP progress)
    -- ============================================================================

    highlight("FidgetTask", { fg = c.base03 })
    highlight("FidgetTitle", { fg = c.base0D })

    -- ============================================================================
    -- PLUGIN SPECIFIC: nvim-highlight-colors
    -- ============================================================================

    -- Uses default rendering

    -- ============================================================================
    -- PLUGIN SPECIFIC: Conform & nvim-lint
    -- ============================================================================

    -- Uses LSP diagnostics

    -- ============================================================================
    -- TERMINAL COLORS
    -- ============================================================================

    vim.g.terminal_color_0 = c.base00
    vim.g.terminal_color_1 = c.base08
    vim.g.terminal_color_2 = c.base0B
    vim.g.terminal_color_3 = c.base0A
    vim.g.terminal_color_4 = c.base0D
    vim.g.terminal_color_5 = c.base0E
    vim.g.terminal_color_6 = c.base0C
    vim.g.terminal_color_7 = c.base05
    vim.g.terminal_color_8 = c.base03
    vim.g.terminal_color_9 = c.base08
    vim.g.terminal_color_10 = c.base0B
    vim.g.terminal_color_11 = c.base0A
    vim.g.terminal_color_12 = c.base0D
    vim.g.terminal_color_13 = c.base0E
    vim.g.terminal_color_14 = c.base0C
    vim.g.terminal_color_15 = c.base07
  '';
}
