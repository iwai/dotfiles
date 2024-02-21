# Load .profile, containing login, non-bash related initializations.
source ~/.profile

# Load .bashrc, containing non-login related bash initializations.
source ~/.bashrc


if [ -z "$BASH_EXECUTION_STRING" ]; then
    exec fish
fi
. "$HOME/.cargo/env"
