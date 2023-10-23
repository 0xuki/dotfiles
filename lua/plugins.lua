return function()
    require'packer'.startup(function()
        use 'wbthomason/packer.nvim'
        use 'kyazdani42/nvim-tree.lua'
        use 'hoob3rt/lualine.nvim'
        use 'npxbr/gruvbox.nvim'
        use 'hrsh7th/nvim-compe'
        use 'junegunn/fzf'
        use 'junegunn/fzf.vim'
        use 'tpope/vim-fugitive'
        use 'hrsh7th/nvim-cmp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-nvim-lsp'
        use {
            'nvim-telescope/telescope.nvim', tag = '0.1.4',
            requires = { {'nvim-lua/plenary.nvim'} }
        }
    end)
end