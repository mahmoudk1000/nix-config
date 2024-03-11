{ theme
, ...
}:

{
  home.file.".config/nvim/colors/neuewelt.vim".text = ''
    " Just another colorscheme for Vim
    hi clear

    set background=dark

    if exists('syntax_on')
    syntax reset
    endif

    let g:colors_name="neuewelt"

    let s:background      = { "gui": "${theme.base00}" }
    let s:foreground      = { "gui": "${theme.base01}" }
    let s:darker          = { "gui": "#0F151A" }
    let s:black           = { "gui": "${theme.base02}" }
    let s:light_black     = { "gui": "${theme.base09}" }
    let s:red             = { "gui": "${theme.base03}" }
    let s:light_red       = { "gui": "${theme.base0A}" }
    let s:green           = { "gui": "${theme.base04}" }
    let s:light_green     = { "gui": "${theme.base0B}" }
    let s:yellow          = { "gui": "${theme.base05}" }
    let s:light_yellow    = { "gui": "${theme.base0C}" }
    let s:blue            = { "gui": "${theme.base06}" }
    let s:light_blue      = { "gui": "${theme.base0D}" }
    let s:purple          = { "gui": "${theme.base07}" }
    let s:light_purple    = { "gui": "${theme.base0E}" }
    let s:cyan            = { "gui": "${theme.base08}" }
    let s:light_cyan      = { "gui": "${theme.base0F}" }
    let s:white           = { "gui": "#D8dEE9" }
    let s:light_white     = { "gui": "#E5E9F0" }

    function! s:Color(group, style)
    execute "hi!" a:group
    \ "guifg="  (has_key(a:style, "fg")   ? a:style.fg.gui  : "NONE")
    \ "guibg="  (has_key(a:style, "bg")   ? a:style.bg.gui  : "NONE")
    \ "guisp="  (has_key(a:style, "sp")   ? a:style.sp.gui  : "NONE")
    \ "gui="    (has_key(a:style, "gui")  ? a:style.gui     : "NONE")
    endfunction

    " Syntax Highlighting
    call s:Color('Type', {'fg': s:blue})
    call s:Color('StorageClass', {'fg': s:blue})
    call s:Color('Structure', {'fg': s:blue})
    call s:Color('Constant', {'fg': s:white})
    call s:Color('Character', {'fg': s:green})
    call s:Color('Number', {'fg': s:purple})
    call s:Color('Boolean', {'fg': s:blue})
    call s:Color('Float', {'fg': s:purple})
    call s:Color('Statement', {'fg': s:blue})
    call s:Color('Label', {'fg': s:blue})
    call s:Color('Operator', {'fg': s:blue})
    call s:Color('Exception', {'fg': s:blue})
    call s:Color('PreProc', {'fg': s:foreground})
    call s:Color('Include', {'fg': s:blue})
    call s:Color('Define', {'fg': s:blue})
    call s:Color('Macro', {'fg': s:blue})
    call s:Color('Typedef', {'fg': s:blue})
    call s:Color('PreCondit', {'fg': s:yellow})
    call s:Color('Special', {'fg': s:white})
    call s:Color('SpecialChar', {'fg': s:yellow})
    call s:Color('Tag', {'fg': s:white})
    call s:Color('Delimiter', {'fg': s:light_white})
    call s:Color('SpecialComment', {'fg': s:cyan})
    call s:Color('Debug', {'fg': s:red})
    call s:Color('Underlined', {'fg': s:green, 'gui': 'underline'})
    call s:Color('Ignore', {'fg': s:black})
    call s:Color('Error', {'fg': s:red, 'gui': 'bold'})
    call s:Color('Todo', {'fg': s:yellow, 'gui': 'bold,italic'})
    call s:Color('Conceal', {'bg': s:darker})

    call s:Color('htmlLink', {'fg': s:green, 'gui': 'underline'})
    call s:Color('htmlH1', {'fg': s:cyan, 'gui': 'bold'})
    call s:Color('htmlH2', {'fg': s:red, 'gui': 'bold'})
    call s:Color('htmlH3', {'fg': s:green, 'gui': 'bold'})
    call s:Color('htmlH4', {'fg': s:purple, 'gui': 'bold'})
    call s:Color('htmlH5', {'fg': s:blue, 'gui': 'bold'})
    call s:Color('markdownH1', {'fg': s:cyan, 'gui': 'bold'})
    call s:Color('markdownH2', {'fg': s:red, 'gui': 'bold'})
    call s:Color('markdownH3', {'fg': s:green, 'gui': 'bold'})
    call s:Color('markdownH1Delimiter', {'fg': s:cyan})
    call s:Color('markdownH2Delimiter', {'fg': s:red})
    call s:Color('markdownH3Delimiter', {'fg': s:green})
    call s:Color('Comment', {'fg': s:light_black, 'gui': 'italic'})
    call s:Color('Conditional', {'fg': s:light_white, 'gui': 'italic'})
    call s:Color('Function', {'fg': s:blue})
    call s:Color('Identifier', {'fg': s:white})
    call s:Color('Keyword', {'fg': s:blue})
    call s:Color('Repeat', {'fg': s:blue, 'gui': 'italic'})
    call s:Color('String', {'fg': s:green})

    " Editor Highlighting
    call s:Color('Normal', {'fg': s:foreground})
    call s:Color('NormalFloat', {'fg': s:foreground, 'bg': s:black})
    call s:Color('FloatBorder', {'fg': s:blue, 'bg': s:black})
    call s:Color('SignColumn', {'fg': s:white})
    call s:Color('ColorColumn', {'bg': s:black})
    call s:Color('Conceal', {'fg': s:black})
    call s:Color('Cursor', {'fg': s:white, 'gui': 'reverse'})
    call s:Color('CursorIM', {'fg': s:white, 'gui': 'reverse'})
    call s:Color('Directory', {'fg': s:light_cyan})
    call s:Color('EndOfBuffer', {'fg': s:black})
    call s:Color('ErrorMsg', {'fg': s:red})
    call s:Color('WarningMsg', {'fg': s:yellow})
    call s:Color('InfoMsg', {'fg': s:blue})
    call s:Color('HintMsg', {'fg': s:purple})
    call s:Color('Folded', {'fg': s:light_black, 'gui': 'italic'})
    call s:Color('FoldColumn', {'fg': s:light_cyan})
    call s:Color('IncSearch', {'fg': s:light_white, 'bg': s:blue})
    call s:Color('LineNr', {'fg': s:light_black})
    call s:Color('CursorLineNr', {'fg': s:white})
    call s:Color('MatchParen', {'fg': s:purple, 'gui': 'bold'})
    call s:Color('ModeMsg', {'fg': s:white})
    call s:Color('MoreMsg', {'fg': s:white})
    call s:Color('NonText', {'fg': s:black})
    call s:Color('Pmenu', {'fg': s:white, 'bg': s:black})
    call s:Color('PmenuSel', {'fg': s:darker, 'bg': s:blue})
    call s:Color('PmenuSbar', {'fg': s:white, 'bg': s:black})
    call s:Color('PmenuThumb', {'bg': s:white})
    call s:Color('Question', {'fg': s:green})
    call s:Color('QuickFixLine', {'fg': s:white, 'gui': 'reverse'})
    call s:Color('qfLineNr', {'fg': s:white, 'gui': 'reverse'})
    call s:Color('Search', {'fg': s:blue, 'bg': s:light_white, 'gui': 'reverse'})
    call s:Color('SpecialKey', {'fg': s:blue})
    call s:Color('SpellBad', {'fg': s:red, 'gui': 'italic,undercurl'})
    call s:Color('SpellCap', {'fg': s:light_cyan, 'gui': 'italic,undercurl'})
    call s:Color('SpellLocal', {'fg': s:cyan, 'gui': 'italic,undercurl'})
    call s:Color('SpellRare', {'fg': s:blue, 'gui': 'italic,undercurl'})
    call s:Color('StatusLine', {'fg': s:white, 'bg': s:black})
    call s:Color('StatusLineNC', {'fg': s:white, 'bg': s:black})
    call s:Color('StatusLineTerm', {'fg': s:white, 'bg': s:black})
    call s:Color('StatusLineTermNC', {'fg': s:white, 'bg': s:black})
    call s:Color('TabLineFill', {'fg': s:white})
    call s:Color('TablineSel', {'fg': s:black, 'bg': s:blue})
    call s:Color('Tabline', {'fg': s:white, 'bg': s:black})
    call s:Color('Title', {'fg': s:green, 'gui': 'bold'})
    call s:Color('Visual', {'bg': s:darker})
    call s:Color('VisualNOS', {'bg': s:darker})
    call s:Color('WildMenu', {'fg': s:cyan, 'gui': 'bold'})
    call s:Color('CursorColumn', {'bg': s:darker})
    call s:Color('CursorLine', {'bg': s:darker})
    call s:Color('ToolbarLine', {'fg': s:white, 'bg': s:black})
    call s:Color('ToolbarButton', {'fg': s:white, 'gui': 'bold'})
    call s:Color('NormalMode', {'fg': s:white, 'gui': 'reverse'})
    call s:Color('InsertMode', {'fg': s:green, 'gui': 'reverse'})
    call s:Color('ReplacelMode', {'fg': s:red, 'gui': 'reverse'})
    call s:Color('VisualMode', {'fg': s:blue, 'gui': 'reverse'})
    call s:Color('CommandMode', {'fg': s:white, 'gui': 'reverse'})
    call s:Color('Warnings', {'fg': s:purple})
    call s:Color('WinSeparator', {'fg': s:light_black})

    call s:Color('healthError', {'fg': s:red})
    call s:Color('healthSuccess', {'fg': s:green})
    call s:Color('healthWarning', {'fg': s:purple})

    call s:Color('DiffAdd', {'fg': s:green, 'gui': 'reverse'})
    call s:Color('DiffChange', {'fg': s:yellow, 'gui': 'reverse'})
    call s:Color('DiffDelete', {'fg': s:red, 'gui': 'reverse'})
    call s:Color('DiffText', {'fg': s:purple, 'gui': 'reverse'})

    " Terminal Highlighting
    let g:terminal_color_0 = s:black
    let g:terminal_color_1 = s:red
    let g:terminal_color_2 = s:green
    let g:terminal_color_3 = s:yellow
    let g:terminal_color_4 = s:blue
    let g:terminal_color_5 = s:purple
    let g:terminal_color_6 = s:cyan
    let g:terminal_color_7 = s:white
    let g:terminal_color_8 = s:light_black
    let g:terminal_color_9 = s:light_red
    let g:terminal_color_10 = s:light_green
    let g:terminal_color_11 = s:light_yellow
    let g:terminal_color_12 = s:light_blue
    let g:terminal_color_13 = s:light_purple
    let g:terminal_color_14 = s:light_cyan
    let g:terminal_color_15 = s:light_white

    " Plugin Highlighting
    "" Treesitter
    hi link TSConstructor Constant
    hi link TSConstant Constant
    hi link TSFloat Float
    hi link TSNumber Number

    hi link TSAttribute Special
    hi link TSVariable Identifier
    hi link TSVariableBuiltin Identifier
    hi link TSBoolean Boolean
    hi link TSConstBuiltin Constant
    hi link TSConstMacro Constant
    hi link TSError Error
    hi link TSException Exception
    hi link TSFuncMacro Function
    hi link TSInclude Include
    hi link TSLabel Label
    hi link TSOperator Operator
    hi link TSParameter Identifier
    hi link TSParameterReference Identifier
    hi link TSPunctDelimiter Delimiter
    hi link TSPunctBracket Delimiter
    hi link TSPunctSpecial Delimiter
    hi link TSSymbol Special
    hi link TSType Type
    hi link TSTypeBuiltin Type
    hi link TSTag Special
    hi link TSTagDelimiter Special
    hi link TSText String
    hi link TSTextReference Special
    hi link TSEmphasis Special
    hi link TSUnderline Underlined
    hi link TSTitle Title
    hi link TSLiteral String
    hi link TSURI Underlined
    hi link TSAnnotation PreProc
    hi link TSComment Comment
    hi link TSConditional Keyword
    hi link TSFunction Function
    hi link TSMethod Function
    hi link TSFuncBuiltin Function
    hi link TSNamespace Identifier
    hi link TSField Identifier
    hi link TSProperty Identifier
    hi link TSKeyword Keyword
    hi link TSKeywordFunction Keyword
    hi link TSKeywordReturn Keyword
    hi link TSKeywordOperator Keyword
    hi link TSRepeat Keyword
    hi link TSString String
    hi link TSStringRegex String
    hi link TSStringEscape SpecialChar
    hi link TSCharacter Character

    "' Diagnostic
    hi link DiagnosticError ErrorMsg
    hi link DiagnosticSignError ErrorMsg
    hi link DiagnosticFloatingError ErrorMsg
    hi link DiagnosticVirtualTextError ErrorMsg
    hi link DiagnosticUnderlineError ErrorMsg

    hi link DiagnosticWarn WarningMsg
    hi link DiagnosticSignWarn WarningMsg
    hi link DiagnosticFloatingWarn WarningMsg
    hi link DiagnosticVirtualTextWarn WarningMsg
    hi link DiagnosticUnderlineWarn WarningMsg

    hi link DiagnosticInfo InfoMsg
    hi link DiagnosticSignInfo InfoMsg
    hi link DiagnosticFloatingInfo InfoMsg
    hi link DiagnosticVirtualTextInfo InfoMsg
    hi link DiagnosticUnderlineInfo InfoMsg

    hi link DiagnosticHint HintMsg
    hi link DiagnosticSignHint HintMsg
    hi link DiagnosticFloatingHint HintMsg
    hi link DiagnosticVirtualTextHint HintMsg
    hi link DiagnosticUnderlineHint HintMsg

    "" LSP
    call s:Color('LspTroubleNormal', {'fg': s:light_purple})
    call s:Color('LspTroubleText', {'fg': s:light_red})
    call s:Color('LspTroubleCount', {'fg': s:red})

    call s:Color('LspReferenceText', {'fg': s:white, 'gui': 'bold'})
    call s:Color('LspReferenceRead', {'fg': s:white, 'gui': 'bold'})
    call s:Color('LspReferenceWrite', {'fg': s:white, 'gui': 'bold'})

    hi link LspDiagnosticsDefaultError Error
    hi link LspDiagnosticsSignError DiagnosticSignError
    hi link LspDiagnosticsFloatingError DiagnosticFloatingError
    hi link LspDiagnosticsVirtualTextError DiagnosticVirtualTextError
    hi link LspDiagnosticsUnderlineError DiagnosticUnderlineError

    hi link LspDiagnosticsDefaultWarning DiagnosticWarn
    hi link LspDiagnosticsSignWarning DiagnosticSignWarn
    hi link LspDiagnosticsFloatingWarning DiagnosticFloatingWarn
    hi link LspDiagnosticsVirtualTextWarning DiagnosticVirtualTextWarn
    hi link LspDiagnosticsUnderlineWarning DiagnosticUnderlineWarn

    hi link LspDiagnosticsDefaultInformation DiagnosticInfo
    hi link LspDiagnosticsSignInformation DiagnosticSignInfo
    hi link LspDiagnosticsFloatingInformation DiagnosticFloatingInfo
    hi link LspDiagnosticsVirtualTextInformation DiagnosticVirtualTextInfo
    hi link LspDiagnosticsUnderlineInformation DiagnosticUnderlineInfo

    hi link LspDiagnosticsDefaultHint DiagnosticHint
    hi link LspDiagnosticsSignHint DiagnosticSignHint
    hi link LspDiagnosticsFloatingHint DiagnosticFloatingHint
    hi link LspDiagnosticsVirtualTextHint DiagnosticVirtualTextHint
    hi link LspDiagnosticsUnderlineHint DiagnosticUnderlineHint

    "" Diff
    call s:Color('diffAdded', {'fg': s:green})
    call s:Color('diffRemoved', {'fg': s:red})
    call s:Color('diffChanged', {'fg': s:purple})
    call s:Color('diffOldFile', {'fg': s:yellow})
    call s:Color('diffNewFile', {'fg': s:cyan})
    call s:Color('diffFile', {'fg': s:light_cyan})
    call s:Color('diffLine', {'fg': s:light_black})
    call s:Color('diffIndexLine', {'fg': s:blue})

    "" Gitgutter
    call s:Color('GitGutterAdd', {'fg': s:light_green})
    call s:Color('GitGutterChange', {'fg': s:light_purple})
    call s:Color('GitGutterDelete', {'fg': s:light_red})

    "" Gitsigns
    call s:Color('GitSignsAdd', {'fg': s:light_green})
    call s:Color('GitSignsAddNr', {'fg': s:light_green})
    call s:Color('GitSignsAddLn', {'fg': s:light_green})
    call s:Color('GitSignsChange', {'fg': s:light_purple})
    call s:Color('GitSignsChangeNr', {'fg': s:light_purple})
    call s:Color('GitSignsChangeLn', {'fg': s:light_purple})
    call s:Color('GitSignsDelete', {'fg': s:light_red})
    call s:Color('GitSignsDeleteNr', {'fg': s:light_red})
    call s:Color('GitSignsDeleteLn', {'fg': s:light_red})
    call s:Color('GitSignsCurrentLineBlame', {'fg': s:light_black, 'gui': 'bold'})

    "" Telescope
    call s:Color('TelescopePromptBorder', {'fg': s:blue})
    call s:Color('TelescopeResultsBorder', {'fg': s:blue})
    call s:Color('TelescopePreviewBorder', {'fg': s:light_green})
    call s:Color('TelescopeSelectionCaret', {'fg': s:blue})
    call s:Color('TelescopeSelection', {'fg': s:blue})
    call s:Color('TelescopeMatching', {'fg': s:blue})

    "" Which-key
    call s:Color('WhichKey', {'fg': s:white, 'gui': 'bold'})
    call s:Color('WhichKeyGroup', {'fg': s:white})
    call s:Color('WhichKeyDesc', {'fg': s:light_cyan, 'gui': 'italic'})
    call s:Color('WhichKeySeperator', {'fg': s:white})
    call s:Color('WhichKeyFloating', {'bg': s:black})
    call s:Color('WhichKeyFloat', {'bg': s:black})

    "" Cmp
    call s:Color('CmpPmenu', {'fg': s:foreground, 'bg': s:background})
    call s:Color('CmpPmenuBorder', {'fg': s:light_black})
    call s:Color('CmpItemKind', {'fg': s:blue})
    call s:Color('CmpItemAbbrMatch', {'fg': s:white, 'gui': 'bold'})
    call s:Color('CmpItemAbbrMatchFuzzy', {'fg': s:light_white, 'gui': 'bold'})
    call s:Color('CmpItemAbbr', {'fg': s:white})
    call s:Color('CmpItemMenu', {'fg': s:light_purple})

    "" Copilot
    call s:Color('CopilotLabel', {'fg': s:light_black})
    call s:Color('CmpItemKindCopilot', {'fg': s:blue})

    "" Indent Blankline
    call s:Color('IndentBlanklineChar', {'fg': s:light_black})
    call s:Color('IndentBlanklineContextChar', {'fg': s:light_black})

    "" Neotree
    call s:Color('NeoTreeNormal', {'fg': s:white})
    call s:Color('NeoTreeFileName', {'fg': s:foreground})
    call s:Color('NeoTreeDotfile', {'fg': s:light_black})
    call s:Color('NeoTreeCursorLine', {'fg': s:foreground})
    call s:Color('NeoTreeDirectoryName', {'fg': s:light_cyan})
    call s:Color('NeoTreeDirectoryIcon', {'fg': s:light_cyan})
    call s:Color('NeoTreeGitModified', {'fg': s:light_blue})
    call s:Color('NeoTreeGitUntracked', {'fg': s:light_yellow})
    call s:Color('NeoTreeGitDeleted', {'fg': s:light_red})
    call s:Color('NeoTreeGitRenamed', {'fg': s:light_purple})
    call s:Color('NeoTreeIndentMarker', {'fg': s:light_black})
    call s:Color('NeoTreeExpander', {'fg': s:light_black})
    call s:Color('NeoTreeFileIcon', {'fg': s:blue})

    "" Bufferline
    call s:Color('BufferLineFill', {'bg': s:darker})
    call s:Color('BufferLineSeparator', {'fg': s:light_black})
    call s:Color('BufferLineIndicatorSelected', {'fg': s:blue})
    call s:Color('BufferLineCloseButton', {'fg': s:white, 'bg': s:black})
    call s:Color('BufferLineCloseButtonVisible', {'fg': s:white, 'bg': s:light_black})
    call s:Color('BufferLineCloseButtonSelected', {'fg': s:red})
    call s:Color('BufferLineBackground', {'fg': s:white, 'bg': s:black})
    call s:Color('BufferLineBufferVisible', {'fg': s:white, 'bg': s:light_black})
    call s:Color('BufferLineDuplicate', {'fg': s:white, 'bg': s:black})
    call s:Color('BufferLineDuplicateVisible', {'fg': s:white, 'bg': s:light_black})
    call s:Color('BufferLineDuplicateSelected', {'fg': s:white, 'bg': s:background})
    call s:Color('BufferLineTabSeparator', {'fg': s:black, 'bg': s:background})
    call s:Color('BufferLineTabSeparatorSelected', {'fg': s:blue, 'bg': s:background})

    "" Lualine
    call s:Color('LuaLineNormalA', {'fg': s:background, 'bg': s:blue, 'gui': 'bold'})
    call s:Color('LuaLineNormalB', {'fg': s:foreground, 'bg': s:black})
    call s:Color('LuaLineNormalC', {'fg': s:foreground, 'bg': s:background})
    call s:Color('LuaLineInsertA', {'fg': s:background, 'bg': s:green, 'gui': 'bold'})
    call s:Color('LuaLineVisualA', {'fg': s:background, 'bg': s:purple, 'gui': 'bold'})
    call s:Color('LuaLineReplaceA', {'fg': s:background, 'bg': s:yellow, 'gui': 'bold'})

    "" Telescope
    call s:Color('TelescopeNormal', {'fg': s:foreground, 'bg': s:background})
    call s:Color('TelescopeMatching', {'fg': s:purple})
    call s:Color('TelescopeBorder', {'fg': s:blue, 'bg': s:background})
    call s:Color('TelescopePromptBorder', {'fg': s:blue, 'bg': s:background})
    call s:Color('TelescopePreviewBorder', {'fg': s:blue, 'bg': s:background})
    call s:Color('TelescopeResultsBorder', {'fg': s:blue, 'bg': s:background})
  '';
}
