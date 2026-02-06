#!/usr/bin/env bash

# ISSUES
# 001 - git@github.com: Permission denied
#   Just run a ssh -T git@github.com????

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <project dir>"
    exit
fi

ssh -T git@github.com

project=$1

echo -e "Log for $(date '+%Y-%m-%d %H:%M:%S')"

cd ${project} || exit

current_branch=$(git branch --show-current)
branches=$(git --no-pager branch | grep -v 'main' | sed "s/\*//" | awk '{print $1}')

# Stash current changes
git stash

git checkout main
git fetch --all && git pull origin main

# Perhaps bad if I have not committed/pushed changes in my current branch before merging
for branch in ${branches}; do
    echo -e "\033[0;34m>>Checking out into ${branch}\033[0m"
    git checkout ${branch}
    git stash

    current_date=$(date "+%Y-%m-%d")
    current_time=$(date "+%H:%M:%S")

    if git merge --no-edit main -m "$(git --no-pager log -1 --pretty=%B) -- cron merge on ${current_date} at ${current_time}"; then
        echo -e "\033[0;32mMerged main into branch: ${branch}\033[0m"
    else
        echo -e "\033[0;31mMerge failed for branch: ${branch}\033[0m"
        echo -e "If you have no important changes, run:"
        echo -e "git merge --abort"
        echo -e "git reset --hard HEAD"
    fi

    git stash pop
done

echo -e "\nGoing back to branch ${current_branch}"
git checkout ${current_branch}

git stash pop
