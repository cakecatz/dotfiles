install: ## Install applications
	sudo apt update
	sudo apt install zsh neovim git yarn

init: ## Create link dotfiles
	ln -vsf ${PWD}/.xprofile ${HOME}/.xprofile
	ln -vsf ${PWD}/.Xmodmap ${HOME}/.Xmodmap
	ln -vsf ${PWD}/.zsh_plugins ${HOME}/.zsh_plugins
	ln -vsf ${PWD}/.zshrc ${HOME}/.zshrc
	ln -vsf ${PWD}/.gitconfig ${HOME}/.gitconfig

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'f

.DEFAULT_GOAL := help