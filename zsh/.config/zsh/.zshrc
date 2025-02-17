# Anything for interactive shells.
# Plugins, keybinds, prompts, etc.

# ⎧                                        ⎫
# ⎨  Init stuff                            ⎬
# ⎩                                        ⎭
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

# Grab plugins
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
# zinit light Aloxaf/fzf-tab

# Get snippets
zinit snippet OMZP::command-not-found
zinit snippet OMZP::safe-paste

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
# bindkey '^f' autosuggest-accept # TODO switch to emacs mode?
# bindkey '^n' history-search-forward
# bindkey '^p' history-search-backward

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

# Launch new instance in tmux session
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  # Attach to latest default session
  DETACHED=$(tmux list-sessions | grep -E "^inst-[0-9]+:.*$" | grep -v "(attached)" | sort -nr | head -n 1 | sed -E "s/^inst-([0-9]+):.*$/\1/")
  if [ -n "$DETACHED" ]; then
    tmux attach-session -t "inst-$DETACHED"
    exit
  fi

  # If there is an attached session, increment its id and create new session
  ATTACHED=$(tmux list-sessions | grep -E "^inst-[0-9]+:.*\(attached\)$" | sort -nr | head -n 1 | sed -E "s/^inst-([0-9]+):.*$/\1/")
  if [ -n "$ATTACHED" ]; then
    tmux new-session -s "inst-$(expr $ATTACHED + 1)"
    exit
  fi

  # Fine, I'll do it myself
  tmux new-session -s "inst-0"
fi
