" Compile c/cpp code and run
autocmd filetype cpp inoremap <F29> <ESC>:w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && '.shellescape('./%:r')<CR>
autocmd filetype cpp nnoremap <F29> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && '.shellescape('./%:r')<CR>
autocmd filetype c inoremap <F29> <ESC>:w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && '.shellescape('./%:r')<CR>
autocmd filetype c nnoremap <F29> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && '.shellescape('./%:r')<CR>

" Execute java code
autocmd filetype java nnoremap <F29> :w <bar> exec '!java '.shellescape('%')<CR>
autocmd filetype java inoremap <F31> <ESC>:w <bar> exec '!java '.shellescape('%')<CR>

" Execute python code
autocmd filetype python nnoremap <F29> :w <bar> exec '!python3 '.shellescape('%')<CR>
autocmd filetype python inoremap <F29> <ESC>:w <bar> exec '!python3 '.shellescape('%')<CR>

" Execute javascript code with node
autocmd filetype javascript nnoremap <F29> :w <bar> exec '!node '.shellescape('%')<CR>
autocmd filetype javascript inoremap <F29> <ESC>:w <bar> exec '!node '.shellescape('%')<CR>

" Run Go code with go run
autocmd filetype go nnoremap <F29> :w <bar> exec '!go run '.shellescape('%')<CR>
autocmd filetype go nnoremap <F29> <ESC>:w <bar> exec '!go run '.shellescape('%')<CR>

" get binary name from Makefile
function! GetBinName()
	let binName = system("grep 'BIN =' Makefile | sed 's/BIN =[ ]//g'")
	return substitute(binName, '\n\+$', '','')
endfunction

" " C and C++
" autocmd filetype c,cpp call s:SetMakeOptions('c')
" autocmd filetype rust call s:SetMakeOptions('rust')
" autocmd filetype go call s:SetMakeOptions('go')

" let g:make_option = ""
" function s:SetMakeOptions(file_type)
" 	if a:file_type == 'c'
" 		nnoremap <silent> <F5> :wa <bar> :make run DEBUG=1<CR>
" 		inoremap <silent> <f5> <ESC> :wa <bar> :make run DEBUG=1<CR>
" 		nnoremap <silent> <F17> :wa <bar> :silent make DEBUG=1 <bar> :execute 'Termdebug '.GetBinName()<CR>
" 		nnoremap <silent> <F17> <ESC> :wa <bar> :silent make DEBUG=1 <bar> :execute 'Termdebug '.GetBinName()<CR>
" 	elseif a:file_type == "rust"
" 		nnoremap <silent> <F5> :wa <bar> :make run <CR>
" 		inoremap <silent> <f5> <ESC> :wa <bar> :make run <CR>
" 		nnoremap <silent> <F17> :wa <bar> :make build <CR> :Termdebug <CR>
" 		inoremap <silent> <f17> <ESC> :wa <bar> :make build <CR> :Termdebug <CR>
" 	elseif a:file_type == "go"
" 		nnoremap <silent> <F5> :wa <bar> :!go run . <CR>
" 		inoremap <silent> <f5> <ESC> :wa <bar> :!go run . <CR>
" 		nnoremap <silent> <F17> :wa <bar> :!go build <CR> :Termdebug <CR>
" 		inoremap <silent> <f17> <ESC> :wa <bar> :!go build <CR> :Termdebug <CR>
" 	endif
" endfunction

