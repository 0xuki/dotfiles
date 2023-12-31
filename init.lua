local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
    lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

plugins = require('plugins')

require('lazy').setup(plugins)

require'configs.lightline'

require'configs.lsp'

-- tree-sitter
require'configs.treesitter'

-- theme
--require'configs.presence'
--require'configs.kanagawa'
--require'configs.solarized'
--require'configs.tokyonight'
require'configs.nord'

require'configs.transparent'
require'configs.alpha'
--require'configs.bufferline'

require'configs.nvim-tree'
require'configs.noice'
-- require("neo-tree").setup({
--     filesystem = {
--         filtered_items = {
--             visible = true,
--         },
--     },
-- })


-- keymap
vim.g.mapleader = " "
require'maps'

require'settings'

require'configs.lualine_config'

require'configs.colorizer'

require'configs.autotag'

