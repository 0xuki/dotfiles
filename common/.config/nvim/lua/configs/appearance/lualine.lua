local clrs = require("catppuccin.palettes").get_palette()

local custom = require'lualine.themes.horizon'

-- NORMAL mode setting
custom.normal.a.bg = clrs.lavender -- 背景色
custom.normal.a.fg = clrs.crust -- 文字色

-- INSERT mode setting
custom.insert.a.bg = clrs.lavender -- 背景色
custom.insert.a.fg = clrs.crust -- 文字色

-- COMMAND mode setting
custom.command.a.bg = clrs.lavender -- 背景色
custom.command.a.fg = clrs.crust -- 文字色


-- V-LINE mode setting
custom.visual.a.bg = clrs.lavender -- 背景色
custom.visual.a.fg = clrs.crust -- 文字色

-- Git Branch
custom.normal.b.bg = clrs.rosewater -- 背景色
custom.normal.b.fg = clrs.crust -- 文字色
custom.insert.b.bg = clrs.rosewater -- 背景色
custom.insert.b.fg = clrs.crust -- 文字色
custom.visual.b.bg = clrs.rosewater -- 背景色
custom.visual.b.fg = clrs.crust -- 文字色
custom.replace.b.bg = clrs.rosewater -- 背景色
custom.replace.b.fg = clrs.crust -- 文字色
custom.command.b.bg = clrs.rosewater -- 背景色
custom.command.b.fg = clrs.crust -- 文字色
custom.inactive.b.bg = clrs.rosewater -- 背景色
custom.inactive.b.fg = clrs.crust -- 文字色

-- Setting the filename section in NORMAL mode
custom.normal.c = { bg = clrs.crust, fg = clrs.text }
-- Encoding, Fileformat, Filetype 設定
custom.normal.x = { bg = clrs.crust, fg = clrs.text } -- encodingセクション
-- Progress, Location
custom.normal.y = { bg = clrs.red, fg = clrs.crust } -- progressセクション
custom.normal.z = { bg = clrs.rosewater, fg = clrs.crust } -- locationセクション



-- Setting the filename section in INSERT mode
custom.insert.c = { bg = clrs.crust, fg = clrs.text }
-- Encoding, Fileformat, Filetype 設定
custom.insert.x = { bg = clrs.crust, fg = clrs.text } -- encodingセクション
-- Progress, Location
custom.insert.y = { bg = clrs.red, fg = clrs.crust } -- progressセクション
custom.insert.z = { bg = clrs.rosewater, fg = clrs.crust } -- locationセクション



-- Setting the filename section in COMMAND mode
custom.command.c = { bg = clrs.crust, fg = clrs.text }
-- Encoding, Fileformat, Filetype 設定
custom.command.x = { bg = clrs.crust, fg = clrs.text } -- encodingセクション
-- Progress, Location
custom.command.y = { bg = clrs.red, fg = clrs.crust } -- progressセクション
custom.command.z = { bg = clrs.rosewater, fg = clrs.crust } -- locationセクション



-- Setting the filename section in VISUAL mode
custom.visual.c = { bg = clrs.crust, fg = clrs.text }
-- Encoding, Fileformat, Filetype 設定
custom.visual.x = { bg = clrs.crust, fg = clrs.text } -- encodingセクション
-- Progress, Location
custom.visual.y = { bg = clrs.red, fg = clrs.crust } -- progressセクション
custom.visual.z = { bg = clrs.rosewater, fg = clrs.crust } -- locationセクション


require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = custom,
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
