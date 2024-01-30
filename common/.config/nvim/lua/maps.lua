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
map("i","jj", "<Esc>")

map("n", "<leader>a", "ggVG")
-- NeoTree
--map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
--map("n", "<leader>o", "<CMD>Neotree focus<CR>")
map('n', '<leader>e', ":NvimTreeToggle<CR>")
map('n', '<leader>o', ":NvimTreeFocus<CR>")
-- buffer line
--map("n", "<Tab>", "<CMD>BufferLineCycleNext<CR>")
--map("n", "<S-Tab>", "<CMD>BufferLineCyclePrev<CR>")
-- lightline-bufferline
map("n", "<Tab>", ":bnext<CR>")

map("n", "<S-Tab>", ":bprev<CR>")
-- indent manager
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
-- indent
map('v', '<Tab>', '>')        -- right
map('v', '<S-Tab>', '<')      -- left

vim.opt.guicursor = ""

function open_zsh()
  vim.api.nvim_command('vsplit term://zsh')
end

vim.api.nvim_set_keymap('n', '<leader>z', ':lua open_zsh()<CR>', { noremap = true, silent = true })
