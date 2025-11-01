# Anything that needs to be applied to interactive and non-interactive shells
# TODO: zsh injects system path after .zshenv but before .zshrc
#   -> homebrew path ends up after /usr/bin

# ⎧                                        ⎫
# ⎨  Variables, Evals, Paths               ⎬
# ⎩                                        ⎭
unsetopt BEEP
unsetopt LIST_BEEP

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

# My scripts
export PATH="${HOME}/.local/bin:${PATH}"

# Go
export GOPATH="/usr/local/go/bin"
export PATH="$GOPATH/bin:$PATH"

# Maven
export M2_HOME="${HOME}/packages/apache-maven-3.9.6"
export PATH="${M2_HOME}/bin:${PATH}"

# JDK
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-22.jdk/Contents/Home"
export PATH="${JAVA_HOME}/bin:${PATH}"

# Apache Derby
# export DERBY_HOME="${HOME}/packages/derby10"
# export PATH="${DERBY_HOME}/bin:${PATH}"

# Google Cloud CLI
if [ -d "${HOME}/packages/google-cloud-sdk" ]; then
  export GCLOUD_HOME="${HOME}/packages/google-cloud-sdk"
  export PATH="${GCLOUD_HOME}/bin:${PATH}"

  # update PATH for google cloud sdk
  [[ -f '/Users/ickoxii/google-cloud-sdk/path.zsh.inc' ]] && source '/Users/ickoxii/google-cloud-sdk/path.zsh.inc'

  # shell command completion for gcloud
  [[ -f '/Users/ickoxii/google-cloud-sdk/completion.zsh.inc' ]] && source '/Users/ickoxii/google-cloud-sdk/completion.zsh.inc'
fi

# DEL


# Python
export PYTHON_HOME="/opt/homebrew/opt/python"
export PATH="${PYTHON_HOME}/libexec/bin:${PATH}"
