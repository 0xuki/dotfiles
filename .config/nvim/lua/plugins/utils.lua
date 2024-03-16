return {
        -- UI Enhancements
        { 'MunifTanjim/nui.nvim' },

        -- Git Integration
        { 'tpope/vim-fugitive' },

        -- Markdown Preview
        {
            "iamcco/markdown-preview.nvim",
            cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
            ft = { "markdown" },
            build = function() vim.fn["mkdp#util#install"]() end,
        },

        {
            "iamcco/markdown-preview.nvim",
            cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
            build = "cd app && yarn install",
            init = function() vim.g.mkdp_filetypes = { "markdown" } end,
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

        -- Neocord
        { 'IogaMaster/neocord', event = "VeryLazy",
            config = {
                logo = 'https://raw.githubusercontent.com/IogaMaster/neovim/main/.github/assets/nixvim-dark.webp', -- Main image display (either "neovim" or "file")
            },
        },
}