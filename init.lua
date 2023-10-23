-- Packerの設定
require'packer'.startup(function()
    use 'wbthomason/packer.nvim'
    use 'kyazdani42/nvim-tree.lua'
    use 'hoob3rt/lualine.nvim'
    use 'npxbr/gruvbox.nvim'
    use 'hrsh7th/nvim-compe'
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
    use 'tpope/vim-fugitive'
    -- Pluginsを追加
    end
)
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})