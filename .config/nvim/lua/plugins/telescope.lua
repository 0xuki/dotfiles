return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        requires = { {'nvim-lua/plenary.nvim'} },
        config = function()
            local actions = require("telescope.actions")

            require('telescope').setup {
              defaults = {
                prompt_prefix = '   ',
                selection_caret = '  ',
                initial_mode = 'normal',
                selection_strategy = 'reset',
                sorting_strategy = 'ascending',
                layout_strategy = 'horizontal',
                layout_config = {
                  horizontal = {
                    prompt_position = 'top',
                    preview_width = 0.55,
                    results_width = 0.8,
                  },
                  vertical = {
                    mirror = false,
                  },
                  width = 0.87,
                  height = 0.80,
                  preview_cutoff = 120,
                },
                path_display = { 'truncate' },
                winblend = 0,
                border = {},
                orderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                color_devicons = true,
                set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
                -- Keymaps
                mappings = {
                  i = {
                    ["qq"] = actions.close,
                  },
                  n = {
                    ["q"] = actions.close,
                    ['d'] = require('telescope.actions').delete_buffer,
                  },
                },
              },
              extensions = {
                file_browser = {
                  grouped = true,
                  previewer = false,
                  initial_browser = "tree",
                  auto_depth = true,
                  depth = 1,
                },
              },
            }
            -- Theming
            -- local colors = require('catppuccin.palettes').get_palette()
            -- local TelescopeColor = {
            --   TelescopeMatching = { fg = colors.flamingo },
            --   TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },
            --   TelescopePromptPrefix = { fg = colors.red },
            --   TelescopePromptNormal = { bg = colors.surface0 },
            --   TelescopeResultsNormal = { bg = colors.mantle },
            --   TelescopePreviewNormal = { bg = colors.mantle },
            --   TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
            --   TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
            --   TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
            --   TelescopePromptTitle = { bg = colors.red, fg = colors.mantle },
            --   TelescopeResultsTitle = { fg = colors.mantle },
            --   TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
            -- }

            -- for hl, col in pairs(TelescopeColor) do
            --   vim.api.nvim_set_hl(0, hl, col)
            -- end
            require("telescope").load_extension "file_browser"
        end,
    },

    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
}

