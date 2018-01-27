syntax enable

set encoding=utf-8

" show numberlines
set number

" show invisible characters
set list
set listchars=space:·,tab:▸-
hi NonText ctermfg=0

" show commands as we type them
set showcmd

" highlight matching brackets
set showmatch

" show the first match as search strings are typed
set incsearch

" highlight the search matches
set hlsearch

" use system clipboard
set clipboard=unnamed

" disable word wrap
set nowrap

" natural split directions
set splitright
set splitbelow

" move swapfiles out of project
set directory=$HOME/.nvim/swapfiles//

" change diff colors for legibility
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

" vundle
filetype off
set rtp+=~/.nvim/bundle/Vundle.vim
call vundle#begin()

" utility
Plugin 'vundlevim/vundle.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'ciaranm/detectindent'

" syntax
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'digitaltoad/vim-pug'
Plugin 'wavded/vim-stylus'
Plugin 'groenewege/vim-less'

call vundle#end()
filetype plugin indent on

" always show powerline
set laststatus=2

" allow JSX in normal JS files
let g:jsx_ext_required = 0

" ctrlp root marker
let g:ctrlp_root_markers = ['.editorconfig']

" ctrlp show hidden hidden files
let g:ctrlp_show_hidden = 1

" ctrlp ignore
 let g:ctrlp_custom_ignore = { 'dir': 'git$\|build$\|node_modules$' }
