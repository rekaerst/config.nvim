" assembly language
augroup asm_ft
	au!
	autocmd BufNewFile,BufRead *.[sS],*.asm set ft=nasm
augroup END
" ========================== Custom Commands ==========================
command CursorAim :set cursorcolumn | :set cursorline
command CursorUnAim :set nocursorcolumn | :set nocursorline


" ========================== Highlighting ==============================
hi SpecialKey guifg=#5c6370

" ========================== Key Mappings ============================
nnoremap <silent> ,h :noh<CR>

" Set relative line number
nnoremap <silent> ,r :set invrelativenumber<CR>
nnoremap <silent> ,w :w<CR>
nnoremap <silent> ,a :wa<CR>
nnoremap <silent> ,t :Tagbar<CR>

" Emacs keybindings
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^

inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ search('\%#[]>)};''"`]', 'n') ? '<Right>' :
			\ "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
