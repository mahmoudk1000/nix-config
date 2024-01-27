require("bufferline").setup({
    options = {
        offsets = {
            {
                filetype = "neo-tree",
                text = "󰉓  Files Explorer",
                text_align = "center"
            }
        },
	separator_style = "sloped",
        buffer_close_icon = "✘",
        modified_icon = "",
        close_icon = "✘",
        show_close_icon = true,
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 20,
        max_prefix_length = 13,
        tab_size = 20,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        show_buffer_close_icons = true,
        themable = true,
        color_icons = true,
        -- diagnostics = 'nvim_lsp',
        -- diagnostics_indicator = function(count, level)
        --     local icon = level:match("error") and "" or ""
        --     return " " .. icon .. " " .. count
        -- end
    }
})
