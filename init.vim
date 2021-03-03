set encoding=utf-8
set termguicolors
set nocompatible

call plug#begin()
" Gruvbox theme
Plug 'morhetz/gruvbox'
" Intellisense engine for Vim8 & Neovim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree', { 'on': ['NERDTree', 'NERDTreeToggle'] }
" Onedark theme
Plug 'joshdick/onedark.vim'
" Adds file type icons to Vim plugins
Plug 'ryanoasis/vim-devicons'
" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'
" Parenthesizing plugin
Plug 'jiangmiao/auto-pairs'
"Rainbow Parentheses
Plug 'luochen1990/rainbow'
" Indent guides
Plug 'nathanaelkane/vim-indent-guides'
" A solid language pack for Vim.
Plug 'sheerun/vim-polyglot'
" Fuzzy file, buffer, mru, tag, etc finder.
Plug 'ctrlpvim/ctrlp.vim'
" Vim plugin that displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar', { 'on': 'Tagbar'}
" Multiple cursors plugin for vim/neovim
Plug 'mg979/vim-visual-multi'
" A plugin for git
Plug 'tpope/vim-fugitive'
" Advanced syntax highlighting for GNU as
Plug 'shirk/vim-gas'
" Comment stuff out
Plug 'tpope/vim-commentary'
" Fizzy
Plug 'junegunn/fzf.vim'
" html auto pairs
Plug 'alvan/vim-closetag'
" Mordern database interface for VIM
Plug 'tpope/vim-dadbod'
" Simple ui for dadbod
Plug 'kristijanhusak/vim-dadbod-ui', { 'on' : ['DBUI'] }
call plug#end()

" Color scheme
colorscheme onedark
" colorscheme gruvbox

" airline configuraion
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
" Enable Rainbow
let g:rainbow_active = 1
" Enable Indent Guide 
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
" Hide NERDTree help banner
let g:NERDTreeMinimalUI = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#3B374A ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#2E3F49 ctermbg=4

"opt
syn on
set number
set tabstop=4
set shiftwidth=4
set smartindent
set mouse=a
set splitbelow
set wildmode=longest:full,full
set timeoutlen=400
set nottimeout
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
set shm+=I
set signcolumn=number
set guifont=UbuntuMono\ Nerd\ Font

packadd termdebug

" neovim's yank highlight
augroup highlight_yank
	autocmd!
	au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=400}
augroup END

" assembly language
augroup asm_ft
	au!
	autocmd BufNewFile,BufRead *.[sS],*.asm set ft=asm
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

" Run GNU make
nnoremap <silent> <f7> :w <bar> :make run<CR>
inoremap <silent> <f7> <ESC> :w <bar> :make run<CR>

" =======================================================
" Show yank history
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

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

