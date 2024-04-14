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

command! -nargs=1 Ddu call s:ddu_command(<f-args>)
function! s:ddu_command(args) abort
  echo a:args
  call ddu#start(#{ sources: [#{ name: a:args }] })
endfunction

set backspace=indent,eol,start
set hlsearch
set incsearch
set ignorecase
set laststatus=3
set noshowmode
set formatoptions-=r
set formatoptions-=o
set tabstop=2
set shiftwidth=2
set softtabstop=2

set completeopt=menuone,noinsert

set autoindent

const mapleader = " "

nnoremap <silent> <C-[> <cmd>nohlsearch<CR>

nnoremap <C-f> <cmd>close<CR>

inoremap jj <ESC>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
nnoremap <silent> <leader>a ggVG

set clipboard=unnamedplus
set autoindent
set statusline=─
set fillchars+=stl:─,stlnc:─,vert:│,eob:\\x20
set laststatus=0
set undofile
set termguicolors



