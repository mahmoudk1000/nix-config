local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

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
local fn = vim.fn
local marginTopPercent = 0.3
local headerPadding = fn.max { 2, fn.floor(fn.winheight(0) * marginTopPercent) }

dashboard.section.buttons = {
    type = "group",
    val = {
        dashboard.button("n f", "  New File", ":ene <BAR> startinsert<CR>"),
        dashboard.button("f f", "  Find File", ":Telescope find_files<CR>"),
        dashboard.button("b k", "  Bookmarks", ":Telescope marks<CR>"),
        dashboard.button("q q", "  Quit Nvim", ":qa<CR>"),
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
alpha.setup(opts)

vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
