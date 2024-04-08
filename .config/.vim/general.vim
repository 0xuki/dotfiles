" Visual
set number
set cursorline
set display=lastline
set list
set listchars=tab:>-
set virtualedit+=onemore

" Tab / Indent
set tabstop=4
set noexpandtab
set autoindent
set smartindent
set shiftwidth=4

" Encoding
set encoding=utf-8
set fileencodings=utf-8,cp932,sjis

" Spell check
set spell
set spelllang=en,cjk
highlight clear SpellBad
highlight SpellBad cterm=underline

" Opt files
set undofile
set undodir=~/.vim/.undo

" Completion
set pumheight=15

" Syntax highlighting
syntax on

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase

