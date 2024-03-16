return {
    {
        'windwp/nvim-ts-autotag',
        config = function()
            require('nvim-ts-autotag').setup()
        end,
    },
    {
        'windwp/nvim-autopairs',
        config = function()
            local status, autopairs = pcall(require, "nvim-autopairs")
            if not status then return end

            autopairs.setup({
                disable_filetype = { "TelescopePrompt", "vim" },
            })
        end,
    },
}
