-- プラグインの読み込み
require'plugins'()

-- 補完の設定
require'configs.completion'

-- keymap
vim.g.mapleader = " "
require'maps'

require'settings'

require'configs.lualine_config'

require("neo-tree").setup({
    filesystem = {
        filtered_items = {
            visible = true,
        },
    },
})