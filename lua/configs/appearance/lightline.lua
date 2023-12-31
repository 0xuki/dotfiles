vim.cmd[[
let g:lightline#nord#disable_bold_style = 1
let g:lightline = {
\ 'colorscheme': 'nord',
\ 'active': {
\ 'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
\ },
\ 'tabline': {
\ 'left': [ ['buffers'] ],
\ 'right': [ ['close'] ]
\ },
\ 'component_expand': {
\ 'buffers': 'lightline#bufferline#buffers'
\ },
\ 'component_type': {
\ 'buffers': 'tabsel'
\ },
\ 'separator': { 'left': '', 'right': '' },
\ 'subseparator': { 'left': '', 'right': '' },
\ 'component': {
\ 'lineinfo': ' %3l:%-2v',
\ },
\ }
" }}}
]]
