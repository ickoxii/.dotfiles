# dotfiles

`git clone --recurse-submodules git@github.com:ickoxii/.dotfiles.git ~/.dotfiles`

just run `./macos`

# git init on new system

```
git clone --recurse-submodules https://github.com/ickoxii/.dotfiles.git ~/.dotfiles
git clone https://github.com/ickoxii/nvimrc.git ~/.dotfiles/nvimrc

sudo apt update && sudo apt upgrade
sudo apt install -y neovim tmux fzf zsh stow

# neovim dependencies
sudo apt install -y yarn gcc

chsh -s /usr/bin/zsh

cd ~/.dotfiles && ./ubuntu
```
