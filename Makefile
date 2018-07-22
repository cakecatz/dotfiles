install: ## Install applications
	sudo apt update
	sudo apt install zsh neovim git yarn apt-transport-https ca-certificates \
		curl software-properties-common

nvm: ## install nvm
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

kitty: ## install kitty
	curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

docker: ## install docker
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

rust_apps: ## install rust apps
	cargo install ripgrep bat

init: ## Create link dotfiles
	ln -vsf ${PWD}/.zsh_plugins ${HOME}/.zsh_plugins
	ln -vsf ${PWD}/.zshrc ${HOME}/.zshrc
	ln -vsf ${PWD}/.gitconfig ${HOME}/.gitconfig
	ln -vsf ${PWD}/.aliases.zsh ${HOME}/.aliases.zsh
	ln -vsf ${PWD}/zsh-completions ${HOME}/.zsh-completions

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'f

.DEFAULT_GOAL := help