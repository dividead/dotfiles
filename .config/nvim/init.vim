"vim plug
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'liuchengxu/vim-which-key'
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

"WhichKey
let mapleader = "\<Space>"
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=500

let g:which_key_map = {}

let g:which_key_map[' '] = [':Files', 'search files']
let g:which_key_map['s'] = [':Rg', 'search pattern']
let g:which_key_map['-'] = ['<C-W>s', 'split horizontal']
let g:which_key_map['='] = ['<C-W>v', 'split vertical']
let g:which_key_map['d'] = ['<C-W>c', 'close split']
let g:which_key_map['/'] = [':let @/ = ""', 'remove highlight']
let g:which_key_map['b'] = ['Buffers', 'fzf-buffer']
let g:which_key_map['n'] = ['bnext', 'next buffer']
let g:which_key_map['w'] = ['bd', 'close buffer']

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" call which_key#register('@', "g:which_key_map")
call which_key#register('<Space>', "g:which_key_map")

"coc
nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
