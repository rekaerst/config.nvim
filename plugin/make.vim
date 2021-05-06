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

autocmd filetype lua nmap <F5> <cmd>:w <bar> :!lua % <CR>
autocmd filetype lua inoremap <F5> <cmd>:w <bar> :!lua % <CR>

" get binary name from Makefile
function! GetBinName()
	let binName = system("grep 'BIN =' Makefile | sed 's/BIN =[ ]//g'")
	return substitute(binName, '\n\+$', '','')
endfunction

