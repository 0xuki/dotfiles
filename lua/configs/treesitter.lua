local treesitter = require'nvim-treesitter.configs'

treesitter.setup {
  ensure_installed = {"rust", "typescript", "tsx", "c_sharp", "lua", "haskell"},

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}


