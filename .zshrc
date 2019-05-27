### aliases
source $HOME/.aliases.zsh

### NVM ###
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export EDITOR=vim

### PATH ###
ANDROID_STUDIO=/opt/android-studio/bin
YARN_BIN=$(yarn global bin)
USER_BIN=$HOME/bin
ANDROID_SDK=$HOME/Android/Sdk
ANDROID_SDK_TOOLS=$ANDROID_SDK/Sdk/tools/bin
EMULATOR_TOOLS=$ANDROID_SDK/emulator
PATH=$YARN_BIN:$USER_BIN:$ANDROID_STUDIO:$ANDROID_SDK_TOOLS:$EMULATOR_TOOLS:$PATH

### ANTIBODY
source <(antibody init)
antibody bundle <~/.zsh_plugins

### CARGO ###
source $HOME/.cargo/env

### PHPBREW ###
[[ -e $HOME/.phpbrew/bashrc ]] && source /home/$USER/.phpbrew/bashrc

### zsh completion ###
fpath=(~/.zsh-completions $fpath)

# keybind

zle -N zsh-peco-ghq
bindkey '^]' zsh-peco-ghq

function gi() { curl -sLw n https://www.gitignore.io/api/$@; }
