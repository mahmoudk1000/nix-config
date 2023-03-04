local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- ALPHA splash screen
-- Set header
dashboard.section.header = {
    type = "text",
    val = {
        [[ ┏━┓━┏┓┏┓━━┏┓┏━━┓┏━┓┏━┓ ]],
        [[ ┃┃┗┓┃┃┃┗┓┏┛┃┗┫┣┛┃┃┗┛┃┃ ]],
        [[ ┃┏┓┗┛┃┗┓┃┃┏┛━┃┃━┃┏┓┏┓┃ ]],
        [[ ┃┃┗┓┃┃━┃┗┛┃━━┃┃━┃┃┃┃┃┃ ]],
        [[ ┃┃━┃┃┃━┗┓┏┛━┏┫┣┓┃┃┃┃┃┃ ]],
        [[ ┗┛━┗━┛━━┗┛━━┗━━┛┗┛┗┛┗┛ ]],
        [[ ━━━━━━━━━━━━━━━━━━━━━━ ]],
        [[ ━━━━━━━━━━━━━━━━━━━━━━ ]],
    },
    opts = {
        position = "center",
        hl = "Type",
    },
}
-- dynamic header padding
local fn = vim.fn
local marginTopPercent = 0.3
local headerPadding = fn.max { 2, fn.floor(fn.winheight(0) * marginTopPercent) }

-- Set menu
dashboard.section.buttons = {
    type = "group",
    val = {
        dashboard.button("e", "new file", ":ene <BAR> startinsert<CR>"),
        dashboard.button("f", "find file", ":Telescope find_files<CR>"),
        dashboard.button("x", "nix", ":e ~/.config/nixpkgs/flake.nix<CR>"),
        dashboard.button("n", "nvim", ":e ~/.config/nvim/init.lua<CR>"),
        dashboard.button("q", "quit nvim", ":qa<CR>"),
    },
    opts = {
        position = "center",
        spacing = 1,
    },
}

local opts = {
    layout = {
    	{ type = "padding", val = headerPadding },
    	dashboard.section.header,
    	{ type = "padding", val = 2 },
    	dashboard.section.buttons,
    },
    opts = {
    	margin = 3,
        spacing = 1,
    },
}
-- Send config to alpha
alpha.setup(opts)

-- Disable folding on alpha buffer
vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
