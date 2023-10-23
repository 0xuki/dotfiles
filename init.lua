-- プラグインの読み込み
require'plugins'()

-- 補完の設定
require'completion'

-- keymap
vim.g.mapleader = " "
require'mappings'

require'settings'

require'lualine_config'