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
Plug 'mxw/vim-jsx'
Plug 'jiangmiao/auto-pairs'
Plug 'cakebaker/scss-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-commentary'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'othree/yajs.vim'
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
autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif

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


" ----------------------- CUSTOM CONFIG ------------------------- "

" No line wrapping when working!!!
autocmd BufWritePre, BufRead *.js,*.jsx setlocal nowrap

" Leader key
let mapleader = ","

" Quick Resize Window
nnoremap <A-+> <C-w>+
nnoremap <A--> <C-w>-

" Moving line up and down
nnoremap <leader>j ddp
nnoremap <leader>k ddkP

" Quick open init.vim for configuring
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Go to beginning and end of lines using L and H
nnoremap H 0
nnoremap L $
nnoremap 0 <nop>
nnoremap $ <nop>

" Quick escape insert and visual mode by pressing jk
inoremap jk <esc>
inoremap <esc> <nop>

" Commenter for JSX file wrote by MYSELF
augroup jsx_command
  autocmd!
  autocmd FileType javascript.jsx vnoremap <leader>cc <esc>`<i{/*<space><esc>`>a<space>*/}<esc>`<
  autocmd FileType javascript.jsx vnoremap <leader>cu <esc>hhh4x'<4x
  autocmd FileType javascript.jsx nnoremap <leader>cc I{/*<space><esc>A<space>*/}<esc>0w
  autocmd FileType javascript.jsx nnoremap <leader>cu 0w4x$bh4x0w
augroup END

" Quick search the current word
nnoremap <leader>/ /<C-r><C-w><ENTER>
