# Require DOTFILES_PATH
: ${DOTFILES_PATH:?"DOTFILES_PATH environment variable needs to be non-empty"}

# directories
hash -d -- dotfiles=$DOTFILES_PATH
hash -d -- projects=$HOME/Desktop/projects

# utility aliases
alias re-source='source $HOME/.zprofile'
alias zprofile='nvim $HOME/.zprofile'
alias zprofile2='nvim $DOTFILES_PATH/.zprofile'
alias nvimrc='nvim $DOTFILES_PATH/.nvimrc'
alias tmuxconf='nvim $DOTFILES_PATH/.tmux.conf'

# general aliases
alias o='open'
alias ni='nvim'
alias vi='nvim'
alias vim='nvim'
alias tm='tmux'
alias tma='tmux a'

# specific aliases
source $DOTFILES_PATH/aliases/.git_aliases
source $DOTFILES_PATH/aliases/.npm_aliases
source $DOTFILES_PATH/aliases/.aws_aliases
source $DOTFILES_PATH/aliases/.vagrant_aliases
source $DOTFILES_PATH/aliases/.docker_aliases
