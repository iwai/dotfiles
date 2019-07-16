source "/usr/local/Cellar/anyenv/1.1.0/libexec/../completions/anyenv.fish"
function anyenv
  set command $argv[1]
  set -e argv[1]

  command anyenv "$command" $argv
end
set -x GOENV_ROOT "/Users/iwai/.anyenv/envs/goenv"
set -x PATH $PATH "/Users/iwai/.anyenv/envs/goenv/bin"
set -gx PATH '/Users/iwai/.anyenv/envs/goenv/shims' $PATH
set -gx GOENV_SHELL fish
source '/Users/iwai/.anyenv/envs/goenv/libexec/../completions/goenv.fish'
command goenv rehash 2>/dev/null
function goenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    source (goenv "sh-$command" $argv|psub)
  case '*'
    command goenv "$command" $argv
  end
end
goenv rehash --only-manage-paths
set -x PYENV_ROOT "/Users/iwai/.anyenv/envs/pyenv"
set -x PATH $PATH "/Users/iwai/.anyenv/envs/pyenv/bin"
set -gx PATH '/Users/iwai/.anyenv/envs/pyenv/shims' $PATH
set -gx PYENV_SHELL fish
source '/Users/iwai/.anyenv/envs/pyenv/libexec/../completions/pyenv.fish'
command pyenv rehash 2>/dev/null
function pyenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    source (pyenv "sh-$command" $argv|psub)
  case '*'
    command pyenv "$command" $argv
  end
end
