#!/usr/bin/env bash

set -euo pipefail

## Homebrew

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

cd $(dirname $0)

brew bundle

EMACS_APP=$(brew --prefix emacs-plus)/Emacs.app

if [ -e $EMACS_APP ]; then

    cat <<__SCRIPT__ | osascript
tell application "Finder"
     make new alias file to POSIX file "$EMACS_APP" at POSIX file "/Applications"
end tell
__SCRIPT__

fi

## OSX defaults write

# defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.iterm2"
# defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
