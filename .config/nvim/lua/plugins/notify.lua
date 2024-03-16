return {
  'rcarriga/nvim-notify',
  opts = { timeout = 5000 },
  config = function()
    vim.notify = require("notify")
    require("notify").setup({
      background_colour = "#282c34"
    })
  end,
}