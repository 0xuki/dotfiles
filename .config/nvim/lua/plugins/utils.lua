return {
	-- Git Integration
	{ "tpope/vim-fugitive" },

	-- Markdown Preview
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	-- GitHub Copilot
	{ "github/copilot.vim", lazy = false },

	-- Inc Rename(Rename Utility)
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
	},

	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require("Comment").setup({
				keys = {
					{ "gcc", mode = "n", desc = "Comment toggle current line" },
					{ "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
					{ "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
					{ "gbc", mode = "n", desc = "Comment toggle current block" },
					{ "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
					{ "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
				},
			})
		end,
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = false },

	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			local status, autopairs = pcall(require, "nvim-autopairs")
			if not status then
				return
			end

			autopairs.setup({
				disable_filetype = { "TelescopePrompt", "vim" },
			})
		end,
	},

	-- Neocord
	-- { 'IogaMaster/neocord', event = "VeryLazy",
	--     config = {
	--         logo = 'https://raw.githubusercontent.com/IogaMaster/neovim/main/.github/assets/nixvim-dark.webp', -- Main image display (either "neovim" or "file")
	--     },
	-- },
}
