# Require DOTFILES_PATH
: ${DOTFILES_PATH:?"DOTFILES_PATH environment variable needs to be non-empty"}

# directories
hash -d -- desktop=$HOME/Desktop
hash -d -- dotfiles=$DOTFILES_PATH
hash -d -- projects=$HOME/Desktop/projects

# utility aliases
alias re-source='source $HOME/.zprofile'
alias zprofile='vim $HOME/.zprofile'
alias zprofile2='vim $DOTFILES_PATH/.zprofile'
alias nvimrc='vim $DOTFILES_PATH/.nvimrc'
alias tmuxconf='vim $DOTFILES_PATH/.tmux.conf'
alias itree='tree --prune -I $(cat $DOTFILES_PATH/.gitignore | egrep -v "^#.*$|^[[:space:]]*$" | tr "\\n" "|")' #https://coderwall.com/p/wgq89a/use-tree-with-gitignore

# general aliases
alias o='open'
alias vim='nvim'
alias v='vim'
alias vn='vim -u NONE'
alias tm='tmux'
alias tma='tmux a'
alias tml='tmux list-sessions'
alias tmn='tmux new-session \; new-window \; split-window -v \; split-window -h \; select-pane -U \; select-window -t 1 \;'
alias todos='ag -r TODO .'
alias agr='ag -r'
alias grepr='grep -r'

# specific aliases
source $DOTFILES_PATH/aliases/.git_aliases
source $DOTFILES_PATH/aliases/.npm_aliases
source $DOTFILES_PATH/aliases/.aws_aliases
source $DOTFILES_PATH/aliases/.vagrant_aliases
source $DOTFILES_PATH/aliases/.docker_aliases

# functions
terminal-colors () {
  for i in {0..255} ; do
    printf "\x1b[48;5;%sm%3d\e[0m " "$i" "$i"
    if (( i == 15 )) || (( i > 15 )) && (( (i-15) % 6 == 0 )); then
      printf "\n";
    fi
  done
}

