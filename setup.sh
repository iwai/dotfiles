#!/usr/bin/env bash

set -euo pipefail

: ${DOTFILES_DIR:=${HOME}/._dotfiles}
BACKUP_DIR=${DOTFILES_DIR}/._backup/$(date +%Y%m%d)
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
            if [ ! -L "${HOME}/$dotfile" ]; then
                echo -n "Backup "
                mv -nfv ${HOME}/$dotfile ${BACKUP_DIR}
            fi
            echo -n "Linked "
            ln -snfv ${DOTFILES_DIR}/$dotfile ${HOME}
            ;;
    esac
done

echo Load environment
source $HOME/.profile

OS=$(uname -s)

if [ -e ${SCRIPTS_DIR}/$OS.sh ]; then
    ${SCRIPTS_DIR}/$OS.sh
fi

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fish -c "fisher add < ${XDG_CONFIG_HOME}/fish/fishfile"

echo Initial load spacemacs
emacs --batch -l ~/.emacs.d/init.el 2>> setup.log

