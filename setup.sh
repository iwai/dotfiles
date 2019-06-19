#!/bin/sh

echo $0

cd $(dirname $0)
DOTFILES_DIR=$(pwd)

# Link all dotfiles into home directory
# for dotfile in .*; do
#     case $dotfile in
#         .|..|.git|.gitmodules)
#         ;;
#         *)
#             echo ln -svi ${DOTFILES_DIR}/$dotfile ${HOME}
#             ;;
#     esac
# done

#if [[ `uname` == 'Darwin' ]]
#then
#    defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.iterm2"
#    defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
#fi
