alias ls='ls --color=auto'
alias la='ls -lA'
alias ll='ls -l'
alias l='ls -lA'
alias gs='git status'
alias ffs='sudo $(fc -ln -1)'
alias cdir='cd "${_%/*}"'
alias grep='grep --color=auto'

export PATH="$PATH:$HOME/bin"

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
        echo "^$ahead"
    fi

    if [[ -n $behind ]] && [[ $behind -gt 0 ]]; then
        echo "v$behind"
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
