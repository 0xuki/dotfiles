return {
    {
        'MunifTanjim/nui.nvim'
    },
    {'hoob3rt/lualine.nvim'},
    {'npxbr/gruvbox.nvim'},
    {'hrsh7th/nvim-compe'},
    {'junegunn/fzf'},
    {'junegunn/fzf.vim'},
    {'tpope/vim-fugitive'},
    {'norcalli/nvim-colorizer.lua'},
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { {'nvim-lua/plenary.nvim'} }
    },
    {'folke/tokyonight.nvim'},
    -- install without yarn or npm
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    -- install with yarn or npm
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    {'xiyaowong/transparent.nvim'},
    -- neo tree
    {'nvim-neo-tree/neo-tree.nvim'},
    {'nvim-lua/plenary.nvim'},
    {'nvim-tree/nvim-web-devicons'},
    {'MunifTanjim/nui.nvim'},
    -- Code Snippet
    {'onsails/lspkind-nvim'},
    {'L3MON4D3/LuaSnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/nvim-cmp'},
    {'nvim-treesitter/nvim-treesitter'},
    -- tag snippet
    {'windwp/nvim-ts-autotag'},
    {'windwp/nvim-autopairs'},
    -- bufferline
    {'akinsho/bufferline.nvim'},
    -- alpha-nvim
    {'goolord/alpha-nvim'}
}
