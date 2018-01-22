# Require DOTFILES_PATH
: ${DOTFILES_PATH:?"DOTFILES_PATH environment variable needs to be non-empty"}
 
# shell
alias re-source='source ~/.zprofile'
alias zprofile='nvim ~/.zprofile'
alias zprofile2='nvim ${DOTFILES_PATH}shell/.zprofile'
alias nvimrc='nvim ${DOTFILES_PATH}.nvimrc'
alias tmuxconf='nvim ${DOTFILES_PATH}.tmux.conf'

# directories
hash -d -- projects=~/Desktop/projects
hash -d -- bookmarks=~/Library/Application\ Support/Yummy\ FTP/Bookmarks

# general
alias o='open'
alias yss='pysswords'
alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias btd='boot2docker'
alias comp='docker-compose'
alias ni='nvim'
alias vi='nvim'
alias vim='nvim'

# sources
source ~/Google\ Drive/dotfiles/shell/.git_dotfile
source ~/Google\ Drive/dotfiles/shell/.npm_dotfile
source ~/Google\ Drive/dotfiles/shell/.aws_dotfile
# tmux
alias tm='tmux'
alias tma='tmux a'
# vagrant
alias vt='vagrant'
alias vtg='vagrant global-status'
alias vth='vagrant halt'
alias vts='vagrant ssh'
alias vtst='vagrant status'
alias vtu='vagrant up'
# docker
alias dr='docker'
alias drm='docker-machine'
alias drc='docker-compose'

# functions
myTest() {
	echo '<Hello World />'
} 
alias myTest=myTest

# TODO: make json to yaml below a function
# ruby -ryaml -rjson -e 'puts YAML.dump(JSON.parse(STDIN.read))' < file.json > file.yaml
