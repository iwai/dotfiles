
# function _go_docker
#     set -q GOPATH; or set GOPATH "$HOME/go"

#     set cmd $argv[1]
#     set -e argv[1]

#     command docker run --rm -it \
#         -e GOOS=(string lower (uname -s)) \
#         -v $GOPATH:/go \
#         -w /go/(string replace -r "^$GOPATH/" "" -- (pwd)) \
#         golang1.12-alpine-plus:latest $cmd $argv
# end

# function go -d 'golang 1.12 on docker'
#     _go_docker 'go' $argv
# end

# function dep -d 'dep command on docker'
#     _go_docker 'dep' $argv
# end

# function gofmt -d 'gofmt on docker'
#     _go_docker 'gofmt' $argv
# end

function mongo-cli -d 'mongo CLI'
    command docker run --rm -it --net equalizer_default \
        --name mongo mongo:2.6.7 mongo $argv
end

function httpd-docker-run -d 'Run apache server'
    argparse 'p/port=+' -- $argv
    or return

    $_flag_port

    docker run -p 80:80 -it --rm -v (pwd):/var/www/html -v $HOME/._dotfiles/.config/fish/misc/httpd.conf:/etc/apache2/sites-enabled/apache2.conf php:7-apache
    /Users/iwai/._dotfiles/.config/fish/misc/httpd.conf
end

function docker-clean-images -d 'Remove <none> images'
    docker rmi (docker images -f "dangling=true" -q)
end

function docker-instant -d 'One time docker run to shell'
    set -q cmd $argv[2]
    or set cmd '/bin/bash'

    command docker run --rm -it $argv[1] $cmd
end

# http://interconnectit.com/products/search-and-replace-for-wordpress-databases/
function wp-srdb -d 'Database Search and Replace Script'
    argparse 'n/net=+' -- $argv
    or return

    command docker run --rm -it --net $_flag_net \
    --name wp-srdb thedxw/srdb srdb $argv
end

function mysql-import -d 'Import for docker mysql'
    argparse 'n/net=+' 'f/file=+' 'd/database=+' -- $argv
    or return

    command cat $_flag_file | docker run -i --rm --network $_flag_net mysql:5.6 mysql -h mysql -u root -ppassword $_flag_database
end
