### ALIASE ###
alias s="git status"
alias reload="source ~/.zshrc"
alias ls="exa"
alias cat="bat"
alias v='nvim'
alias search="rg \
	--color='always' \
	--heading \
	--line-number \
	--no-messages \
	--no-ignore \
	--hidden \
	--follow \
	--smart-case \
	--glob '!{.git/*,node_modules/*}' \
	--regexp"