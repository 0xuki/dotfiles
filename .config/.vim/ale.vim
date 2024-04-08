" ALE Linter settings
let g:ale_completion_enabled = 1
"let g:ale_completion_max_suggestions = 10
let g:ale_open_list = 1
let g:ale_set_signs = 1
let g:ale_sign_column_always = 1
autocmd QuitPre * if empty(&bt) | lclose | endif

"" Python Linter settings
let g:ale_linters = {
\   'cpp': ['cquery'],
"\   'go': ['gopls', 'gofmt', 'golint', 'govet'],
\   'python': ['pyls'],
\   'haskell': ['stack-ghc'],
\ }
let g:ale_python_pyls_config = {
\   'pyls': {
\       'configurationSources': ['flake8'],
\   }
\ }
let g:ale_python_pyls_auto_pipenv = 1
let g:ale_haskell_ghc_options = ' -dynamic'
