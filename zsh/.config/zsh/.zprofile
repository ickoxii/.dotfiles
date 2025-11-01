# .zprofile
# Login shell setup

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Homebrew
# export BREW_HOME="/opt/homebrew"
# export PATH="${BREW_HOME}/bin:${PATH}"

# Rust
if [ -f "$HOME/.cargo/env" ]; then
  source "$HOME/.cargo/env"
fi

# pyenv -- higher precedence than brew install versions
export PYENV_ROOT="${HOME}/.pyenv"
[[ -d "${PYENV_ROOT}/bin" ]] && export PATH="$PYENV_ROOT/bin:$PATH"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
