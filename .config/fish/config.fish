
if status --is-login
    source $XDG_CONFIG_HOME/fish/env.fish
end

# loading source
for file in $XDG_CONFIG_HOME/fish/scripts/*.fish
    source $file
end

source $XDG_CONFIG_HOME/fish/keybindings.fish

# appearance
set theme_date_format "+%m/%d %H:%M:%S"


if test $SHLVL -eq 1 ; and test -z "$INSIDE_EMACS"
   command tmux
end

