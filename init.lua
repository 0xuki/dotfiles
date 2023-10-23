-- プラグインの読み込み
require'plugins'()

-- 補完の設定
require'completion'

-- nvim-treeの設定
require'nvimtree'

-- keymap
vim.g.mapleader = " "
require'mappings'

require'settings'

require'lualine_config'
