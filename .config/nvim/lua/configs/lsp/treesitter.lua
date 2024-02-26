local treesitter = require'nvim-treesitter.configs'

treesitter.setup {
  ensure_installed = {
    "rust", 
    "typescript", 
    "tsx", 
    "javascript", 
    "css", 
    "c_sharp", 
    "lua", 
    "haskell", 
    "python", 
    "c", 
    "html", 
    "html", 
    "markdown", 
    "markdown_inline", 
    "scala", 
    "sql", 
    "vim", 
    "zig", 
    "nix", 
    "latex", 
    "json", 
    "go", 
    "elixir", 
    "dockerfile", 
    "cpp", 
    "astro",
  },

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


