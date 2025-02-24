# Anything that needs to be applied to interactive and non-interactive shells

# ⎧                                        ⎫
# ⎨  Variables, Evals, Paths               ⎬
# ⎩                                        ⎭
set -o vi
unsetopt BEEP
unsetopt LIST_BEEP

# LSCOLORS is BSD standard. used for built ins like ls
# comment this out (here, in the gdircolors in zshrc, and at the end of zshrc)
# export LSCOLORS="gxfxexahbxegedabagdxad"
# export CLICOLOR

#
# Variables
#
export VISUAL=nvim
export EDITOR=nvim
export BROWSER="firefox"
export ZDOTDIR=${HOME}/.config/zsh
export XDG_CONFIG_HOME=${HOME}/.config

#
# Evals
#
eval "$(/opt/homebrew/bin/brew shellenv)"
. "$HOME/.cargo/env"
eval "$(fzf --zsh)"

#
# My scripts
#
export PATH="${HOME}/.local/bin:${PATH}"

#
# Homebrew
#
export BREW_HOME="/opt/hombrew"
export PATH="${BREW_HOME}/bin:${PATH}"

#
# Go
#
export GOPATH=/usr/local/go/bin
export PATH=$GOPATH/bin:$PATH

#
# pyenv -- higher precedence than brew install versions
#
export PYENV_ROOT="${HOME}/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#
# Python
#
export PYTHON_HOME="/opt/homebrew/opt/python"
export PATH="${PYTHON_HOME}/libexec/bin:${PATH}"

#
# Maven
#
# export M2_HOME="${HOME}/packages/apache-magen-3.9.6"
# export PATH="${M2_HOME}/bin:${PATH}"

#
# JDK
#
export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home"
export PATH="${JAVA_HOME}/bin:${PATH}"

#
# Apache Derby
#
# export DERBY_HOME="${HOME}/packages/derby10"
# export PATH="${DERBY_HOME}/bin:${PATH}"

#
# Google Cloud CLI
#
# export GCLOUD_HOME="${HOME}/packages/google-cloud-sdk"
# export PATH="${GCLOUD_HOME}/bin:${PATH}"
# update PATH for google cloud sdk
# if [ -f '/Users/ickoxii/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ickoxii/google-cloud-sdk/path.zsh.inc'; fi
# shell command completion for gcloud
# if [ -f '/Users/ickoxii/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ickoxii/google-cloud-sdk/completion.zsh.inc'; fi

