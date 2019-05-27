.PHONY: all
all: ## Install all
	install nvm zsh_plugins init

install: ## Install applications
	sudo apt update
	sudo apt install zsh neovim git yarn apt-transport-https ca-certificates \
		curl software-properties-common xclip xsel

nvm: ## install nvm
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

docker: ## install docker
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

rust_apps: ## install rust apps
	cargo install ripgrep bat fd exa

zsh_plugins: ## output static plugin loading sh
	antibody bundle < ./.zsh_plugins > ${HOME}/.zsh_plugins.sh

init: ## Create link dotfiles
	ln -vsf ${PWD}/.zshrc ${HOME}/.zshrc
	ln -vsf ${PWD}/.gitconfig ${HOME}/.gitconfig
	ln -vsf ${PWD}/.aliases.zsh ${HOME}/.aliases.zsh
	ln -vsf ${PWD}/zsh-completions ${HOME}/.zsh-completions

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'f

.DEFAULT_GOAL := help