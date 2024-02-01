local C = require("catppuccin.palettes").get_palette()
require('gitsigns').setup()

local colors = {
  red = C.red,
  grey = C.surface0,
  black = C.mantle,
  white = C.text,
  light_green = C.green,
  orange = C.peach,
  green = C.spring_green,
}

local theme = {
  normal = {
    a = { fg = "#2d303e", bg = C.lavender },
    b = { fg = "#d8dee9", bg = "#373844" },
    c = { fg = "#d8dee9", bg = "#2d303e" },
    y = { fg = "#2d303e", bg = C.rosewater },
    z = { fg = "#d8dee9", bg = C.red },
  },
  insert = {
    a = { fg = "#2d303e", bg = C.blue },
    b = { fg = "#d8dee9", bg = "#373844" },
    c = { fg = "#d8dee9", bg = "#2d303e" },
    y = { fg = "#2d303e", bg = C.rosewater },
    z = { fg = "#d8dee9", bg = C.red },
  },
  visual = {
    a = { fg = "#2d303e", bg = C.red },
    b = { fg = "#d8dee9", bg = "#373844" },
    c = { fg = "#d8dee9", bg = "#2d303e" },
    y = { fg = "#2d303e", bg = C.rosewater },
    z = { fg = "#d8dee9", bg = C.red },
  },
  replace = {
    a = { fg = "#2d303e", bg = C.red },
    b = { fg = "#d8dee9", bg = "#373844" },
    c = { fg = "#d8dee9", bg = "#2d303e" },
    y = { fg = "#2d303e", bg = C.rosewater },
    z = { fg = "#d8dee9", bg = C.red },
  },
  command = {
    a = { fg = "#2d303e", bg = C.teal },
    b = { fg = "#d8dee9", bg = "#373844" },
    c = { fg = "#d8dee9", bg = "#2d303e" },
    y = { fg = "#2d303e", bg = C.rosewater },
    z = { fg = "#d8dee9", bg = C.red },
  },
}

local empty = require('lualine.component'):extend()
function empty:draw(default_highlight)
  self.status = ''
  self.applied_separator = ''
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
end

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < 'x'
    for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
      table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = "#2d303e" } })
    end
    for id, comp in ipairs(section) do
      if type(comp) ~= 'table' then
        comp = { comp }
        section[id] = comp
      end
      comp.separator = left and { right = "" } or { left = '' }
    end
  end
  return sections
end

local function search_result()
  if vim.v.hlsearch == 0 then
    return ''
  end
  local last_search = vim.fn.getreg('/')
  if not last_search or last_search == '' then
    return ''
  end
  local searchcount = vim.fn.searchcount { maxcount = 9999 }
  return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
end

local function modified()
  if vim.bo.modified then
    return '+'
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return '-'
  end
  return ''
end

local function mode_icon()
  return ''
end

local function mode_info()
  local icon = mode_icon()
  local mode_name = require('lualine.utils.mode').get_mode()
  return icon .. ' ' .. mode_name
end


local function file_icon()
  local filename = vim.fn.expand('%:t')
  local extension = vim.fn.expand('%:e')
  local icon, icon_color = require('nvim-web-devicons').get_icon_color(filename, extension)
  if icon == nil then
    icon = "󰈙"
    icon_color = '#d8dee9'
  end
  return icon .. ' ' .. filename
end


local function github_branch()
  local icon = ''
  local branch_name = vim.fn.system("git branch --show-current 2> /dev/null"):gsub("\n", "")
  if branch_name == "" then
    branch_name = "No branch"
  end
  return icon .. ' ' .. branch_name
end



-- local function custom_diff()
--   local gitsigns = vim.b.gitsigns_status_dict
--   if not gitsigns then return '' end
--
--   local added, modified, removed = gitsigns.added or 0, gitsigns.changed or 0, gitsigns.removed or 0
--   return string.format(
--     ' %d  %d  %d',
--     added, modified, removed
--   )
-- end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = '',
    section_separators = { left = '', right = '' },
  },
  sections = process_sections {
    lualine_a = { mode_info },
    lualine_b = { file_icon },
    lualine_c = {
      github_branch,
      "diff",
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'error' },
        diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
      },
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'warn' },
        diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
      },
      { modified, color = { bg = colors.red } },
      {
        '%w',
        cond = function()
          return vim.wo.previewwindow
        end,
      },
      {
        '%r',
        cond = function()
          return vim.bo.readonly
        end,
      },
      {
        '%q',
        cond = function()
          return vim.bo.buftype == 'quickfix'
        end,
      },
    },
    lualine_x = { "encoding" },
    lualine_y = { search_result, 'filetype' },
    lualine_z = { '%l:%c', '%p%%/%L' },
  },
  inactive_sections = {
    lualine_b = { '%f %y %m' },
    lualine_x = {},
  },
}
