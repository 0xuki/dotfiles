return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function()
        require("noice").setup({
            cmdline = {
            view = "cmdline_popup",
            opts = {
              position = {
                row = 10,
                col = "50%"  -- 中央に配置
              },
              size = {
                width = "50%",
                height = 1
              },
              relative = "editor"
            }
            },
        })
    end,
}
