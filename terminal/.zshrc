export VISUAL=vim
export EDITOR=$VISUAL

export TERM="xterm-256color"
export ZSH="/Users/kal/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

export PATH=${HOME}/go/bin:$PATH
# export GOPATH="${HOME}/.go"
# export GOROOT="$(brew --prefix golang)/libexec"
# export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status )
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

unsetopt share_history

plugins=(
  git
)

alias tnew="tmux new -s"
alias ta="tmux a -t"
alias tkill="tmux kill-session -t"
alias tls="tmux ls"
alias v="nvim"
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
