vim.g.lightline = {
  colorscheme = 'catppuccin',
  active = {
    left = { { 'mode', 'paste' }, { 'readonly', 'relativepath', 'modified' } }
  }
  tabline = {
    left = { { 'buffers' } },
    right = { { 'close' } }
  },
  component_expand = {
    buffers = 'lightline#bufferline#buffers'
  },
  component_type = {
    buffers = 'tabsel'
  },
  separator = { left = '', right = '' },
  subseparator = { left = '', right = '' },
  component = {
    lineinfo = ' %3l:%-2v'
  }
}
