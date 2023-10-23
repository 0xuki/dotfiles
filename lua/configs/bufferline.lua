local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

require'bufferline'.setup{
    options = {
    buffer_close_icon= "",
    modified_icon = "●",
    -- バッファの番号を表示するかどうか "both", "none", "ordinal"
    numbers = "ordinal",

    -- クローズアイコンをクリックしたときのコマンド
    close_command = "bdelete! %d",

    -- 右クリックしたときのコマンド
    right_mouse_command = "bdelete! %d",

    -- 左クリックしたときのコマンド
    left_mouse_command = "buffer %d",

    -- 中央クリックしたときのコマンド
    middle_mouse_command = nil,

    -- タブのセパレータースタイル "slant","thick","thin".....
    separator_style = "thick",

    -- LSPプロバイダからの診断を表示するか "nvim_lsp", "coc"....
    diagnostics = "nvim_lsp",

    -- 診断の表示方法カスタマイズ
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
    return "("..count..")"
    end,

    -- バッファが1つしかない場合もバッファラインを表示するか
    always_show_bufferline = true,

    -- 各バッファにクローズアイコンを表示するか
    show_buffer_close_icons = true,

    -- バッファラインの右端にクローズアイコンを表示するか
    show_close_icon = true,

    -- アイコンの色を有効にするか
    color_icons = true,

    -- バッファのソート方法 "extension", "directory"
    sort_by = "extension"
},
}
