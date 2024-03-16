return {
    {
        "numToStr/Comment.nvim",
        lazy = false,
        config = function()
            require('Comment').setup({
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
    { 'JoosepAlviste/nvim-ts-context-commentstring', lazy = false },
}
