# Require DOTFILES_PATH
: ${DOTFILES_PATH:?"DOTFILES_PATH environment variable needs to be non-empty"}

# utility aliases
alias re-source='source ~/.zprofile'
alias zprofile='nvim ~/.zprofile'
alias zprofile2='nvim ${DOTFILES_PATH}/.zprofile'
alias nvimrc='nvim ${DOTFILES_PATH}/.nvimrc'
alias tmuxconf='nvim ${DOTFILES_PATH}/.tmux.conf'

# directories
# hash -d -- projects=~/Desktop/projects

# general aliases
alias o='open'
alias ni='nvim'
alias vi='nvim'
alias vim='nvim'
alias tm='tmux'
alias tma='tmux a'

# specific aliases
source ${DOTFILES_PATH}/aliases/.git_aliases
source ${DOTFILES_PATH}/aliases/.npm_aliases
source ${DOTFILES_PATH}/aliases/.aws_aliases
source ${DOTFILES_PATH}/aliases/.vagrant_aliases
source ${DOTFILES_PATH}/aliases/.docker_aliases

# functions
myTest() {
	echo '<Hello World />'
}
alias myTest=myTest

# TODO: make json to yaml below a function
# ruby -ryaml -rjson -e 'puts YAML.dump(JSON.parse(STDIN.read))' < file.json > file.yaml
