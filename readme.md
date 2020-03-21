## Requirements
### Homebrew
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
### Ansible
`brew install ansible`
## Installation
```
git clone https://github.com/Kalininator/dotfiles.git ~/.dotfiles
cd ~/.dotfiles/ansible
ansible-playbook setup.yml
cd ~/.dotfiles
stow terminal
stow vim
```
