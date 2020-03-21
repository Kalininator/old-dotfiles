export VISUAL=vim
export EDITOR=$VISUAL

export TERM="xterm-256color"
export ZSH="/Users/kal/.oh-my-zsh"
# ZSH_THEME="miloshadzic"
source $ZSH/oh-my-zsh.sh

source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history time)

unsetopt share_history

plugins=(
  git
)

alias tnew="tmux new -s"
alias ta="tmux a -t"
alias tkill="tmux kill-session -t"
alias tls="tmux ls"
alias v="vim"
alias r="ranger"
alias wttr="curl wttr.in/London"
alias ccli="connector-cli"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey -v

function cdcon() {
	cd ~/Documents/Github/connectors/$1
}

function cdgit() {
	cd ~/Documents/Github/$1
}

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
