
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
function docker-instant -d 'One time docker run to shell'
    set -q cmd $argv[2]
    or set cmd '/bin/bash'

    command docker run --rm -it $argv[1] $cmd
end
