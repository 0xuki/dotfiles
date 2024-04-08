" Insert template file function
command! -complete=customlist,InsertTemplateComplete -nargs=1 InsertTemplate call InsertTemplate(<f-args>)
function! InsertTemplate(file)
	try
		execute "r " . get(split(globpath(&rtp, "template/" . a:file), "\n"), -1)
	catch /E484:/
		echo "File not found."
	endtry
endfunction
function! InsertTemplateComplete(A, L, P)
	return split(get(split(globpath(&rtp, "template/" . a:A . "*"), "/"), -1, ""), "\n")
endfunction


" User color function
command! -nargs=? SetColor call SetColor(<f-args>)
function! SetColor(...)
	if a:0 == 0 ||  a:1 == "horizon"
		set termguicolors
		set background=dark
		colorscheme horizon
		hi SpecialKey guibg=NONE guifg=#e95678
	endif
endfunction
