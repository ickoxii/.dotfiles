# Anything that needs to be applied to interactive and non-interactive shells

# ⎧                                        ⎫
# ⎨  Variables, Evals, Paths               ⎬
# ⎩                                        ⎭
set -o vi

# Variables
export VISUAL=nvim
export EDITOR=nvim
export TERM="tmux-256color"
export BROWSER="firefox"
export ZDOTDIR=${HOME}/.config/zsh
# export ZDOTDIR="$HOME"

# Evals
eval "$(/opt/homebrew/bin/brew shellenv)"
. "$HOME/.cargo/env"
eval "$(fzf --zsh)"

# Paths
export PATH="${HOME}/.local/bin:${PATH}"

# Go
export GOPATH=/usr/local/go/bin
export PATH=$GOPATH/bin:$PATH

# pyenv -- higher precedence than brew install versions
export PYENV_ROOT="${HOME}/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Python
export PYTHON_HOME="/opt/homebrew/opt/python"
export PATH="${PYTHON_HOME}/libexec/bin:${PATH}"

# Maven
export M2_HOME="${HOME}/packages/apache-magen-3.9.6"
export PATH="${M2_HOME}/bin:${PATH}"

# JDK
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home"
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-22.jdk/Contents/Home"
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home"
export PATH="${JAVA_HOME}/bin:${PATH}"

# Apache Derby
export DERBY_HOME="${HOME}/packages/derby10"
export PATH="${DERBY_HOME}/bin:${PATH}"

# Google Cloud CLI
export GCLOUD_HOME="${HOME}/packages/google-cloud-sdk"
export PATH="${GCLOUD_HOME}/bin:${PATH}"
