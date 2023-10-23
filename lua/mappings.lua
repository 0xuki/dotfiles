local set_keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

return {}