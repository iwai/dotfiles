#!/usr/bin/env bash

set -euo pipefail

: ${DOTFILES_DIR:=${HOME}/._dotfiles}
BACKUP_DIR=${DOTFILES_DIR}/._backup
SCRIPTS_DIR=${DOTFILES_DIR}/scripts

# git clone https://github.com/iwai/dotfiles.git ${DOTFILES_DIR}

cd ${DOTFILES_DIR}

mkdir -p ${BACKUP_DIR}

# Link all dotfiles into home directory
for dotfile in .*; do
    case $dotfile in
        .|..|.git|.gitmodules|.gitignore|._backup)
            ;;
        *)
            if [ -e "${HOME}/$dotfile" ]; then
                echo -n "Backup "
                mv -nfv ${HOME}/$dotfile ${BACKUP_DIR}
            fi
            echo -n "Linked "
            ln -snfv ${DOTFILES_DIR}/$dotfile ${HOME}
            ;;
    esac
done

OS=$(uname -s)

if [ -e ${SCRIPTS_DIR}/$OS.sh ]; then
    ${SCRIPTS_DIR}/$OS.sh
fi

echo Initial load spacemacs
emacs --batch -l ~/.emacs.d/init.el 2> emacs-init.log

# osascript -e 'tell application "Finder" to make alias file to POSIX file "/Applications/Xcode.app/Contents/Applications/OpenGL ES Performance Detective.app" at POSIX file "/Users/mylogin/Applications"'
