

function ssl-expire-date
    echo | openssl s_client -connect $1:443 -servername $1 2>/dev/null | openssl x509 -noout -enddate
end

function e -d 'Open specified file in Emacs'
    set filepath $argv[1]
    set -e argv[1]
    set options $argv[2]
    set -e argv[2]

    if [ -z $filepath ]
        command open -a Emacs
    end

    if not string match -r '^/' $filepath >/dev/null
        set filepath (pwd)/$filepath
    end

    command emacsclient --no-wait $options --alternate-editor="open -a Emacs --args --file" $filepath 2>/dev/null

    return 0
end

function wd -a path -d 'Change directory in working directory'
    set -l git_toplevel (command git rev-parse --show-toplevel 2>/dev/null)

    [ -z "$git_toplevel" ]
    and cd $WD_ROOT
    and return 0

    test -x "$git_toplevel/$path"
    and cd "$git_toplevel/$path"
end

function man -d 'Colored man page'

    command env \
      LESS_TERMCAP_mb=(printf "\e[01;31m")    \
      LESS_TERMCAP_md=(printf "\e[01;31m")    \
      LESS_TERMCAP_me=(printf "\e[0m")        \
      LESS_TERMCAP_se=(printf "\e[0m")        \
      LESS_TERMCAP_so=(printf "\e[00;47;30m") \
      LESS_TERMCAP_ue=(printf "\e[0m")        \
      LESS_TERMCAP_us=(printf "\e[01;32m")    \
      /usr/bin/man "$argv"

end

