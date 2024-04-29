local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

map("n", "<leader>rn", ":IncRename ")

map("i","jj", "<Esc>")

map("n", "<leader>a", "ggVG")
map('n', '<leader>e', ":NvimTreeToggle<CR>")
map('n', '<leader>o', ":NvimTreeFocus<CR>")
-- buffer line
--map("n", "<Tab>", "<CMD>BufferLineCycleNext<CR>")
--map("n", "<S-Tab>", "<CMD>BufferLineCyclePrev<CR>")
-- lightline-bufferline
map("n", "<Tab>", ":bnext<CR>")

map("n", "<S-Tab>", ":bprev<CR>")
-- indent manager
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
-- indent
map('v', '<Tab>', '>gv')        -- right
map('v', '<S-Tab>', '<gv')      -- left

vim.opt.guicursor = ""


-- find
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>fv", "<cmd>Telescope buffers<CR>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>")
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>")
-- git
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>")
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>")
-- pick hidden term
map("n", "<leader>pt", "<cmd>Telescope terms<CR>")
-- theme switcher
map("n", "<leader>th", "<cmd>Telescope themes<CR>")
-- 
map("n", "<leader>ma", "<cmd>Telescope marks<CR>")
-- file browser
map("n", "<leader>fb", "<cmd>Telescope file_browser<CR>", { noremap = true } )

-- nvterm
-- toggle in terminal mode
map("t", "<A-i>", function() require("nvterm.terminal").toggle("float") end)
map("t", "<A-h>", function() require("nvterm.terminal").toggle("horizontal") end)
map("t", "<A-v>", function() require("nvterm.terminal").toggle("vertical") end)
-- toggle in normal mode
map("n", "<A-i>", function() require("nvterm.terminal").toggle("float") end)
map("n", "<A-h>", function() require("nvterm.terminal").toggle("horizontal") end)
map("n", "<A-v>", function() require("nvterm.terminal").toggle("vertical") end)
map("n", "<leader>h", function() require("nvterm.terminal").toggle("horizontal") end)
map("n", "<leader>v", function() require("nvterm.terminal").toggle("vertical") end)

