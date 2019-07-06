# Load .profile, containing login, non-bash related initializations.
source ~/.profile

# Load .bashrc, containing non-login related bash initializations.
source ~/.bashrc

# OSXはターミナル起動でloginされるので.bash_profileが読まれるためここでfishに変更する
# Ubuntuの場合はターミナルアプリの方の起動シェルを変更した方が良さそう
# `open -a Emacs` でのエラーに対応 https://github.com/syl20bnr/spacemacs/issues/4755#issuecomment-500134204
if [ -z "$BASH_EXECUTION_STRING" ]; then
    exec fish
fi
