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
nnoremap <silent> <leader>h :noh<CR>

" Set relative line number
nnoremap <silent> <leader>nr :set invrelativenumber<CR>
nnoremap <silent> <leader>ww :w<CR>
nnoremap <silent> <leader>wa :wa<CR>
nnoremap <silent> <leader>tg :Tagbar<CR>

" Emacs keybindings

" inoremap <silent><expr> <TAB>
" 			\ pumvisible() ? "\<C-n>" :
" 			\ search('\%#[]>)};''"`]', 'n') ? '<Right>' :
" 			\ "\<TAB>"
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
