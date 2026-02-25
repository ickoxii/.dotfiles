# .zprofile
# Login shell setup

# homebrew (static exports to avoid spawning brew on every login shell)
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"
[ -z "${MANPATH-}" ] || export MANPATH=":${MANPATH#:}"
fpath[1,0]="/opt/homebrew/share/zsh/site-functions"
eval "$(/usr/bin/env PATH_HELPER_ROOT="/opt/homebrew" /usr/libexec/path_helper -s)"

# Homebrew
# export BREW_HOME="/opt/homebrew"
# export PATH="${BREW_HOME}/bin:${PATH}"

# Rust
if [ -f "$HOME/.cargo/env" ]; then
  source "$HOME/.cargo/env"
fi

# pyenv -- higher precedence than brew install versions
# PYENV_ROOT is defined in .zshenv; only add bin to PATH here
[[ -d "${PYENV_ROOT}/bin" ]] && export PATH="$PYENV_ROOT/bin:$PATH"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
