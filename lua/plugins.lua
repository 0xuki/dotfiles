return {
    {
        'MunifTanjim/nui.nvim'
    },
    --{'andweeb/presence.nvim'},
    {'hoob3rt/lualine.nvim'},
    {'hrsh7th/nvim-compe'},
    {'junegunn/fzf'},
    {'junegunn/fzf.vim'},
    {'tpope/vim-fugitive'},
    {'norcalli/nvim-colorizer.lua'},
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { {'nvim-lua/plenary.nvim'} }
    },
    --theme
    {
        'gbprod/nord.nvim'
    },
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{'npxbr/gruvbox.nvim'},
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {'folke/tokyonight.nvim'},
    {'rebelot/kanagawa.nvim'},
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
    --{'nvim-neo-tree/neo-tree.nvim'},
    {'nvim-tree/nvim-tree.lua'},
    {'nvim-lua/plenary.nvim'},
    {'nvim-tree/nvim-web-devicons'},
    {'MunifTanjim/nui.nvim'},
    -- Code Snippet
    {'onsails/lspkind-nvim'},
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
    {'goolord/alpha-nvim'},
    -- indent
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    -- rust-analyzer
	{
		'neovim/nvim-lspconfig',
		config = function()
		require('lspconfig').rust_analyzer.setup{}
		end
	},
    -- noice.nvim
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
        -- add any options here
        },
        dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
        }
    },
    -- nvim-notify
    { 
        'rcarriga/nvim-notify',
        opts = {
			timeout = 5000,
		},
    }
}
