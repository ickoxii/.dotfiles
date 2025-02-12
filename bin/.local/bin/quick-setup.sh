#!/usr/bin/env bash

VIM_FILES=".vimrc .vim/remaps.vim"
BASH_FILES=".bash_profile"

for file in $VIM_FILES; do
  scp -P 2222 ~/.dotfiles/vim/$file ickoxii@127.0.0.1:~/$file
done

for file in $BASH_FILES; do
  scp -P 2222 ~/.dotfiles/bash/$file ickoxii@127.0.0.1:~/$file
done
