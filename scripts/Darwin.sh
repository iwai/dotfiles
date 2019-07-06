#!/usr/bin/env bash

set -euo pipefail

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.iterm2"
# defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
