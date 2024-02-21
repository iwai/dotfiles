
alias g    'git'
alias tree 'tree -CF'
alias less 'less -R'

alias j    'z'

function relogin
    set -g PATH ''
    exec $SHELL -l
end

function ls --description 'List contents of directory'
    command ls -FG $argv
end

alias brew 'PATH=(string match -v -r \'.anyenv\' $PATH) /usr/local/bin/brew'
abbr -a html-pp 'xmllint --html --format - 2>/dev/null'

function gen-string --description 'Generate random string'
    command openssl rand -base64 $argv | fold -w $argv | head -1
end
