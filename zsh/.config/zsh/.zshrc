# Anything for interactive shells.
# Plugins, keybinds, prompts, etc.
# https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout

if [[ -n "$container" ]] || [[ -n "$DOCKER_CONTAINER" ]] || [[ "$ZSH_MINIMAL" == "1" ]]; then
  source ~/.config/zsh/.zshrc.minimal
  return
fi

# ⎧                                        ⎫
# ⎨  Init stuff                            ⎬
# ⎩                                        ⎭
# ZSH_THEME="common"
# if [ -f ~/.dircolors ] && command -v gdircolors > /dev/null 2>&1; then
#   eval "$(gdircolors -b ~/.dircolors)"
# fi
set -o vi

# init fzf
if command -v fzf >/dev/null 2>&1; then
  eval "$(fzf --zsh)"
fi

# init pyenv
if command -v pyenv; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

export PATH

# Set directory for zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  # git clone https://github.com/zsharma-continuum/zinit.git "$ZINIT_HOME"
  git clone git@github.com:zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

#
# fpath for pass completion
#   i would love for this to be in ~/.zshenv but i have a sneaking
#   suspicion that `zinit.zsh` overwrites the fpath.
#
export BREW_SHARE="/opt/homebrew/share"
export BREW_ZSF="/opt/homebrew/share/zsh/site-functions"
export FPATH="${BREW_SHARE}:${BREW_ZSF}:${FPATH}"

# Get prompt
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Grab plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
# zinit light Aloxaf/fzf-tab

# Get snippets
zinit snippet OMZP::command-not-found
zinit snippet OMZP::safe-paste
# zinit snippet OMZP::virtualenv

# Snippets to check out
# zinit snippet OMZP::colored-man-pages
# zinit snippet OMZP::macos
# zinit snippet OMZP::yarn

# Load completions
autoload -U compinit && compinit

# Reloads all cached completions? idk man recommended by the friendly manual
zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# ⎧                                        ⎫
# ⎨  Keybindings                           ⎬
# ⎩                                        ⎭
# For use with fzf-tab
bindkey '^y' autosuggest-accept # TODO switch to emacs mode?
bindkey '^n' history-search-forward
bindkey '^p' history-search-backward

if command -v tmux-sessionizer &> /dev/null && [[ -z $TMUX ]]; then
  # create zsh widget for tmux-sessionizer
  function _run() {
    BUFFER="tmux-sessionizer"
    zle accept-line
  }
  zle -N _run
  bindkey '^f' _run;
fi

# ⎧                                        ⎫
# ⎨  Globals                               ⎬
# ⎩                                        ⎭
# Completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # ignore case on completions
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

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

# Source aliases
[[ -f ~/.config/zsh/.zaliases ]] && source ~/.config/zsh/.zaliases
