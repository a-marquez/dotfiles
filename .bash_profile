# Require DOTFILES_PATH
: ${DOTFILES_PATH:?"DOTFILES_PATH environment variable needs to be non-empty"}

# general aliases
alias l='ls -alh'
alias ..='cd ..'
alias ...='cd ...'
alias re-source='source ~/.bash_profile'
alias bash_profile='vim ~/.bash_profile'
alias bash_profile2='vim ${DOTFILES_PATH}/shell/.bash_profile'

# sources
source ${DOTFILES_PATH}/shell/.npm
source ${DOTFILES_PATH}/shell/.git_dotfile
