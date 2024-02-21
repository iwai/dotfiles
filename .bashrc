# Add bash aliases.
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
    source ~/.bash_functions
fi

if [ -f ~/.anyenv-init-bash -a -z "$BASH_EXECUTION_STRING" ]; then
    # ref: https://zenn.dev/antyuntyun/articles/pyenv_warning_resolve
    if [ -f "$HOME/.anyenv/envs/pyenv" ]; then
        export PYENV_ROOT="$HOME/.anyenv/envs/pyenv"
        export PATH="$PYENV_ROOT/bin:$PATH"
        eval "$(pyenv init --path)"
        if command -v pyenv 1>/dev/null 2>&1; then
            eval "$(pyenv init -)"
        fi
    fi
    source ~/.anyenv-init-bash
fi

# Emacsからの起動は .bash_profile 読み込まれないのでこちらで fish を起動
# 条件が無いと常に fish が起動して Bash 単体で利用できなくなるので
if [ -n "$INSIDE_EMACS" -a -z "$BASH_EXECUTION_STRING" ]; then
    exec fish
fi


alias awsssh='instance_ip=$(ls-hosts -noheader -filters instance-state-name:running -fields private-ip,tag:Name,instance-id | peco --prompt "Connect to >" | awk -F'\''[ ,\t]'\'' '\''{print $1}'\''); echo "ssh to $instance_ip"; ssh $instance_ip'
alias awsssh-jp='instance_ip=$(ls-hosts -noheader --region=ap-northeast-1 -filters instance-state-name:running -fields private-ip,tag:Name,instance-id | peco --prompt "Connect to >" | awk -F'\''[ ,\t]'\'' '\''{print $1}'\''); echo "ssh to $instance_ip"; ssh $instance_ip'

