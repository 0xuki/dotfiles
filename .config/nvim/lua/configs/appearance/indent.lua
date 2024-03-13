local hooks = require "ibl.hooks"

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "ScopeHighlight", { fg = "#95B4FF" })
    vim.api.nvim_set_hl(0, "IndentHighlight", { fg = "#c1caf4" })
end)

require("ibl").setup {
    scope = { highlight = { "ScopeHighlight" } },
    indent = { highlight = { "IndentHighlight" } }
}
