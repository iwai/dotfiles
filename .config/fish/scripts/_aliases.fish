
alias g    'git'
alias tree 'tree -CF'
alias less 'less -R'

function relogin
    set -g PATH ''
    exec $SHELL -l
end
