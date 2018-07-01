### NVM ###
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

### PATH ###
YARN_BIN=$(yarn global bin)
USER_BIN=$HOME/bin
PATH=$YARN_BIN:$USER_BIN:$PATH

### ANTIBODY
source <(antibody init)
antibody bundle < ~/.zsh_plugins

### CARGO ###
source $HOME/.cargo/env

### PHPBREW ###
[[ -e $HOME/.phpbrew/bashrc ]] && source /home/ryo/.phpbrew/bashrc

### ALIASE ###
alias s="git status"
alias reload="source ~/.zshrc"
alias ls="exa"

### zsh completion ###
fpath=(~/.zsh-completions $fpath)
