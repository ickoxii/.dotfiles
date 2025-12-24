# dotfiles

`git clone --recurse-submodules git@github.com:ickoxii/.dotfiles.git ~/.dotfiles`

just run `./macos`

# git init on new system

```
git \
  -c url."https://github.com/".insteadOf=git@github.com: \
  -c url."https://github.com/".insteadOf=ssh://git@github.com/ \
  clone --recurse-submodules git@github.com:ickoxii/.dotfiles.git ~/.dotfiles

sudo apt update && sudo apt upgrade
sudo apt install -y neovim tmux fzf zsh stow

# neovim dependencies
sudo apt install -y yarn gcc

chsh -s /usr/bin/zsh

cd ~/.dotfiles && ./ubuntu
```
