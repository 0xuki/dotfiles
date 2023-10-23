local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
options = {
    --mode = "tabs", -- タブモードでバッファを表示する
    separator_style = 'slant', -- セパレータのスタイルを設定
    always_show_bufferline = true, -- 常にバッファラインを表示するかどうか
    show_buffer_close_icons = true, -- バッファのクローズアイコンを表示するかどうか
    show_close_icon = true, -- クローズアイコンを表示するかどうか
    color_icons = true -- カラーアイコンを表示するかどうか
},
highlights = { -- ハイライトのカスタマイズ
    separator = {
        guifg = '#073642',
        guibg = '#002b36',
    },
    separator_selected = {
        guifg = '#073642',
    },
    background = {
        guifg = '#657b83',
        guibg = '#002b36'
    },
    buffer_selected = {
        guifg = '#fdf6e3',
        gui = "bold",
    },
    fill = {
        guibg = '#073642'
    }
},
})
