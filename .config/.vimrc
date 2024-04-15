set encoding=utf-8
set nocompatible

const s:dpp_base = '~/.cache/dpp/'

const s:dpp_src = '~/.cache/dpp/repos/github.com/Shougo/dpp.vim'
const s:denops_src = '~/.cache/dpp/repos/github.com/vim-denops/denops.vim'

execute 'set runtimepath^=' .. s:dpp_src

execute 'set runtimepath^=' .. '~/.cache/dpp/repos/github.com/Shougo/dpp.vim'
execute 'set runtimepath^=' .. '~/.cache/dpp/repos/github.com/Shougo/dpp-protocol-git'
execute 'set runtimepath^=' .. '~/.cache/dpp/repos/github.com/Shougo/dpp-ext-installer'
execute 'set runtimepath^=' .. '~/.cache/dpp/repos/github.com/Shougo/dpp-ext-toml'
execute 'set runtimepath^=' .. '~/.cache/dpp/repos/github.com/Shougo/dpp-ext-lazy'


if s:dpp_base->dpp#min#load_state() 
  execute 'set runtimepath^=' .. s:denops_src

  autocmd User DenopsReady
  \ echo "denops ready"

  autocmd User DenopsReady
  \ call dpp#make_state(s:dpp_base, '~/.vim/dpp.ts')
endif

execute 'set runtimepath^=' .. s:denops_src

if has('syntax')
  syntax on
endif

filetype indent plugin on

command! DppInstall :call s:dpp_install('install')
command! DppUpdate :call s:dpp_install('update')
command! DppMakeState :call dpp#make_state(s:dpp_base, '~/.vim/dpp.ts')


function! s:dpp_install(cmd) abort
	if denops#server#status() == "running"
		call dpp#async_ext_action('installer', a:cmd)
	else
		echo "denops is not started"
	endif
endfunction












let g:ddc_config_dir = expand('~/.vim/')

call ddc#custom#load_config(g:ddc_config_dir . 'ddc.ts')

call ddc#enable()


let g:ddu_config_dir = expand('~/.vim/')

call ddu#custom#load_config(g:ddu_config_dir . 'ddu.ts')

call ddu#start({})





" call ddu#custom#patch_global({
" \   'ui': 'ff',
" \   'sources': [
" \     {
" \       'name': 'file_rec',
" \       'params': {
" \         'ignoredDirectories': ['.git', 'node_modules', 'vendor', '.next']
" \       }
" \     }
" \   ],
" \   'sourceOptions': {
" \     '_': {
" \       'matchers': ['matcher_substring'],
" \     },
" \   },
" \   'filterParams': {
" \     'matcher_substring': {
" \       'highlightMatched': 'Title',
" \     },
" \   },
" \   'kindOptions': {
" \     'file': {
" \       'defaultAction': 'open',
" \     },
" \   },
" \   'uiParams': {
" \     'ff': {
" \       'startFilter': v:true,
" \       'prompt': '> ',
" \       'split': 'floating',
" \     }
" \   },
" \ })
"
" call ddu#custom#patch_local('grep', {
" \   'sourceParams' : {
" \     'rg' : {
" \       'args': ['--column', '--no-heading', '--color', 'never'],
" \     },
" \   },
" \   'uiParams': {
" \     'ff': {
" \       'startFilter': v:false,
" \     }
" \   },
" \ })
"


"=======================ddu-ui-ff==========================
autocmd FileType ddu-ff call s:ddu_my_settings()
function! s:ddu_my_settings() abort
  nnoremap <buffer><silent> <CR>
    \ <Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'open', 'params': {'command': 'vsplit'}})<CR>

  nnoremap <buffer><silent> <Space>
    \ <Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'open', 'params': {'command': 'split'}})<CR>

  nnoremap <buffer><silent> a
    \ <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>

  nnoremap <buffer><silent> p
    \ <Cmd>call ddu#ui#ff#do_action('preview')<CR>

  nnoremap <buffer><silent> <Esc>
    \ <Cmd>call ddu#ui#ff#do_action('quit')<CR>
endfunction


"=====================ddu-filter============================
autocmd FileType ddu-ff-filter call s:ddu_filter_my_settings()
function! s:ddu_filter_my_settings() abort
  inoremap <buffer><silent> <CR>
    \ <Esc><Cmd>close<CR>

  inoremap <buffer><silent> <Esc>
    \ <Esc><Cmd>close<CR>

  nnoremap <buffer><silent> <CR>
    \ <Cmd>close<CR>

  nnoremap <buffer><silent> <Esc>
    \ <Cmd>close<CR>
  
endfunction

nmap <silent> ;f <Cmd>call ddu#start({})<CR>
nmap <silent> ;g <Cmd>call ddu#start({
\   'name': 'grep',
\   'sources':[
\     {'name': 'rg', 'params': {'input': expand('<cword>')}}
\   ],
\ })<CR>




"========================ddu-filer============================
autocmd VimEnter * nnoremap <Leader>e :call ddu#start({'name': 'filer'})<CR>
"nnoremap <Leader>e :call ddu#start({'name': 'filer'})<CR>

autocmd TabEnter,CursorHold,FocusGained <buffer>
	\ call ddu#ui#do_action('checkItems')

autocmd FileType ddu-filer call s:ddu_filer_my_settings()
function! s:ddu_filer_my_settings() abort
  nnoremap <buffer><silent><expr> l
    \ ddu#ui#get_item()->get('isTree', v:false) ?
    \ "<Cmd>call ddu#ui#do_action('itemAction', {'name': 'narrow'})<CR>" :
    \ "<Cmd>call ddu#ui#do_action('itemAction', {'name': 'open', 'params': {}})<CR>"

  nnoremap <buffer><silent><expr> <CR>
    \ ddu#ui#get_item()->get('isTree', v:false) ?
    \ "<Cmd>call ddu#ui#do_action('itemAction', {'name': 'narrow'})<CR>" :
    \ "<Cmd>call ddu#ui#do_action('itemAction', {'name': 'open', 'params': {}})<CR>"

  "split
  nnoremap <buffer><silent><expr> <Space>
    \ ddu#ui#get_item()->get('isTree', v:false) ?
    \ "<Cmd>call ddu#ui#do_action('itemAction', {'name': 'narrow'})<CR>" :
    \ "<Cmd>call ddu#ui#do_action('itemAction', {'name': 'open', 'params': {'command': 'split'}})<CR>"

  nnoremap <buffer><silent> <Esc>
    \ <Cmd>call ddu#ui#do_action('quit')<CR>

  nnoremap <buffer><silent> q
    \ <Cmd>call ddu#ui#do_action('quit')<CR>

  nnoremap <buffer><silent> <Leader>f
    \ <Cmd>call ddu#ui#do_action('quit')<CR>

  "一個上のディレクトリに移動
  nnoremap <buffer><silent> -
    \ <Cmd>call ddu#ui#do_action('itemAction', {'name': 'narrow', 'params': {'path': '..'}})<CR>

  nnoremap <buffer><silent> c
    \ <Cmd>call ddu#ui#do_action('itemAction', {'name': 'copy'})<CR>

  nnoremap <buffer><silent> p
    \ <Cmd>call ddu#ui#do_action('itemAction', {'name': 'paste'})<CR>

  nnoremap <buffer><silent> D
    \ <Cmd>call ddu#ui#do_action('itemAction', {'name': 'delete'})<CR>

  nnoremap <buffer><silent> r
    \ <Cmd>call ddu#ui#do_action('itemAction', {'name': 'rename'})<CR>

  nnoremap <buffer><silent> m
    \ <Cmd>call ddu#ui#do_action('itemAction', {'name': 'move'})<CR>

  nnoremap <buffer><silent> N
    \ <Cmd>call ddu#ui#do_action('itemAction', {'name': 'newFile'})<CR>

  nnoremap <buffer><silent> mk
    \ <Cmd>call ddu#ui#do_action('itemAction', {'name': 'newDirectory'})<CR>

  nnoremap <buffer><silent> yy
    \ <Cmd>call ddu#ui#do_action('itemAction', {'name': 'yank'})<CR>
endfunction



" call ddc#custom#patch_global('ui', 'pum')
"
" call ddc#custom#patch_global('sources', [
" \  'vim-lsp',
" \  'around',
" \  'vsnip',
" \  'file',
" \])
"
"
" call ddc#custom#patch_global('sourceOptions', #{
"     \   vim-lsp: #{
"     \     matchers: ['matcher_head'],
"     \     mark: 'lsp',
"     \   },
"     \ })
"
"
" call ddc#custom#patch_global('sourceOptions', {
" \  '_': {
" \    'matchers': [ 'matcher_fuzzy' ],
" \    'sorters': [ 'sorter_fuzzy' ],
" \    'converters': [ 'converter_fuzzy' ],
" \  },
" \  'around': { 'mark': 'around' },
" \  'path': { 'mark': 'P' },
" \  'file': {
" \    'mark': 'F',
" \    'isVolatile': v:true,
" \    'forceCompletionPattern': '\S/\S*',
" \  },
" \  'vsnip': { 'mark': 'vsnip' },
" \})
"
"
" call ddc#custom#patch_filetype([ 'ps1', 'dosbatch', 'autohotkey', 'registry' ], {
" \   'sourceOptions': {
" \     'file': {
" \       'forceCompletionPattern': '\S\\\S*',
" \     },
" \   },
" \   'sourceParams': {
" \     'file': {
" \       'mode': 'win32',
" \     },
" \   },
" \ })
"
"
" call ddc#custom#patch_global('sourceParams', {
" \  'path': {
" \     'cmd': [ 'fd', '--max-depth', '5' ],
" \   },
" \ })
"
" call ddc#enable()
"
"
"
"
inoremap <silent><expr> <TAB>
      \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
      \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
      \ '<TAB>' : ddc#map#manual_complete()
inoremap <C-n>   <Cmd>call pum#map#select_relative(+1)<CR>
inoremap <C-p>   <Cmd>call pum#map#select_relative(-1)<CR>
inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>






const mapleader = " "

nnoremap <silent> <C-[> <cmd>nohlsearch<CR>

nnoremap <C-f> <cmd>close<CR>

inoremap jj <ESC>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
nnoremap <silent> <leader>a ggVG





set backspace=indent,eol,start
set hlsearch
set incsearch
set ignorecase
set formatoptions-=r
set formatoptions-=o
set tabstop=2
set shiftwidth=2
set softtabstop=2

set completeopt=menuone,noinsert




set clipboard=unnamedplus
set autoindent
set undofile
set termguicolors
set number

set cursorline
:highlight CursorLine guibg=#eff1f5




let g:lsp_log_file = expand('~/.vim/log/vim-lsp.log')
let g:lsp_settings_filetype_typescript = [
\	      'typescript-language-server',
\       'eslint-language-server',
\       'deno'
\ ]
let g:lsp_diagnostics_virtual_text_enabled = 1
let g:lsp_diagnostics_virtual_text_insert_mode_enabled = 1
let g:lsp_diagnostics_virtual_text_enabled = "after"
let g:lsp_diagnostics_enabled = 1





if executable('rust-analyzer')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rust-analyzer',
        \ 'cmd': {server_info->['rust-analyzer']},
        \ 'root_uri': {server_info->lsp#utils#path_to_uri(
        \     lsp#utils#find_nearest_parent_file_directory(
        \         lsp#utils#get_buffer_path(),
        \         ['Cargo.toml', '.git'],
        \     ))},
        \ 'allowlist': ['rust'],
        \ })
endif



if executable('zls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'zls',
        \ 'cmd': {server_info->['zls']},
        \ 'whitelist': ['zig'],
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(
        \     lsp#utils#find_nearest_parent_file_directory(
        \         lsp#utils#get_buffer_path(),
        \         ['zig.mod', 'build.zig', '.git'],
        \     ))},
        \ })
endif



if executable('haskell-language-server-wrapper')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'haskell-ls',
        \ 'cmd': {server_info->['haskell-language-server-wrapper', '--lsp']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(
        \     lsp#utils#find_nearest_parent_file_directory(
        \         lsp#utils#get_buffer_path(),
        \         ['.cabal', 'stack.yaml', 'cabal.project', 'package.yaml', 'hie.yaml', '.git'],
        \     ))},
        \ 'allowlist': ['haskell', 'lhaskell'],
        \ })
endif



if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'root_uri': {server_info->lsp#utils#path_to_uri(
        \     lsp#utils#find_nearest_parent_file_directory(
        \         lsp#utils#get_buffer_path(),
        \         ['CMakeLists.txt', '.git', 'compile_commands.json'],
        \     ))},
        \ 'whitelist': ['c', 'cc', 'cpp', 'objc', 'objcpp'],
        \ 'initialization_options': {},
        \ 'settings': {}
        \ })
endif




function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    " nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    " nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 0
    " autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

augroup vimspector
    autocmd!
    autocmd User VimspectorJumpedToFrame * call s:vimspector_my_settings()
augroup END

function! s:vimspector_my_settings() abort
	echom "Vimspector!"
	nnoremap <Leader>r <Plug>VimspectorContinue
	nnoremap <Leader>s <plug>VimspectorStop
	nnoremap <C-b> <cmd>call vimspector#ToggleBreakpoint()<CR>
        nnoremap <S-q> <cmd>vimspector#Reset()<CR>
endfunction

call lsp#activate()






let g:ale_disable_lsp = 1

let g:ale_sign_error = ' '
let g:ale_sign_warning = ' '
let g:ale_sign_info = ' '

let g:ale_fix_on_save = 1
let g:rustfmt_on_save = 0
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']


let g:ale_fixers = {
      \ 'javascript': ['deno'],
      \ 'typescript': ['deno'], 
      \ 'nix': ['nixfmt', 'nixpkgs-fmt'],
      \ 'rust': ['rustfmt'],
      \ 'haskell': ['ormolu'],
      \ 'lua': ['stylua'],
      \ }









set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'catppuccin_latte',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }



" function! CreateOutlineBuffer()
"   let QuickfixWindowExists = QuickfixWindowExists()
"   if QuickfixWindowExists == "true"
"     let windowLayout = winsaveview()
"     call DoVimgrep(&filetype)
"     copen
"     execute winrestview(windowLayout)
"   else
"     call DoVimgrep(&filetype)
"     copen
"     wincmd L
"   endif
" endfunction
"
" function! QuickfixWindowExists() abort
"   let bufferNoList = tabpagebuflist()
"   for bufferNo in bufferNoList
"     if getwininfo(bufwinid(bufferNo))['variables']['quickfix'] == 1
"       return "true"
"     endif
"   endfor
"   return "false"
" endfunction
"
" function! DoVimgrep(filetype) abort
"   if (a:filetype=='review')
"     vimgrep /^=\+ / %
"   elseif (a:filetype=='markdown')
"     vimgrep /^#\+ / %
"   endif
" endfunction
"
" nnoremap <silent> ;o :<Cmd>call CreateOutlineBuffer()<CR><CR>

" let g:denops#deno = '/home/s-show/.deno/bin/deno'
"
" call ddu#custom#patch_global({
" \   'ui': 'filer',
" \   'sources': [
" \     {
" \       'name': 'file',
" \       'params': {},
" \     },
" \   ],
" \   'sourceOptions': {
" \     '_': {
" \       'columns': ['filename'],
" \     },
" \     'command_history': {
" \       'matchers': [ 'matcher_substring' ],
" \     },
" \     'buffer': {
" \       'matchers': [ 'matcher_substring' ],
" \     },
" \   },
" \   'kindOptions': {
" \     'file': {
" \       'defaultAction': 'open',
" \     },
" \     'command_history': {
" \       'defaultAction': 'execute',
" \     },
" \   },
" \   'uiParams': {
" \     'filer': {
" \       'sort': 'filename',
" \       'split': 'floating',
" \       'displayTree': v:true,
" \       'previewVertical': v:true,
" \       'previewWidth': 80,
" \     }
" \   },
" \ })
"
" autocmd FileType ddu-ff call s:ddu_my_settings()
" function! s:ddu_my_settings() abort
"   nnoremap <buffer><silent> <CR>
"         \ <Cmd>call ddu#ui#ff#do_action('itemAction')<CR>
"   nnoremap <buffer><silent> vo
"         \ <Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'open', 'params': {'command': 'vsplit'}})<CR>
"   nnoremap <buffer><silent> vs
"         \ <Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'open', 'params': {'command': 'split'}})<CR>
"   nnoremap <buffer><silent> <Space>
"         \ <Cmd>call ddu#ui#ff#do_action('toggleSelectItem')<CR>
"   nnoremap <buffer><silent> i
"         \ <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>
"   nnoremap <buffer><silent> q
"         \ <Cmd>call ddu#ui#ff#do_action('quit')<CR>
" endfunction
"
" autocmd FileType ddu-ff-filter call s:ddu_filter_my_settings()
" function! s:ddu_filter_my_settings() abort
"   inoremap <buffer><silent> <CR>
"   \ <Esc><Cmd>close<CR>
"   nnoremap <buffer><silent> <CR>
"   \ <Cmd>close<CR>
"   nnoremap <buffer><silent> q
"   \ <Cmd>close<CR>
" endfunction
"
" autocmd FileType ddu-filer call s:ddu_filer_my_settings()
" function! s:ddu_filer_my_settings() abort
"   nnoremap <buffer><silent><expr> <CR>
"     \ ddu#ui#filer#is_tree() ?
"     \ "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow'})<CR>" :
"     \ "<Cmd>call ddu#ui#filer#do_action('itemAction')<CR>"
"   nnoremap <buffer><silent><expr> vo
"     \ ddu#ui#filer#is_tree() ?
"     \ "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow'})<CR>" :
"     \ "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'open', 'params': {'command': 'vsplit'}})<CR>"
"   nnoremap <buffer><silent> <Space>
"         \ <Cmd>call ddu#ui#filer#do_action('toggleSelectItem')<CR>
"   nnoremap <buffer><silent> <Esc>
"     \ <Cmd>call ddu#ui#filer#do_action('quit')<CR>
"   nnoremap <buffer> o
"         \ <Cmd>call ddu#ui#filer#do_action('expandItem',
"         \ {'mode': 'toggle'})<CR>
"   nnoremap <buffer><silent> q
"     \ <Cmd>call ddu#ui#filer#do_action('quit')<CR>
"   nnoremap <buffer><silent> ..
"     \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow', 'params': {'path': '..'}})<CR>
"   nnoremap <buffer><silent> c
"     \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'copy'})<CR>
"   nnoremap <buffer><silent> p
"     \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'paste'})<CR>
"   nnoremap <buffer><silent> d
"     \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'delete'})<CR>
"   nnoremap <buffer><silent> r
"     \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'rename'})<CR>
"   nnoremap <buffer><silent> mv
"     \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'move'})<CR>
"   nnoremap <buffer><silent> t
"     \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'newFile'})<CR>
"   nnoremap <buffer><silent> mk
"     \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'newDirectory'})<CR>
"   nnoremap <buffer><silent> yy
"     \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'yank'})<CR>
" endfunction
"
" " `;f` でファイルリストを表示する
" nmap <silent> ;f <Cmd>call ddu#start({
" \   'name': 'filer',
" \   'uiParams': {
" \     'filer': {
" \       'search': expand('%:p')
" \     }
" \   },
" \ })<CR>
"
" " `;b` でバッファリストを表示する
" nmap <silent> ;b <Cmd>call ddu#start({
" \   'ui': 'ff',
" \   'sources': [{'name': 'buffer'}],
" \   'uiParams': {
" \     'ff': {
" \       'split': 'floating',
" \     }
" \   },
" \ })<CR>
"
" " `;c` でコマンドリストを表示する
" nmap <silent> ;c <Cmd>call ddu#start({
" \   'ui': 'ff',
" \   'sources': [
" \     {
" \       'name': 'command_history',
" \     },
" \   ],
" \   'uiParams': {
" \     'ff': {
" \       'split': 'floating',
" \     },
" \   },
" \ })<CR>
