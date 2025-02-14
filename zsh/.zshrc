# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ⎧                                        ⎫
# ⎨  Dev setup                             ⎬
# ⎩                                        ⎭
export EDITOR=nvim
export ZDOTDIR=${HOME}/.config/zsh

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Rust
. "$HOME/.cargo/env"

# My scripts
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

# ⎧                                        ⎫
# ⎨  Init stuff                            ⎬
# ⎩                                        ⎭
# Set directory for zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zsharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Grab plugins
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab

# Get snippets
zinit snippet OMZP::command-not-found
zinit snippet OMZP::safe-paste
zinit snippet OMZP::rust

# Snippets to check out
# zinit snippet OMZP::colored-man-pages
# zinit snippet OMZP::macos
# zinit snippet OMZP::yarn

# Load completions
autoload -U compinit && compinit

# Reloads all cached completions? idk man recommended by the friendly manual
zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ⎧                                        ⎫
# ⎨  Shell integrations                    ⎬
# ⎩                                        ⎭
eval "$(fzf --zsh)"

# ⎧                                        ⎫
# ⎨  Keybindings                           ⎬
# ⎩                                        ⎭
bindkey '^f' autosuggest-accept # TODO switch to emacs mode?
bindkey '^n' history-search-forward
bindkey '^p' history-search-backward

# ⎧                                        ⎫
# ⎨  Globals                               ⎬
# ⎩                                        ⎭
# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # ignore case on completions
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Source aliases
[[ -f ~/.config/zsh/.zaliases ]] && source ~/.config/zsh/.zaliases

