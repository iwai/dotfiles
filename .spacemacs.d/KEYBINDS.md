# SPACEMACS KEYBINDS

## プレフィックス

| keybind | command | description |
| ------- | ------- | ----------- |
|M-m|spacemacs-cmds||
|C-x|Control-X-prefix|標準プレフィックスキー|
|C-c|mode-specific-command-prefix|汎用プレフィックスキー|
|M-g|Prefix Command|カーソル移動補助用プレフィックスキー|
|ESC|ESC-prefix||
|M-o|Prefix Command||
|M-s|Prefix Command||

## カーソル移動

| keybind | command | description |
| ------- | ------- | ----------- |
|C-f|forward-char|一文字次に進む|
|C-b|backward-char|一文字前に戻る|
|C-n|next-line|次の行に移動|
|C-p|previous-line|前の行に移動|
|C-a|move-beginning-of-line|行頭に移動|
|C-e|move-end-of-line|行末に移動|
|M-f|forward-word|一単語次に進む|
|M-b|backward-word|一単語前に戻る|
|M-a|backward-sentence|文頭に移動|
|M-e|forward-sentence|文末に移動|
||||
|C-v|scroll-up-command|次の画面へスクロール|
|M-v|scroll-down-command|前の画面へスクロール|
|M-<|beginning-of-buffer|バッファーの先頭に移動|
|M->|end-of-buffer|バッファーの最後に移動|
|M-r|move-to-window-line-top-bottom|現在の表示画面内でトップボトムセンターへカーソル移動|
||||
|M-g TAB|move-to-column|行頭から指定文字数移動|
|M-g g|goto-line|指定された行へ移動|
|M-g M-g|goto-line|指定された行へ移動|
||||
|M-g n|next-error|次のエラー行へ移動|
|M-g p|previous-error|前のエラー行へ移動|
||||
|C-x [|backward-page||
|C-x ]|forward-page||

### avy

| keybind | command | description |
| ------- | ------- | ----------- |
|SPC jb|avy-pop-mark|
|SPC jj|evil-avy-goto-char|
|SPC jJ|evil-avy-goto-char-2|
|SPC jl|evil-avy-goto-line|
|SPC ju|spacemacs/avy-goto-url|
|SPC jw|evil-avy-goto-word-or-subword-1|
|SPC xo|spacemacs/avy-open-url|

## 改行／インデント

| keybind | command | description |
| ------- | ------- | ----------- |
|C-m|newline-and-indent|改行後インデント|
|RET|newline-and-indent|改行後インデント|
|C-j|electric-newline-and-maybe-indent|改行後インデント|
|C-o|open-line||
|TAB|indent-for-tab-command||
|C-i|indent-for-tab-command||
|M-i|tab-to-tab-stop|次のタブストップまでインデント|
|C-x TAB|indent-rigidly|範囲をインデント|
|M-q|fill-paragraph|段落を整形|
||||
|C-M-o|split-line|行を分割|

## 削除

| keybind | command | description |
| ------- | ------- | ----------- |
|C-d|delete-char|現在位置の文字を削除|
|DEL|delete-backward-char|カーソル位置の一文字前を削除|
|C-x C-o|delete-blank-lines|空行を削除|
||||
|M-\\|delete-horizontal-space||
|M-^|delete-indentation||

## マーク

| keybind | command | description |
| ------- | ------- | ----------- |
|C-SPC|set-mark-command|カーソル位置をマーク|
|C-x SPC|rectangle-mark-mode|矩形選択開始位置をマーク<br>（通常のマーク中に実行すると矩形選択モードに変わる） |
||||
|C-@|set-mark-command|カーソル位置をマーク|
|M-h|mark-paragraph|現在の段落をマーク|
|C-x h|mark-whole-buffer|バッファ全体をマーク|
|M-@|mark-word|次の単語の最後をマーク|
||||
|C-x C-@|pop-global-mark||
|C-x C-p|mark-page||
|C-x C-x|exchange-point-and-mark||
|C-x C-SPC|pop-global-mark||
|C-M-@|mark-sexp||
|C-M-h|mark-defun||
|M-'|abbrev-prefix-mark||
|C-M-SPC|mark-sexp||

## 切り取り, コピー, 貼り付け

| keybind | command | description |
| ------- | ------- | ----------- |
|C-k|kill-line|前方の行末まで切り取り|
|C-w|kill-region|マーク位置まで切り取り|
|M-d|kill-word|前方の単語を切り取り|
|M-k|kill-sentence|前方の文を切り取り|
|M-z|zap-to-char|前方の指定文字まで切り取り|
|C-M-k|kill-sexp|前方の式を切り取り|
|M-DEL|backward-kill-word|後方の単語を切り取り|
|C-x DEL|backward-kill-sentence|後方の文頭まで切り取り|
||||
|M-w|kill-ring-save|カーソル位置からマーク位置までコピー|
|C-M-w|append-next-kill|最後にkillされた文字列に次にkillする文字列を追加する|
||||
|C-y|yank|貼り付け|
|M-y|yank-pop|過去に切り取りコピーした文字列を選択して貼り付け|

## 矩形編集（rectangle-mark-mode）

| keybind | command | description |
| ------- | ------- | ----------- |
|C-t|string-rectangle|矩形選択範囲を指定文字列で置き換える|
|C-o|open-rectangle|矩形選択範囲に空文字を挿入|
|C-x r N|rectangle-number-lines|矩形領域の左端に行番号を挿入|

## 大文字小文字変換

| keybind | command | description |
| ------- | ------- | ----------- |
|M-c|capitalize-word|単語の先頭の文字を大文字に変換|
|M-l|downcase-word|単語を小文字に変換|
|M-u|upcase-word|単語を大文字に変換|
|C-x C-l|downcase-region|範囲を小文字に変換|
|C-x C-u|upcase-region|範囲を大文字に変換|

## 文字の入れ替え

| keybind | command | description |
| ------- | ------- | ----------- |
|C-t|transpose-chars|文字を入れ替える|
|M-t|transpose-words|単語を入れ替える|
|C-x C-t|transpose-lines|行を入れ替える|
|C-M-t|transpose-sexps|式を入れ替える|

## コメント

| keybind | command | description |
| ------- | ------- | ----------- |
|M-j|indent-new-comment-line|コメント行の改行|
|C-M-j|indent-new-comment-line|コメント行の改行|
|C-x C-;|comment-line|行をコメントアウト|
|M-;|comment-dwim|行末にコメント追加|
|C-x ;|comment-set-column||

## 検索＆移動

| keybind | command | description |
| ------- | ------- | ----------- |
|C-s|swiper|インクリメンタル検索を開始します|
|C-r|isearch-backward|逆向きのインクリメンタル検索を開始します|
|M-.|xref-find-definitions|識別子の最初の定義を探します|
|M-,|xref-pop-marker-stack|前にM-.または同種のコマンドを呼び出した場所に戻ります|
|C-M-.|xref-find-apropos|patternにマッチする名前の識別子を探します|
|C-x 4 .|xref-find-definitions-other-window|識別子の最初の定義を探して、他のウィンドウに表示します|
|C-x 5 .|xref-find-definitions-other-frame|識別子の定義を探して、それを新しいフレームに表示します|
||||
|C-M-r|isearch-backward-regexp||
|C-M-s|isearch-forward-regexp||
|M-s .|isearch-forward-symbol-at-point||
|M-s _|isearch-forward-symbol||
|M-s w|isearch-forward-word||
||||
|M-m s b|swiper-all|すべてのバッファを対象に検索|

## 検索＆抽出

| keybind | command | description |
| ------- | ------- | ----------- |
|M-s o|occur|現在のバッファから検索文字列にヒットした行を \*\*Occur\*\* バッファに表示します|
||mutli-occur|指定した複数のバッファを対象に検索文字列にヒットした行を \*\*Occur\*\* バッファに表示します|

### occur-mode

| keybind | command | description |
| ------- | ------- | ----------- |
|e|occur-edit-mode|編集モード（編集された内容は元のバッファへ反映されます）<br> C-c C-c で編集モード終了|
|RET|occur-mode-goto-occurrence|抽出された行の元のバッファへ移動|
|C-c C-c|occur-mode-goto-occurrence|抽出された行の元のバッファへ移動|
|C-c C-f|next-error-follow-minor-mode|抽出された行の元のバッファを追随して移動|


## 置換

| keybind | command | description |
| ------- | ------- | ----------- |
|M-%|query-replace|文字列置換|
|C-M-%|query-replace-regexp|正規表現置換|

## ファイル操作

| keybind | command | description |
| ------- | ------- | ----------- |
|C-x C-f|find-file|ファイルを開く|
|C-x C-r|find-file-read-only|読み取り専用でファイルを開く|
|C-x C-v|find-alternate-file|代わりのファイルを開く（開くファイルを間違えた）|
|C-x i|insert-file|ファイルを挿入|
|C-x C-w|write-file|別名でバッファを保存する|
||||
|C-x 4 C-f|find-file-other-window|別のウィンドウにファイルを開く|
|C-x 4 f|find-file-other-window|別のウィンドウにファイルを開く|
|C-x 4 r|find-file-read-only-other-window|別のウィンドウに読み取り専用でファイルを開く|
|C-x 5 C-f|find-file-other-frame|別のフレームにファイルを開く|
|C-x 5 f|find-file-other-frame|別のフレームにファイルを開く|
|C-x 5 r|find-file-read-only-other-frame|別のフレームに読み取り専用でファイルを開く|

## バッファ操作

| keybind | command | description |
| ------- | ------- | ----------- |
|C-x C-s|save-buffer|バッファを保存する|
|C-x C-b|list-buffers|バッファ一覧を表示|
|C-x b|switch-to-buffer|バッファを切り替え|
|C-x k|kill-buffer|バッファを削除|
|C-x s|save-some-buffers|複数のバッファを保存する|
|C-x C-q|read-only-mode|バッファを読み取り専用に切替（トグル）|

## 制御

| keybind | command | description |
| ------- | ------- | ----------- |
|C-x C-c|save-buffers-kill-terminal|バッファ保存／Emacs終了|
||||
|C-q|quoted-insert|特殊文字入力|
|C-g|keyboard-quit|コマンド中断|
|C-_|undo|やり直し|
|C-/|undo|やり直し|
|C-x u|undo|やり直し|
|C-x z|repeat|繰り返し|
||||
|C-z|suspend-frame||
|C-]|abort-recursive-edit||
|C-\\|toggle-input-method||
|C-h|help-command||


## 数引数コマンド

| keybind | command | description |
| ------- | ------- | ----------- |
|C-u|universal-argument||
|C-0 .. C-9|digit-argument||
|M-0 .. M-9|digit-argument||
|C--|negative-argument||
|M--|negative-argument||

## ウィンドウ操作

| keybind | command | description |
| ------- | ------- | ----------- |
|C-l|recenter-top-bottom|現在行がウィンドウの中央に表示|
|C-x 0|delete-window|ウィンドウを削除|
|C-x 1|spacemacs/toggle-maximize-buffer|アクティブウィンドウを全画面表示（トグル）|
|C-x 2|split-window-below|ウィンドウを上下分割|
|C-x 3|split-window-right|ウィンドウを左右分割|
|C-x o|other-window|次のウィンドウへ移動|
|C-x +|balance-windows|すべてのウィンドウの高さを同じにする|
|C-x -|shrink-window-if-larger-than-buffer|バッファに合わせてウィンドウを縮小|
||||
|C-M-l|reposition-window||
|C-x ^|enlarge-window||
|C-x {|shrink-window-horizontally||
|C-x }|enlarge-window-horizontally||
|C-M-v|scroll-other-window||
|C-M-S-v|scroll-other-window-down||

## シェル

| keybind | command | description |
| ------- | ------- | ----------- |
|M-!|shell-command|シェルコマンドを実行|
|M-&|async-shell-command|非同期シェルコマンドを実行|
|M-&#124;|shell-command-on-region|範囲を標準入力にしてシェルコマンドを実行|

## リンク

- [Emacs の Prefix Key とお約束ごと](https://qiita.com/lazy_dog/items/cfeffe30efd4b32703b1)

