
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export PATH=/usr/local/sbin:$PATH

# default: export LSCOLORS="exfxcxdxbxegedabagacad"
export LSCOLORS="Exfxcxdxbxegedabagacad"

export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export LANGUAGE=ja_JP.UTF-8

export VIMINIT=":source ${XDG_CONFIG_HOME}"/vim/vimrc
export LESSHISTFILE=/dev/null
export LESS='-i -M -R'

# export EDITOR=vi
export PAGER=less

export HOMEBREW_NO_AUTO_UPDATE=1

export FZF_TMUX=1
export FZF_DEFAULT_COMMAND='rg --no-ignore --files'
export FZF_DEFAULT_OPTS='--height 40% --reverse --margin=0,1 --color=dark,bg+:240 --bind=ctrl-v:page-down,alt-v:page-up'

export WD_ROOT=~/Workspace

export GOBIN=~/go/bin
export PATH=$GOBIN:$PATH

# extended for your job, append or override in your .profile.local
if [ -e "${HOME}/.profile.local" ]
then
    source "${HOME}/.profile.local"
fi
