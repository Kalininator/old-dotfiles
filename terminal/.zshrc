export VISUAL="nvim"
# export VISUAL="code -w"
export EDITOR=$VISUAL

export TERM="xterm-256color"
export ZSH="/Users/kal/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

export PATH=${HOME}/go/bin:$PATH
# export GOPATH="${HOME}/.go"
# export GOROOT="$(brew --prefix golang)/libexec"
# export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme
source /opt/homebrew/opt/powerlevel9k/powerlevel9k.zsh-theme
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status )
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

unsetopt share_history

plugins=(
  git
  zsh-autosuggestions
)

alias tnew="tmux new -s"
alias ta="tmux a -t"
alias tkill="tmux kill-session -t"
alias tls="tmux ls"
alias v="nvim"
alias vim="nvim"
alias ccli="connector-cli"
alias r="ranger"
alias wttr="curl wttr.in/London"
alias br="/Users/kal/Documents/GitHub/connector-cli/bin/run"
alias python="python3"

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

export NVM_DIR="$HOME/.nvm"
    [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
eval 
CONNECTOR_CLI_AC_ZSH_SETUP_PATH=/Users/kal/Library/Caches/@trayio/connector-cli/autocomplete/zsh_setup && test -f $CONNECTOR_CLI_AC_ZSH_SETUP_PATH && source $CONNECTOR_CLI_AC_ZSH_SETUP_PATH; # connector-cli autocomplete setup
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
export PATH="/Users/kal/.gem/ruby/3.0.0/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
