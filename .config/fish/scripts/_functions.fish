

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

function uridecode -d 'URI decode'
    ruby -r cgi -ne 'print CGI.unescape $_'
end

function uriencode -d 'URI encode'
    ruby -r cgi -ne 'print CGI.escape $_'
end

function archive -d 'Archive directory'
    set src_dir (string replace -r '/$' '' $argv[1])
    set -e argv[1]

    [ ! -d $src_dir ]
    and echo $_: \'$src_dir\' is not a directory
    and return 1

    if [ -e "$src_dir.tar.gz" ]
        confirm --message "override $src_dir.tar.gz?"
        or return 0
    end

    if ! command -v pv &> /dev/null
        echo $_: pv was not found.
        return 1
    end

    set size (expr (command du -sk $src_dir | awk '{print $1}') "*" 1024)

    command tar cf - $src_dir | pv -s $size | gzip > $src_dir.tar.gz
    or return $status

    confirm --message "remove $src_dir?"
    or return 0

    rm -rf $src_dir

    return 0
end

function wget-page -d 'Save a single web page'
    wget -o wget-page.log -q --show-progress --page-requisites --adjust-extension --no-host-directories --convert-links -e robots=off $argv
    echo logged wget-page.log

    confirm --message "remove query string from filename?"
    or return 0

    for f in (find . -type f -name "*\?*")
        set filename (echo $f | cut -d \? -f1)
        echo $f $filename
        mv $f $filename
    end
end

function ffmpeg-mov2mp4 -d 'Convert mov file to mpeg4'
    set srcfile $argv[1]
    set -e argv[1]
    set destfile (string replace -r '.mov$' '.mp4' $srcfile)

    command ffmpeg -loglevel quiet -stats -i $srcfile -vcodec h264 -acodec aac $destfile
    or return $status
end

# function tidy-pp
# tidy -q -w 0 -ashtml 2>/dev/null
