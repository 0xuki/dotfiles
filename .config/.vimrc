set nocompatible

if !isdirectory(expand('~/.vim/bundle/Vundle.vim'))
	execute '!git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim'
endif


filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Plugin 'inkarkat/vim-ingo-library'
Plugin 'inkarkat/vim-IndentConsistencyCop'
Plugin 'itchyny/landscape.vim'
Plugin 'tpope/vim-fugitive.git'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tokorom/vim-review'
Plugin 'lervag/vimtex'
Plugin 'digitaltoad/vim-pug'
Plugin 'ntk148v/vim-horizon'
Plugin 'flrnprz/plastic.vim'
Plugin 'nightsense/snow'
Plugin 'tpope/vim-surround'
Plugin 'cohama/lexima.vim'
Plugin 'posva/vim-vue'
call vundle#end()
filetype plugin indent on


" include config
runtime ale.vim
runtime cmd.vim
runtime general.vim
runtime keymapping.vim
"IndentConsistencyCop
