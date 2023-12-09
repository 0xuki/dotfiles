local treesitter = require'nvim-treesitter.configs'

treesitter.setup {
  ensure_installed = {"rust", "typescript", "tsx", "c_sharp", "lua", "haskell"},

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = false
  },
  incremental_selection = {
    enable = false 
  },
  textobjects = {
    enable = true,
  },
  -- nvim-ts-autotag
  autotag = {
    enable = true,
  },
}


