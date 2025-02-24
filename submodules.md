# git submodules
submodules are always checked out to a specific commit, not a branch

```sh
#
# Initializing a submodule
#

# (option 1) adding a library
mkdir lib
cd lib
git submodule add repo

# (option 2) moving a subdirectory to its own repo
mv repo /other/location/repo.bak
git rm --cached repo
git commit -m "delete the repo"
# create a new github repository
cd /other/location/repo.bak
git init
git -am "initial commit"
git remote add origin git@github/owner/repo.bak.git
git push -u origin main
# go back and add the submodule
cd ~/.dotfiles
git submodule add git@github/owner/repo.bak.git
git commit -m "added submodule"

# (option 3) cloning the big repo
git clone git@github:owner/repo.bak.git
cd repo.bak
git submodule --init --recursive
#OR
git clone --recurse-submodules git@github:owner/repo.bak.git

#
# Updating main with changes in submodule
#
git submodule update [--recursive] [--remote] [--merge]
git submodule update --remote --merge # update submodules (i.e. changes pushed to nvim)
git submodule update --recursive --remote # pull latest versions of all submodules
```
