vim.g.rustfmt_autosave = 1
local M = {}

M.setup = function()
  require'lspconfig'.rust_analyzer.setup({
    on_attach = function(client, bufnr)
      -- キーバインド設定
    end,
    settings = {
      -- rust-analyzerの設定
      ["rust-analyzer"] = {
        -- 自動補完を有効にする
        completion = {
          autoimport = {
            enable = true
          },
        },
      }
    }
  })
end

return M

