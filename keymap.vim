autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#3B374A ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#2E3F49 ctermbg=4
"opt
" assembly language
augroup asm_ft
	au!
	autocmd BufNewFile,BufRead *.[sS],*.asm set ft=nasm
augroup END

augroup tab_preference
	au!
	au FileType python set expandtab
	au FileType nim set expandtab
	au FileType markdown set expandtab | set tabstop=2 | set shiftwidth=2
augroup END


" ========================== Custom Commands ==========================
command CursorAim :set cursorcolumn | :set cursorline
command CursorUnAim :set nocursorcolumn | :set nocursorline


" ========================== Highlighting ==============================
hi SpecialKey guifg=#5c6370
hi Number ctermfg=173 guifg=#FFDCB6
hi Type ctermfg=180 guifg=#3276EB
hi SpecialChar guifg=#56B6C2

" ========================== Key Mappings ============================
nnoremap <silent> ,h :noh<CR>

" Set relative line number
nnoremap <silent> ,r :set invrelativenumber<CR>
nnoremap <silent> ,w :w<CR>
nnoremap <silent> ,a :wa<CR>
nnoremap <silent> ,n :NERDTree<CR>
nnoremap <silent> ,t :Tagbar<CR>

" Emacs keybindings
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^

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

" C and C++
autocmd filetype c,cpp call s:SetMakeOptions('c')
autocmd filetype rust call s:SetMakeOptions('rust')
autocmd filetype go call s:SetMakeOptions('go')

let g:make_option = ""
function s:SetMakeOptions(file_type)
	if a:file_type == 'c'
		nnoremap <silent> <F5> :wa <bar> :make run DEBUG=1<CR>
		inoremap <silent> <f5> <ESC> :wa <bar> :make run DEBUG=1<CR>
		nnoremap <silent> <F17> :wa <bar> :silent make DEBUG=1 <bar> :execute 'Termdebug '.GetBinName()<CR>
		nnoremap <silent> <F17> <ESC> :wa <bar> :silent make DEBUG=1 <bar> :execute 'Termdebug '.GetBinName()<CR>
	elseif a:file_type == "rust"
		nnoremap <silent> <F5> :wa <bar> :make run <CR>
		inoremap <silent> <f5> <ESC> :wa <bar> :make run <CR>
		nnoremap <silent> <F17> :wa <bar> :make build <CR> :Termdebug <CR>
		inoremap <silent> <f17> <ESC> :wa <bar> :make build <CR> :Termdebug <CR>
	elseif a:file_type == "go"
		nnoremap <silent> <F5> :wa <bar> :!go run . <CR>
		inoremap <silent> <f5> <ESC> :wa <bar> :!go run . <CR>
		nnoremap <silent> <F17> :wa <bar> :!go build <CR> :Termdebug <CR>
		inoremap <silent> <f17> <ESC> :wa <bar> :!go build <CR> :Termdebug <CR>
	endif
endfunction


" vim-closetag work around
au FileType html inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
au FileType xml inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ search('\%#[]>)};''"`]', 'n') ? '<Right>' :
			\ "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
nmap <F2> <Plug>(coc-rename)

" Formatting selected code.
xmap <silent> <leader>f  <Plug>(coc-format-selected)
nmap <silent> <leader>f  <Plug>(coc-format-selected)
nmap <silent> ,f :call CocAction('format')<CR>

augroup mygrrup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
