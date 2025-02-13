#=============================
# >>>> p10k configuration >>>>
#=============================

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" # fi
 
source $ZDOTDIR/.oh-my-zshrc
 
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh

# Set theme
ZSH_THEME="common"


#============================
# >>>> My Configurations >>>>
#============================

# Turn off the god-forsaken beeping
unsetopt BEEP
unsetopt LIST_BEEP

# Move location of zcompdump files
# $ZSH = ~/.oh-my-zsh/
export ZSH_COMPDUMP=~/.zsh-cache/.zcompdump-$HOST

# Source aliases
[[ ! -f $ZDOTDIR/.zaliases ]] || source $ZDOTDIR/.zaliases

# Load custom prompt
# [[ ! -f $ZDOTDIR/.zprompt ]] || source $ZDOTDIR/.zprompt

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ickoxii/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ickoxii/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ickoxii/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ickoxii/google-cloud-sdk/completion.zsh.inc'; fi

# Dracula flow baby
# drac

#========================
# >>>> Env Variables >>>>
#========================

# Display for x11 (xquartz) GUI docker containers
set DISPLAY=10.1.30.1:0.0

# Pyenv
if command -v pyenv 1>/dev/null 2>&1; then
   eval "$(pyenv init -)"
fi


# Color debugging for default terminal
# export TERM="xterm-256color"
# export CLICOLOR=1

#====================
# >>>> Functions >>>>
#====================

# The following two functions are related to key press and holds on macOS.
# Typically when a key is held, it will bring up an option menu with
# various accents (i.e. holding 'e' might show options for è, é, ê, ë).
noSpecChar() {
  defaults write -g ApplePressAndHoldEnabled -bool false
}
setSpecChar() {
  defaults write -g ApplePressAndHoldEnabled -bool true
}

tmux_sessionizer_widget() {
  ~/.local/bin/tmux-sessionizer
}
zle -N tmux_sessionizer_widget

# ==================
# >>>> Keybinds >>>>
# ==================

bindkey '^F' tmux_sessionizer_widget
