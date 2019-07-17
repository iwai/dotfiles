

# C-u で上位ディレクトリへ移動してプロンプト再描画
bind \cu 'cd .. ; commandline -f repaint'
# 入力途中での C-c でコマンドラインをそのまま
# bind \cc "commandline (commandline --cut-at-cursor)"

bind \cj    'fzf_change_directory (commandline -t)'
bind \cr    'fzf_select_history (commandline -b)'
bind \cx\cf 'fzf_file_open (commandline -t)'

