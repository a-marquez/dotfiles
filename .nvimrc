syntax enable

set encoding=utf-8

" show numberlines
set number

" show invisible characters
set list
set listchars=space:·,tab:▸-

" set invisible characters color
hi NonText ctermfg=236

" show commands as we type them
set showcmd

" highlight matching brackets
set showmatch

" search ignores case unless an uppercase letter used
set ignorecase
set smartcase

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

" replace grep with silver searcher - reference: https://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
  " use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" automatic session saving and loading - reference: https://stackoverflow.com/questions/1642611/how-to-save-and-restore-multiple-different-sessions-in-vim/47656092#47656092
function! MakeSession(overwrite)
  let b:sessiondir = $HOME . "/.nvim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  if a:overwrite == 0 && !empty(glob(b:filename))
    return
  endif
  exe "mksession! " . b:filename
endfunction

function! LoadSession()
  let b:sessiondir = $HOME . "/.nvim/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction

" add automatons for when entering or leaving Vim
if(argc() == 0)
  au VimEnter * nested :call LoadSession()
  au VimLeave * :call MakeSession(1)
else
  au VimLeave * :call MakeSession(0)
endif

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
let g:ctrlp_root_markers = ['.editorconfig', 'docker-compose.yml']

" ctrlp use silver searcher - reference: https://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
  " use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  let g:ctrlp_show_hidden = 1
  let g:ctrlp_custom_ignore = { 'dir': 'git$\|build$\|node_modules$' }
endif

