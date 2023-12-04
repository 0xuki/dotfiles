local custom_horizon = require'lualine.themes.horizon'

-- NORMAL mode setting
custom_horizon.normal.a.bg = '#5E81AC' -- 背景色
custom_horizon.normal.a.fg = '#ECEFF4' -- 文字色

-- INSERT mode setting
custom_horizon.insert.a.bg = '#88C0D0' -- 背景色
custom_horizon.insert.a.fg = '#272746' -- 文字色

-- COMMAND mode setting
custom_horizon.command.a.bg = '#81A1C1' -- 背景色
custom_horizon.command.a.fg = '#ECEFF4' -- 文字色

-- Git Branch
custom_horizon.normal.b.bg = '#3B4252' -- 背景色
custom_horizon.normal.b.fg = '#F43F5E' -- 文字色
custom_horizon.insert.b.bg = '#3B4252' -- 背景色
custom_horizon.insert.b.fg = '#F43F5E' -- 文字色
custom_horizon.visual.b.bg = '#3B4252' -- 背景色
custom_horizon.visual.b.fg = '#F43F5E' -- 文字色
custom_horizon.replace.b.bg = '#3B4252' -- 背景色
custom_horizon.replace.b.fg = '#F43F5E' -- 文字色
custom_horizon.command.b.bg = '#3B4252' -- 背景色
custom_horizon.command.b.fg = '#F43F5E' -- 文字色
custom_horizon.inactive.b.bg = '#3B4252' -- 背景色
custom_horizon.inactive.b.fg = '#F43F5E' -- 文字色

-- NORMALモードでのファイル名セクションの設定
custom_horizon.normal.c.bg = '#2E3440' -- 背景色
custom_horizon.normal.c.fg = '#D8DEE9' -- 文字色

-- INSERTモードでのファイル名セクションの設定
custom_horizon.insert.c.bg = '#2E3440' -- 背景色
custom_horizon.insert.c.fg = '#D8DEE9' -- 文字色

-- COMMANDモードでのファイル名セクションの設定
custom_horizon.command.c.bg = '#2E3440' -- 背景色
custom_horizon.command.c.fg = '#D8DEE9' -- 文字色

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = custom_horizon,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = false,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}
