" Install plugins
call plug#begin('~/.vim/plugged')

" Theme
Plug 'drewtempelmeyer/palenight.vim'
" Lightline 
Plug 'itchyny/lightline.vim'
" Fuzzy search
Plug '~/.fzf'
" Search
Plug 'mileszs/ack.vim'
" Search
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

" Configure Theme
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

set background=dark
colorscheme palenight

" Configure Lightline
let g:lightline = {
  \ 'colorscheme': 'palenight',
  \ }

" Configure ack.vim/ag
let g:ackprg = 'ag --nogroup --nocolor --column'

" Configure tab spacing
filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

" Configure the display of line numbers
set number
