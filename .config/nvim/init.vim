"vim plug
call plug#begin()
"Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
call plug#end()

"line numbers
set number
set relativenumber

"casual mode
set mouse=a

"true color
set termguicolors

" open new split panes to right and below
set splitright
set splitbelow

"keep buffers with unsaved changes
set hidden

"set showcmd
"folding (za, zo, zc, zR)
set foldmethod=syntax
"set foldmethod=indent
set foldlevel=2
"close on leave
"set foldclose=all

"syntax highlights
syntax enable

"theme
colorscheme gruvbox 

"better names for tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'jsformatter'

"custom keys
"fzf (ctrl+t)
nnoremap <C-T> :Files<cr> 
"ripgrep
nnoremap \ :Rg<CR>
"coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
