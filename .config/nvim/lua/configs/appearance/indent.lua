local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#c1caf4" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#c1caf4" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#c1caf4" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#c1caf4" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#c1caf4" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#c1caf4" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#c1caf4" })
end)

require("ibl").setup { indent = { highlight = highlight } }
