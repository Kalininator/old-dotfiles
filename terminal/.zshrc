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
alias cr="cargo run"
alias k="kubectl"
alias ap="ansible-playbook"
alias $=""

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
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
source $HOME/.zshenv

ulimit -Sn 10240
