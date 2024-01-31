vim.opt.fillchars = { eob = " " }
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
-- 行番号を表示
vim.wo.number = true

vim.o.showtabline = 2
vim.opt.sessionoptions = 'curdir,folds,globals,help,tabpages,terminal,winsize'
vim.opt.cursorline = true
vim.cmd [[highlight CursorLine guibg=#4C566A]]

-- WSL環境をチェックする関数
local function is_wsl()
  local output = vim.fn.systemlist("uname -r")
  return not not string.find(output[1] or "", "Microsoft")
end

-- クリップボード設定を適用する
if is_wsl() then
  -- WSLの場合のクリップボード設定
  vim.api.nvim_exec([[
  let g:clipboard = {
      \ 'name': 'WslClipboard',
      \ 'copy': {
      \   '+': 'clip.exe',
      \   '*': 'clip.exe',
      \ },
      \ 'paste': {
      \   '+': 'powershell.exe -c [Console] :: Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      \   '*': 'powershell.exe -c [Console] :: Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      \ },
  \ }
  ]], false)
else
  -- Windowsの場合のクリップボード設定（デフォルト設定を使用）
  vim.opt.clipboard = "unnamedplus"
end

return {}
