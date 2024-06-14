return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function()
        -- local colors = {
        --   red = "#FF0000",
        --   blue = "#0000FF",
        --   green = "#00FF00",
        --   background = "#1e1e1e",
        --   foreground = "#c0c0c0",
        -- }
        --
        -- vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { bg = colors.background, fg = colors.foreground })
        -- vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { bg = colors.background, fg = colors.foreground })

        require("noice").setup({
          views = {
            -- コマンドラインポップアップの設定
            cmdline_popup = {
              border = {
                -- style = "none",  -- ボーダースタイルをなしに設定
                -- padding = { 1, 2 },  -- ボーダーの内側のパディングを設定
              },
              filter_options = {},  -- フィルターオプションの設定
              win_options = {
                winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",  -- ウィンドウのハイライト設定
              },
              position = {
                row = "42%",  -- 垂直位置を画面の42%に設定
                col = "50%",  -- 水平位置を画面の50%に設定（中央）
              },
              size = {
                width = 60,  -- 幅を60に設定
                height = "auto",  -- 高さを自動に設定
              },
            },
            -- ポップアップメニューの設定
            popupmenu = {
              relative = "editor",  -- エディタに対して相対的に配置
              position = {
                row = "58%",  -- 垂直位置を画面の58%に設定
                col = "50%",  -- 水平位置を画面の50%に設定（中央）
              },
              size = {
                width = 60,  -- 幅を60に設定
                height = 10,  -- 高さを10に設定
              },
              border = {
                padding = { 0, 1 },  -- ボーダーの内側のパディングを設定
              },
              win_options = {
                winhighlight = { Normal = "NormalFloat", FloatBorder = "FloatBorder" },  -- ウィンドウのハイライト設定
              },
            },
            -- Confirm ウィンドウの設定
            confirm = {
              relative = "editor",  -- エディタに対して相対的に配置
              position = {
                row = "88%",  -- 垂直位置を画面の88%に設定
                col = "50%",  -- 水平位置を画面の50%に設定（中央）
              },
              size = {
                width = 60,  -- 幅を60に設定
                height = 10,  -- 高さを10に設定
              },
              border = {
                padding = { 0, 1 },  -- ボーダーの内側のパディングを設定
              },
              win_options = {
                winhighlight = { Normal = "NormalFloat", FloatBorder = "FloatBorder" },  -- ウィンドウのハイライト設定
              },
            },
          },
          presets = {
            bottom_search = false,        -- 検索のためのクラシックなボトムコマンドラインを使用
            command_palette = true,       -- コマンドラインとポップアップメニューを一緒に配置
            long_message_to_split = true, -- 長いメッセージをスプリットに送る
            inc_rename = false,           -- inc-rename.nvim の入力ダイアログを有効にする
            lsp_doc_border = true,        -- ホバードキュメントとシグネチャヘルプにボーダーを追加
          },

        })
    end,
}

