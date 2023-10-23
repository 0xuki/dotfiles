return function()
    require'packer'.startup(function()
        use 'wbthomason/packer.nvim'
        use 'hoob3rt/lualine.nvim'
        use 'npxbr/gruvbox.nvim'
        use 'hrsh7th/nvim-compe'
        use 'junegunn/fzf'
        use 'junegunn/fzf.vim'
        use 'tpope/vim-fugitive'
        use {
            'nvim-telescope/telescope.nvim', tag = '0.1.4',
            requires = { {'nvim-lua/plenary.nvim'} }
        }
        use 'folke/tokyonight.nvim'
        use 'norcalli/nvim-colorizer.lua'
        use({
            "iamcco/markdown-preview.nvim", -- :MarkdownPreview
            run = function() vim.fn["mkdp#util#install"]() end,
        })
        use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
        use 'xiyaowong/transparent.nvim'
        use 'nvim-neo-tree/neo-tree.nvim'
        -- Code Snippet
        use 'onsails/lspkind-nvim'
        use 'L3MON4D3/LuaSnip'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/nvim-cmp'
        -- tag snippet
        use 'windwp/nvim-ts-autotag'
        use 'windwp/nvim-autopairs'
    end)
end