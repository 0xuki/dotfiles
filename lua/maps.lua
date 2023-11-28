local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

local status, telescope = pcall(require, "telescope.builtin")
if status then
	-- Telescope
	map("n", "<leader>ff", telescope.find_files)
	map("n", "<leader>fg", telescope.live_grep)
	map("n", "<leader>fb", telescope.buffers)
	map("n", "<leader>fh", telescope.help_tags)
	map("n", "<leader>fs", telescope.git_status)
	map("n", "<leader>fc", telescope.git_commits)
else
	print("Telescope not found")
end
-- "jj"でインサートモードからノーマルモードに戻る
map("i","jj", "<Esc>")
-- 全選択
map("n", "<leader>a", "ggVG")
-- NeoTree
--map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
--map("n", "<leader>o", "<CMD>Neotree focus<CR>")
map('n', '<leader>e', ":NvimTreeToggle<CR>")
map('n', '<leader>o', ":NvimTreeFocus<CR>")
-- buffer line
map("n", "<Tab>", "<CMD>BufferLineCycleNext<CR>")
map("n", "<S-Tab>", "<CMD>BufferLineCyclePrev<CR>")
-- インデントの動作設定
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
-- VisualModeのインデントの動作設定
map('v', '<Tab>', '>')        -- 選択範囲を右にシフト
map('v', '<S-Tab>', '<')      -- 選択範囲を左にシフト
-- クリップボードにコピー＆ペーストのキー設定
map("v", "<C-c>", '"+y')  -- Visual modeでCtrl+cを押すと外部のクリップボードにコピー
map("n", "<C-v>", '"+p')  -- Normal modeでCtrl+vを押すと外部のクリップボードからペースト
map("i", "<C-v>", '"+p')  -- Insert modeでCtrl+vを押すと外部のクリップボードからペースト
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
vim.opt.guicursor = ""

function open_zsh()
  vim.api.nvim_command('vsplit term://zsh')
end

vim.api.nvim_set_keymap('n', '<leader>z', ':lua open_zsh()<CR>', { noremap = true, silent = true })

-- rust-analyzer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- LSPのキーマッピング例
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- その他のキーマッピング...
end

require'lspconfig'.rust_analyzer.setup({ on_attach = on_attach })

