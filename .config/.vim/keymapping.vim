" General
inoremap jj <ESC>
noremap <Down> gj
noremap <Up> gk
"" Split op. mapping
nnoremap s <nop>
nnoremap <silent> sp :sp<CR>
nnoremap <silent> sv :vsp<CR>
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sH <C-w>H
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap s< <C-w><
nnoremap s> <C-w>>
nnoremap s+ <C-w>+
nnoremap s- <C-w>-
"" Tab op. mapping
nnoremap <silent> st :tabnew<CR>
"" Buffer op. mapping
nnoremap <silent> gb :bnext<CR>
nnoremap <silent> gB :bprevious<CR>
" Completion
inoremap <expr> <Tab> pumvisible() ? '<C-n>' : '<Tab>'
inoremap <expr> <S-Tab> pumvisible() ? '<C-p>' : '<S-Tab>'

" Plugin
"" ALE
nnoremap <C-k> <Plug> (ale_previous_wrap)
nnoremap <C-j> <Plug> (ale_next_wrap)
"" NerdTree
map <C-n> :NERDTreeToggle<CR>
