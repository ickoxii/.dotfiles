# Anything that needs to be applied to interactive and non-interactive shells
# TODO: zsh injects system path after .zshenv but before .zshrc
#   -> homebrew path ends up after /usr/bin

# ⎧                                        ⎫
# ⎨  Variables, Evals, Paths               ⎬
# ⎩                                        ⎭
# LSCOLORS is BSD standard. used for built ins like ls
# comment this out (here, in the gdircolors in zshrc, and at the end of zshrc)
# export LSCOLORS="gxfxexahbxegedabagdxad"
# export CLICOLOR

#
# Variables
#
export VISUAL=vim
export EDITOR=vim
export BROWSER="firefox"
export ZDOTDIR=${HOME}/.config/zsh
export XDG_CONFIG_HOME=${HOME}/.config
export PAGER=less

# TMPDIR must be available to all processes, not just interactive shells
export TMPDIR=$(getconf DARWIN_USER_TEMP_DIR)

# pyenv root must be in .zshenv so non-login and non-interactive shells can find it
export PYENV_ROOT="${HOME}/.pyenv"

# My scripts
export PATH="${HOME}/.local/bin:${PATH}"

# Go
export GOPATH="/usr/local/go/bin"
export PATH="$GOPATH/bin:$PATH"

# Maven
export M2_HOME="${HOME}/packages/apache-maven-3.9.6"
export PATH="${M2_HOME}/bin:${PATH}"

# JDK -- using SDKMAN now
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home"
# export PATH="${JAVA_HOME}/bin:${PATH}"

# SDKMan
export SDKMAN_HOME="${HOME}/.sdkman"

# Apache Derby
# export DERBY_HOME="${HOME}/packages/derby10"
# export PATH="${DERBY_HOME}/bin:${PATH}"

# Python
export PYTHON_HOME="/opt/homebrew/opt/python"
export PATH="${PYTHON_HOME}/libexec/bin:${PATH}"

# Conda
# export CONDA_HOME="/opt/miniconda3"
# export PATH="${CONDA_HOME}/bin:${PATH}"
