
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export PATH=/usr/local/sbin:$PATH

export VIMINIT=":source ${XDG_CONFIG_HOME}"/vim/vimrc
export LESSHISTFILE=/dev/null
export LESS='-i -M -R'

# export EDITOR=vi
export PAGER=less

export FZF_TMUX=1
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --margin=0,1 --color=dark,bg+:240 --bind=ctrl-v:page-down,alt-v:page-up'

export WD_ROOT=~/Workspace
