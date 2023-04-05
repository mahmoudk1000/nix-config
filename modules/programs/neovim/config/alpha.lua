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
    -- val = {
    --  [[           ▄ ▄                   ]],
    --  [[       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ]],
    --  [[       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ]],
    --  [[    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ]],
    --  [[  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ]],
    --  [[  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄]],
    --  [[▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █]],
    --  [[█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █]],
    --  [[    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ]],
    -- },
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
        dashboard.button("n f", "  New File", ":ene <BAR> startinsert<CR>"),
        dashboard.button("f f", "  Find File", ":Telescope find_files<CR>"),
        dashboard.button("b k", "  Bookmarks", ":Telescope marks<CR>"),
        dashboard.button("q q", "ﮊ  Quit Nvim", ":qa<CR>"),
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
