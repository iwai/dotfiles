
# Add bash aliases.
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
    source ~/.bash_functions
fi

# Emacsからの起動は .bash_profile 読み込まれないのでこちらで fish を起動
if test -n "$INSIDE_EMACS" && test -z "$BASH_EXECUTION_STRING"; then
    exec fish
fi

if [ -f ~/.anyenv-init-bash ]; then
    source ~/.anyenv-init-bash
fi
