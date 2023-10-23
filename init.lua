-- プラグインの読み込み
require'plugins'()
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

require'configs.colour_scheme'

require'colorizer'.setup()