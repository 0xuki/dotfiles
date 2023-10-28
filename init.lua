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

-- プラグインの読み込み
require'configs.colour_scheme'
require'configs.transparent'
require'configs.alpha'
require'configs.bufferline'
require("neo-tree").setup({
    filesystem = {
        filtered_items = {
            visible = true,
        },
    },
})
-- 補完の設定
require'configs.completion'

-- keymap
vim.g.mapleader = " "
require'maps'

require'configs.transparent'

require'settings'

require'configs.lualine_config'

require'configs.colorizer'

require'configs.autotag'
