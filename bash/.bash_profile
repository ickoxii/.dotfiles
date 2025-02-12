# file: .bash_profile
# author: Icko Iben
# course: CSI 3336
# due date: 09/08/2024
#
# date modified:        11/09/2024
#   * git branch added to prompt
# date modified:        09/07/2024
#   * Added pre-file comment
#   * not able to turn off error bell on this machine
# date modified:        09/05/2024
#   * File created
#   * Set PS1
#   * Add ~/bin to path
#   * Set PRINTER variable
#   * Source aliases
#   * Turn off error bell


[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"   # Package manager for Rust

alias ls='ls --color=auto'
alias la='ls -lA'
alias ll='ls -l'
alias l='ls -lA'
alias paps='paps --cpi=13.33 --font="Monospace 10" --left-margin=36 --right-margin=36'
alias gccarg='gcc -Wall -Werror -Wextra -Wpedantic --std=gnu89'
alias grep='grep --color=auto'
alias gst='git status'
alias ffs='sudo $(fc -ln -1)'
alias cdir='cd "${_%/*}"'

eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(fzf --bash)"

export BASH_SILENCE_DEPRECATION_WARNING=1
export PRINTER='csh-308-bw'

export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/Library/Python/3.9/bin"

# >>>> PROMPT >>>>
parse_git_branch() {
    git rev-parse --abbrev-ref HEAD 2> /dev/null
}

parse_git_status() {
    local status="$(git status --porcelain 2> /dev/null)"
    local ahead_behind="$(git rev-list --left-right --count HEAD...@{u} 2> /dev/null)"
    local ahead=$(echo $ahead_behind | awk '{print $1}')
    local behind=$(echo $ahead_behind | awk '{print $2}')

    if [[ -n $status ]]; then
        echo "*"
    fi

    if [[ -n $ahead ]] && [[ $ahead -gt 0 ]]; then
        echo "↑$ahead"
    fi

    if [[ -n $behind ]] && [[ $behind -gt 0 ]]; then
        echo "↓$behind"
    fi
}

git_prompt() {
    local branch=$(parse_git_branch)
    local status=$(parse_git_status)

    if [[ -n $branch ]]; then
        echo " ($branch$status)"
    fi
}

PS1="[\u@\h]"       # username@hostname
PS1+=" \w"          # working directory
PS1+="\[\033[32m\]\$(git_prompt)\[\033[00m\]"
PS1+="\n"           # newline
PS1+="\$ "          # prompt
export PS1
# <<<< PROMPT <<<<
