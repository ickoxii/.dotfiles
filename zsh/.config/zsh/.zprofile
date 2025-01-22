# File: .zprofile
# Author: Icko Iben
# Date Created: 14 November 2023
# Date Last Modified: 14 July 2024
# 
# Sourced only for login shell
# 
# On macOS, it is recommended to set path variables in .zprofile to avoid
# potential conflicts with the system's path helper.

# ==================
# >>>> ENV VARS >>>>
# ==================

export EDITOR=nvim

# ===============
# >>>> Paths >>>>
# ===============

# Path to my own scripts
export PATH="${HOME}/.local/bin:${PATH}"

# My scripts
# export PATH="/Users/ickoxii/.local/scripts:${PATH}"

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Pyenv -- Should have higher precedence than brew installed versions
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Python
export PYTHON_HOME="/opt/homebrew/opt/python"
export PATH="${PYTHON_HOME}/libexec/bin:${PATH}"

# FZF
source <(fzf --zsh)

# Maven
export M2_HOME="/Users/ickoxii/packages/apache-maven-3.9.6"
export PATH="${M2_HOME}/bin:${PATH}"

# JAVA_HOME (for JDK)
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home"
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-22.jdk/Contents/Home"
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home"
export PATH="${JAVA_HOME}/bin:${PATH}"

# GO!
export PATH="/usr/local/go/bin:${PATH}"

# Apache Derby
export DERBY_HOME="/Users/ickoxii/packages/derby10"
export PATH="${DERBY_HOME}/bin:${PATH}"

# Google Cloud CLI
export GCLOUD_HOME="/Users/ickoxii/packages/google-cloud-sdk"
export PATH="${GCLOUD_HOME}/bin:${PATH}"

# ======================
# >>>> MISC CONFIGS >>>>
# ======================

# ZSH completions for pass
FPATH=$(brew --prefix)/share/zsh-completions:$(brew --prefix)/share/zsh/site-functions:$FPATH

