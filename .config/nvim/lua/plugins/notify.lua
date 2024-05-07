return {
  'rcarriga/nvim-notify',
  opts = { timeout = 3000 },
  config = function()
    vim.notify = require("notify")
    require("notify").setup({
      background_colour = "#EFF1F5"
    })
  end,
}
