call plug#begin("~/.vim/plugged")
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'
Plug 'mxw/vim-jsx'
Plug 'jiangmiao/auto-pairs'
Plug 'cakebaker/scss-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'joshdick/onedark.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
call plug#end()


" --------------------- NERDTree SETTINGS ------------------------ "

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Automatically open NERDTree when neovim starts up
autocmd vimenter * NERDTree

" Toggle
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" open new split panes to right and below
set splitright
set splitbelow


" ------------------- TERMINAL SETTINGS ------------------------ "

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl-n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>


" ------------------- MOVING BETWEEN PANELS ------------------- "

tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l


" ------------------- FZF CONFIG ------------------- "

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']


" ------------------ COLOR SCHEME -------------------- "

set background=dark
colorscheme onedark
let g:lightline = { 'colorscheme': 'onedark' }
let g:airline_theme = "onedark"
let g:onedark_terminal_italics=1
if (has("termguicolors"))
  set termguicolors
endif


" --------------------- PRETTIER ---------------------- "
 let g:prettier#autoformat = 0
 autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
let g:prettier#config#tab_width = 2
set smarttab
set cindent
set tabstop=4
set shiftwidth=2
" always uses spaces instead of tab characters
set expandtab
