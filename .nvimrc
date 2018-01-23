syntax enable

set encoding=utf-8

" show numberlines
set number

" show invisible characters
" set list
" set listchars=space:·,tab:▸-

" show commands as we type them
set showcmd

" highlight matching brackets
set showmatch

" show the first match as search strings are typed
set incsearch

" highlight the search matches
set hlsearch

" always show powerline
set laststatus=2

" allow JSX in normal JS files
let g:jsx_ext_required = 0

" use system clipboard
set clipboard=unnamed

" disable word wrap
set nowrap

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

" ctrpl ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  'dist\|build\|node_modules\|DS_Store\|git'
  \ }

