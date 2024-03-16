return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    config = function()
        local status, bufferline = pcall(require, "bufferline")
        if (not status) then return end

        require'bufferline'.setup{
            options = {
                indicator = { style = "none" },
                separator_style = { "", "" },
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "Explorer",
                        text_align = "center",
                    },
                },

                buffer_close_icon= "×",
                modified_icon = "●",
                -- close icon
                close_command = "bdelete! %d",

                -- right mouse command
                right_mouse_command = "bdelete! %d",

                -- left mouse command
                left_mouse_command = "buffer %d",

                -- middle mouse command
                middle_mouse_command = nil,

                -- LSP diagnostics
                diagnostics = "nvim_lsp",

                -- diagnostics indicator
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                return "("..count..")"
                end,
                -- close icon
                show_buffer_close_icons = true,

                -- close icon
                show_close_icon = true,

                always_show_bufferline = true,
            },
        }
    end,
}
