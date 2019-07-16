

if status --is-login
    builtin source $fisher_path/env.fish
end

# loading source
for file in $fisher_path/scripts/*.fish
    builtin source $file 2> /dev/null
end

# appearance
set theme_date_format "+%m/%d %H:%M:%S"

if test $SHLVL -eq 1 ; and test -z "$INSIDE_EMACS"
   command tmux
end

