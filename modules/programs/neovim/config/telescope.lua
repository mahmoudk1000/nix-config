require("telescope").setup({
  defaults = {
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    color_devicons = true,
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8
      },
      vertical = {
        mirror = false
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120
    },
    border = {},
    borderchars = {
      prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
      results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
      preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
    },
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false
      }
    }
  }
})
