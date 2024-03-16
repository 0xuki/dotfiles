return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
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
        },
    },
    config = function()
        local status, bufferline = pcall(require, "bufferline")
        if (not status) then return end

        require'bufferline'.setup{
            options = {
                buffer_close_icon= "×",
                modified_icon = "●",
                -- クローズアイコンをクリックしたときのコマンド
                close_command = "bdelete! %d",

                -- 右クリックしたときのコマンド
                right_mouse_command = "bdelete! %d",

                -- 左クリックしたときのコマンド
                left_mouse_command = "buffer %d",

                -- 中央クリックしたときのコマンド
                middle_mouse_command = nil,

                -- LSPプロバイダからの診断を表示するか "nvim_lsp", "coc"....
                diagnostics = "nvim_lsp",

                -- 診断の表示方法カスタマイズ
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                return "("..count..")"
                end,
                -- 各バッファにクローズアイコンを表示するか
                show_buffer_close_icons = true,

                -- バッファラインの右端にクローズアイコンを表示するか
                show_close_icon = true,

                always_show_bufferline = true,
            },
        }
    end,
}
