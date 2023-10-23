local custom_horizon = require'lualine.themes.horizon'
-- Git Branch
custom_horizon.normal.a.bg = '#F43F5E'
custom_horizon.normal.b.bg = '#27272d' -- 背景色
custom_horizon.normal.b.fg = '#FFFB38' -- 文字色
custom_horizon.insert.b.bg = '#27272d' -- 背景色
custom_horizon.insert.b.fg = '#FFFB38' -- 文字色
custom_horizon.visual.b.bg = '#27272d' -- 背景色
custom_horizon.visual.b.fg = '#FFFB38' -- 文字色
custom_horizon.replace.b.bg = '#27272d' -- 背景色
custom_horizon.replace.b.fg = '#FFFB38' -- 文字色
custom_horizon.command.b.bg = '#27272d' -- 背景色
custom_horizon.command.b.fg = '#FFFB38' -- 文字色
custom_horizon.inactive.b.bg = '#27272d' -- 背景色
custom_horizon.inactive.b.fg = '#FFFB38' -- 文字色

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
