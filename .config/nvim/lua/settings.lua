vim.opt.fillchars = { eob = " " }
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.wo.number = true

vim.o.showtabline = 2

vim.o.laststatus = 3

vim.opt.cursorline = true
vim.cmd([[highlight CursorLine guibg=#eff1f5]])

vim.o.undofile = true
vim.o.termguicolors = true

vim.g.rustfmt_autosave = 1

local function is_wsl()
	local output = vim.fn.systemlist("uname -r")
	return not not string.find(output[1] or "", "Microsoft")
end


if is_wsl() then
	vim.api.nvim_exec(
		[[
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
  ]],
		false
	)
else	
	vim.opt.clipboard = "unnamedplus"
end

return {}
