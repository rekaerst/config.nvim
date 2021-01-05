set encoding=utf-8
set termguicolors
set nocompatible

call plug#begin()
" Intellisense engine for Vim8 & Neovim
if has("nvim") || has("unix")
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif
" Parenthesizing plugin
Plug 'jiangmiao/auto-pairs'
" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
" Adds file type icons to Vim plugins
Plug 'ryanoasis/vim-devicons'
" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree', { 'on': ['NERDTree', 'NERDTreeToggle'] }
" Fuzzy file, buffer, mru, tag, etc finder.
Plug 'ctrlpvim/ctrlp.vim', { 'on': ['CtrlP','CtrlPBuffer'] }
" Vim plugin that displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar', { 'on': 'Tagbar'}
" Onedark theme
Plug 'joshdick/onedark.vim'
" Multiple cursors plugin for vim/neovim
Plug 'mg979/vim-visual-multi'
" A solid language pack for Vim.
Plug 'sheerun/vim-polyglot'
" A plugin for git
Plug 'tpope/vim-fugitive'
" Comment stuff out
Plug 'tpope/vim-commentary'
" Fizzy
Plug 'junegunn/fzf.vim'
" html auto pairs
Plug 'alvan/vim-closetag'
call plug#end()

" Color scheme
colorscheme onedark

let g:airlinetheme="onedark"
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_section_b = '%{getcwd()}'
let g:airline#extensions#tagbar#enabled = 0

" Neovim provider
let g:python3_host_prog = '/usr/bin/python3'
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0

" Coc data folder
let g:coc_data_home = '/home/arthur/.local/share/coc'

"opt
syn on
set number
set tabstop=4
set shiftwidth=4
set smartindent
set backspace=indent,eol,start
set mouse=a
set splitbelow
set wildmode=longest:full,full
set wildmenu
set timeoutlen=400
set nottimeout
" A better looking list
set list
set listchars=tab:\│\ ""
" Highlight current cloumn and line
set cursorline
set cursorcolumn
set inccommand=nosplit

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Signcolumn
set signcolumn=number

packadd termdebug


" ========================== Custom Commands =====================================
command CursorAim :set cursorcolumn | :set cursorline
command CursorUnAim :set nocursorcolumn | :set nocursorline


" ========================== Highlighting =====================================
hi SpecialKey guifg=#5c6370
hi Number ctermfg=173 guifg=#FFDCB6
hi Type ctermfg=180 guifg=#3276EB
hi SpecialChar guifg=#56B6C2


" ========================== Misc =====================================
autocmd BufEnter *.asm set syntax=asm
autocmd BufEnter *.S set syntax=asm

" ========================== Key Mappings =====================================
" Remove current search highlighting
nnoremap <silent> ,h :noh<CR>

" Set relative line number
function! s:if_set_relative_number()
	if &relativenumber
		set norelativenumber
	else
		set relativenumber
	endif
endfunction
nnoremap <silent> ,r :call <SID>if_set_relative_number()<CR>
nnoremap <silent> ,w :w<CR>

" Jump to end of line
inoremap <C-e> <C-o>A

" =======================================================
" ===================coc.nvim============================
" =======================================================
" Show yank history
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ search('\%#[]>)}''"`]', 'n') ? '<Right>' :
			\ "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Compile c/cpp code and run
autocmd filetype cpp inoremap <F29> <ESC>:w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && '.shellescape('./%:r')<CR>
autocmd filetype cpp nnoremap <F29> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && '.shellescape('./%:r')<CR>
autocmd filetype c inoremap <F29> <ESC>:w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && '.shellescape('./%:r')<CR>
autocmd filetype c nnoremap <F29> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && '.shellescape('./%:r')<CR>

" Execute java code
autocmd filetype java nnoremap <F29> :w <bar> exec '!java '.shellescape('%')<CR>
autocmd filetype java inoremap <F29> <ESC>:w <bar> exec '!java '.shellescape('%')<CR>

" Execute python code
autocmd filetype python nnoremap <F29> :w <bar> exec '!python3 '.shellescape('%')<CR>
autocmd filetype python inoremap <F29> <ESC>:w <bar> exec '!python3 '.shellescape('%')<CR>

" Run GNU make
nnoremap <silent> <f7> :w <bar> :make<CR>
inoremap <silent> <f7> <ESC> :w <bar> :make<CR>

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
	inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" One can also use <M-y> for confirm completion
inoremap <expr> <M-y> "\<C-y>"
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
	else
		call CocAction('doHover')
	endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <silent> <leader>f  <Plug>(coc-format-selected)
nmap <silent> <leader>f  <Plug>(coc-format-selected)

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
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" NeoVim-only mapping for visual mode scroll
" Useful on signatureHelp after jump placeholder of snippet expansion
if has('nvim')
  vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
  vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
endif

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

" ==============================================
" ================vim-closetag==================
" ==============================================
