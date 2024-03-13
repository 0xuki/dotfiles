local actions = require("telescope.actions")

require('telescope').setup {
  defaults = {
    prompt_prefix = '   ',
    selection_caret = '  ',
    initial_mode = 'normal',
    selection_strategy = 'reset',
    sorting_strategy = 'ascending',
    layout_strategy = 'horizontal',
    layout_config = {
      horizontal = {
        prompt_position = 'top',
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    path_display = { 'truncate' },
    winblend = 0,
    border = {},
    orderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    -- Keymaps
    mappings = {
      i = {
        ["qq"] = actions.close,
      },
      n = {
        ["q"] = actions.close,
        ['d'] = require('telescope.actions').delete_buffer,
      },
    },
  },
  extensions = {
    file_browser = {
      grouped = true,
      previewer = false,
      initial_browser = "tree",
      -- searching activates a `telescope.find_files` like finder
      -- you can use this to enter directories and remove ( move, copy) files to
      -- selected dir (or selected dir of file) etc.
      auto_depth = true,
      depth = 1,
    },
  },
}

require("telescope").load_extension "file_browser"

-- Theming
local colors = require('catppuccin.palettes').get_palette()
local TelescopeColor = {
  TelescopeMatching = { fg = colors.flamingo },
  TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },
  TelescopePromptPrefix = { fg = colors.red },
  TelescopePromptNormal = { bg = colors.surface0 },
  TelescopeResultsNormal = { bg = colors.mantle },
  TelescopePreviewNormal = { bg = colors.mantle },
  TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
  TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
  TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
  TelescopePromptTitle = { bg = colors.red, fg = colors.mantle },
  TelescopeResultsTitle = { fg = colors.mantle },
  TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
}
