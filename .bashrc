# Add bash aliases.
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
    source ~/.bash_functions
fi

if [ -f ~/.anyenv-init-bash ]; then
    source ~/.anyenv-init-bash
fi

if [ -z "$BASH_EXECUTION_STRING" ]; then
    exec fish
fi
