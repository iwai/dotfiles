# Add bash aliases.
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
    source ~/.bash_functions
fi

if [ -f ~/.anyenv-init-bash -a -z "$BASH_EXECUTION_STRING" ]; then
    source ~/.anyenv-init-bash
fi

# Emacsからの起動は .bash_profile 読み込まれないのでこちらで fish を起動
# 条件が無いと常に fish が起動して Bash 単体で利用できなくなるので
if [ -n "$INSIDE_EMACS" -a -z "$BASH_EXECUTION_STRING" ]; then
    exec fish
fi
