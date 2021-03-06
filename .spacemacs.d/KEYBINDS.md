# SPACEMACS KEYBINDS

## プレフィックス

| keybind | command                      | description                          |
| ------- | -------                      | -----------                          |
| M-m     | spacemacs-cmds               |                                      |
| C-x     | Control-X-prefix             | 標準プレフィックスキー               |
| C-c     | mode-specific-command-prefix | 汎用プレフィックスキー               |
| M-g     | Prefix Command               | カーソル移動補助用プレフィックスキー |
| ESC     | ESC-prefix                   |                                      |
| M-o     | Prefix Command               |                                      |
| M-s     | Prefix Command               |                                      |
| M-RET   | Prefix Command               | メジャーモードプレフィックスキー     |

## カーソル移動

| keybind | command                        | description                                          |
| ------- | -------                        | -----------                                          |
| C-f     | forward-char                   | 一文字次に進む                                       |
| C-b     | backward-char                  | 一文字前に戻る                                       |
| C-n     | next-line                      | 次の行に移動                                         |
| C-p     | previous-line                  | 前の行に移動                                         |
| C-a     | move-beginning-of-line         | 行頭に移動                                           |
| C-e     | move-end-of-line               | 行末に移動                                           |
| M-f     | forward-word                   | 一単語次に進む                                       |
| M-b     | backward-word                  | 一単語前に戻る                                       |
| M-a     | backward-sentence              | 文頭に移動                                           |
| M-e     | forward-sentence               | 文末に移動                                           |
|         |                                |                                                      |
| C-v     | scroll-up-command              | 次の画面へスクロール                                 |
| M-v     | scroll-down-command            | 前の画面へスクロール                                 |
| M-<     | beginning-of-buffer            | バッファーの先頭に移動                               |
| M->     | end-of-buffer                  | バッファーの最後に移動                               |
| M-r     | move-to-window-line-top-bottom | 現在の表示画面内でトップボトムセンターへカーソル移動 |
|         |                                |                                                      |
| M-g TAB | move-to-column                 | 行頭から指定文字数移動                               |
| M-g g   | goto-line                      | 指定された行へ移動                                   |
| M-g M-g | goto-line                      | 指定された行へ移動                                   |
|         |                                |                                                      |
| M-g n   | next-error                     | 次のエラー行へ移動                                   |
| M-g p   | previous-error                 | 前のエラー行へ移動                                   |
|         |                                |                                                      |
| C-x [   | backward-page                  |                                                      |
| C-x ]   | forward-page                   |                                                      |

### avy

| keybind | command                         | description |
| ------- | -------                         | ----------- |
| SPC j b | avy-pop-mark                    |             |
| SPC j j | evil-avy-goto-char              |             |
| SPC j J | evil-avy-goto-char-2            |             |
| SPC j l | evil-avy-goto-line              |             |
| SPC j u | spacemacs/avy-goto-url          |             |
| SPC j w | evil-avy-goto-word-or-subword-1 |             |
| SPC x o | spacemacs/avy-open-url          |             |

## 改行／インデント

| keybind | command                           | description                    |
| ------- | -------                           | -----------                    |
| C-m     | newline-and-indent                | 改行後インデント               |
| RET     | newline-and-indent                | 改行後インデント               |
| C-j     | electric-newline-and-maybe-indent | 改行後インデント               |
| C-o     | open-line                         |                                |
| TAB     | indent-for-tab-command            |                                |
| C-i     | indent-for-tab-command            |                                |
| M-i     | tab-to-tab-stop                   | 次のタブストップまでインデント |
| C-x TAB | indent-rigidly                    | 範囲をインデント               |
| M-q     | fill-paragraph                    | 段落を整形                     |
|         |                                   |                                |
| C-M-o   | split-line                        | 行を分割                       |

## 削除

| keybind | command                 | description                  |
| ------- | -------                 | -----------                  |
| C-d     | delete-char             | 現在位置の文字を削除         |
| DEL     | delete-backward-char    | カーソル位置の一文字前を削除 |
| C-x C-o | delete-blank-lines      | 空行を削除                   |
|         |                         |                              |
| M-\\    | delete-horizontal-space |                              |
| M-^     | delete-indentation      |                              |

## マーク

| keybind   | command                 | description                                                                      |
| -------   | -------                 | -----------                                                                      |
| C-SPC     | set-mark-command        | カーソル位置をマーク                                                             |
| C-x SPC   | rectangle-mark-mode     | 矩形選択開始位置をマーク<br>（通常のマーク中に実行すると矩形選択モードに変わる） |
|           |                         |                                                                                  |
| C-@       | set-mark-command        | カーソル位置をマーク                                                             |
| M-h       | mark-paragraph          | 現在の段落をマーク                                                               |
| C-x h     | mark-whole-buffer       | バッファ全体をマーク                                                             |
| M-@       | mark-word               | 次の単語の最後をマーク                                                           |
|           |                         |                                                                                  |
| C-x C-@   | pop-global-mark         |                                                                                  |
| C-x C-p   | mark-page               |                                                                                  |
| C-x C-x   | exchange-point-and-mark |                                                                                  |
| C-x C-SPC | pop-global-mark         |                                                                                  |
| C-M-@     | mark-sexp               |                                                                                  |
| C-M-h     | mark-defun              |                                                                                  |
| M-'       | abbrev-prefix-mark      |                                                                                  |
| C-M-SPC   | mark-sexp               |                                                                                  |

## 切り取り, コピー, 貼り付け

| keybind | command                | description                                          |
| ------- | -------                | -----------                                          |
| C-k     | kill-line              | 前方の行末まで切り取り                               |
| C-w     | kill-region            | マーク位置まで切り取り                               |
| M-d     | kill-word              | 前方の単語を切り取り                                 |
| M-k     | kill-sentence          | 前方の文を切り取り                                   |
| M-z     | zap-to-char            | 前方の指定文字まで切り取り                           |
| C-M-k   | kill-sexp              | 前方の式を切り取り                                   |
| M-DEL   | backward-kill-word     | 後方の単語を切り取り                                 |
| C-x DEL | backward-kill-sentence | 後方の文頭まで切り取り                               |
|         |                        |                                                      |
| M-w     | kill-ring-save         | カーソル位置からマーク位置までコピー                 |
| C-M-w   | append-next-kill       | 最後にkillされた文字列に次にkillする文字列を追加する |
|         |                        |                                                      |
| C-y     | yank                   | 貼り付け                                             |
| M-y     | yank-pop               | 過去に切り取りコピーした文字列を選択して貼り付け     |

## 矩形編集（rectangle-mark-mode）

| keybind | command                | description                          |
| ------- | -------                | -----------                          |
| C-t     | string-rectangle       | 矩形選択範囲を指定文字列で置き換える |
| C-o     | open-rectangle         | 矩形選択範囲に空文字を挿入           |
| C-x r N | rectangle-number-lines | 矩形領域の左端に行番号を挿入         |

### multiple-cursors

| keybind     | command                    | description                                      |
| -------     | -------                    | -----------                                      |
| C-S-c C-S-c | mc/edit-lines              | 指定範囲の各行にカーソルを追加                   |
| C->         | mc/mark-next-like-this     | 次の行にカーソルを追加                           |
| C-<         | mc/mark-previous-like-this | 前の行にカーソルを追加                           |
| C-c C-<     | mc/mark-all-like-this      |                                                  |
| SPC s m a   | mc/mark-all-dwim           | 複数の行にまたがるマッチする箇所にカーソルを追加 |
|             |                            |                                                  |

## 大文字小文字変換

| keybind | command         | description                    |
| ------- | -------         | -----------                    |
| M-c     | capitalize-word | 単語の先頭の文字を大文字に変換 |
| M-l     | downcase-word   | 単語を小文字に変換             |
| M-u     | upcase-word     | 単語を大文字に変換             |
| C-x C-l | downcase-region | 範囲を小文字に変換             |
| C-x C-u | upcase-region   | 範囲を大文字に変換             |

## 文字の入れ替え

| keybind | command         | description      |
| ------- | -------         | -----------      |
| C-t     | transpose-chars | 文字を入れ替える |
| M-t     | transpose-words | 単語を入れ替える |
| C-x C-t | transpose-lines | 行を入れ替える   |
| C-M-t   | transpose-sexps | 式を入れ替える   |

## コメント

| keybind | command                 | description        |
| ------- | -------                 | -----------        |
| M-j     | indent-new-comment-line | コメント行の改行   |
| C-M-j   | indent-new-comment-line | コメント行の改行   |
| C-x C-; | comment-line            | 行をコメントアウト |
| M-;     | comment-dwim            | 行末にコメント追加 |
| C-x ;   | comment-set-column      |                    |

## 検索＆移動

| keybind | command                            | description                                            |
| ------- | -------                            | -----------                                            |
| C-s     | swiper                             | インクリメンタル検索を開始します                       |
| C-r     | isearch-backward                   | 逆向きのインクリメンタル検索を開始します               |
| M-.     | xref-find-definitions              | 識別子の最初の定義を探します                           |
| M-,     | xref-pop-marker-stack              | 前にM-.または同種のコマンドを呼び出した場所に戻ります  |
| C-M-.   | xref-find-apropos                  | patternにマッチする名前の識別子を探します              |
| C-x 4 . | xref-find-definitions-other-window | 識別子の最初の定義を探して、他のウィンドウに表示します |
| C-x 5 . | xref-find-definitions-other-frame  | 識別子の定義を探して、それを新しいフレームに表示します |
|         |                                    |                                                        |
| C-M-r   | isearch-backward-regexp            |                                                        |
| C-M-s   | isearch-forward-regexp             |                                                        |
| M-s .   | isearch-forward-symbol-at-point    |                                                        |
| M-s _   | isearch-forward-symbol             |                                                        |
| M-s w   | isearch-forward-word               |                                                        |
|         |                                    |                                                        |
| M-m s b | swiper-all                         | すべてのバッファを対象に検索                           |

## 検索＆抽出

| keybind | command     | description                                                                                 |
| ------- | -------     | -----------                                                                                 |
| M-s o   | occur       | 現在のバッファから検索文字列にヒットした行を \*\*Occur\*\* バッファに表示します             |
|         | mutli-occur | 指定した複数のバッファを対象に検索文字列にヒットした行を \*\*Occur\*\* バッファに表示します |

### occur-mode

| keybind | command                      | description                                                                           |
| ------- | -------                      | -----------                                                                           |
| e       | occur-edit-mode              | 編集モード（編集された内容は元のバッファへ反映されます）<br> C-c C-c で編集モード終了 |
| RET     | occur-mode-goto-occurrence   | 抽出された行の元のバッファへ移動                                                      |
| C-c C-c | occur-mode-goto-occurrence   | 抽出された行の元のバッファへ移動                                                      |
| C-c C-f | next-error-follow-minor-mode | 抽出された行の元のバッファを追随して移動                                              |


## 置換

| keybind | command              | description  |
| ------- | -------              | -----------  |
| M-%     | query-replace        | 文字列置換   |
| C-M-%   | query-replace-regexp | 正規表現置換 |

## ファイル操作

| keybind   | command                          | description                                      |
| -------   | -------                          | -----------                                      |
| C-x C-f   | find-file                        | ファイルを開く                                   |
| C-x C-r   | find-file-read-only              | 読み取り専用でファイルを開く                     |
| C-x C-v   | find-alternate-file              | 代わりのファイルを開く（開くファイルを間違えた） |
| C-x i     | insert-file                      | ファイルを挿入                                   |
| C-x C-w   | write-file                       | 別名でバッファを保存する                         |
|           |                                  |                                                  |
| C-x 4 C-f | find-file-other-window           | 別のウィンドウにファイルを開く                   |
| C-x 4 f   | find-file-other-window           | 別のウィンドウにファイルを開く                   |
| C-x 4 r   | find-file-read-only-other-window | 別のウィンドウに読み取り専用でファイルを開く     |
| C-x 5 C-f | find-file-other-frame            | 別のフレームにファイルを開く                     |
| C-x 5 f   | find-file-other-frame            | 別のフレームにファイルを開く                     |
| C-x 5 r   | find-file-read-only-other-frame  | 別のフレームに読み取り専用でファイルを開く       |

## バッファ操作

| keybind | command           | description                            |
| ------- | -------           | -----------                            |
| C-x C-s | save-buffer       | バッファを保存する                     |
| C-x C-b | list-buffers      | バッファ一覧を表示                     |
| C-x b   | switch-to-buffer  | バッファを切り替え                     |
| C-x k   | kill-buffer       | バッファを削除                         |
| C-x s   | save-some-buffers | 複数のバッファを保存する               |
| C-x C-q | read-only-mode    | バッファを読み取り専用に切替（トグル） |

## 制御

| keybind | command                    | description             |
| ------- | -------                    | -----------             |
| C-x C-c | save-buffers-kill-terminal | バッファ保存／Emacs終了 |
|         |                            |                         |
| C-q     | quoted-insert              | 特殊文字入力            |
| C-g     | keyboard-quit              | コマンド中断            |
| C-_     | undo                       | やり直し                |
| C-/     | undo                       | やり直し                |
| C-x u   | undo                       | やり直し                |
| C-x z   | repeat                     | 繰り返し                |
|         |                            |                         |
| C-z     | suspend-frame              | emacsを一時的に終了     |
| C-]     | abort-recursive-edit       |                         |
| C-\\    | toggle-input-method        |                         |
| C-h     | help-command               |                         |


## 数引数コマンド

| keybind    | command            | description |
| -------    | -------            | ----------- |
| C-u        | universal-argument |             |
| C-0 .. C-9 | digit-argument     |             |
| C--        | negative-argument  |             |
| M--        | negative-argument  |             |

## ウィンドウ操作

| keybind    | command                             | description                                |
| -------    | -------                             | -----------                                |
| C-l        | recenter-top-bottom                 | 現在行がウィンドウの中央に表示             |
| C-x 0      | delete-window                       | ウィンドウを削除                           |
| C-x 1      | spacemacs/toggle-maximize-buffer    | アクティブウィンドウを全画面表示（トグル） |
| C-x 2      | split-window-below                  | ウィンドウを上下分割                       |
| C-x 3      | split-window-right                  | ウィンドウを左右分割                       |
| C-x o      | other-window                        | 次のウィンドウへ移動                       |
| C-x +      | balance-windows                     | すべてのウィンドウの高さを同じにする       |
| C-x -      | shrink-window-if-larger-than-buffer | バッファに合わせてウィンドウを縮小         |
| M-0 .. M-9 | winum-select-window-N               | 指定したウィンドウに移動                   |
|            |                                     |                                            |
| C-M-l      | reposition-window                   |                                            |
| C-x ^      | enlarge-window                      |                                            |
| C-x {      | shrink-window-horizontally          |                                            |
| C-x }      | enlarge-window-horizontally         |                                            |
| C-M-v      | scroll-other-window                 |                                            |
| C-M-S-v    | scroll-other-window-down            |                                            |

## シェル

| keybind  | command                 | description                              |
| -------  | -------                 | -----------                              |
| M-!      | shell-command           | シェルコマンドを実行                     |
| M-&      | async-shell-command     | 非同期シェルコマンドを実行               |
| M-&#124; | shell-command-on-region | 範囲を標準入力にしてシェルコマンドを実行 |

## 補完

| keybind | command           | description                                       |
| ------- | -------           | -----------                                       |
| M-/     | hippie-expand     | カーソル1文字前の単語の展開を試す（動的略語展開） |
| SPC i s | spacemacs/ivy-yas | yasnippetの一覧から選択して挿入                   |


### hippie-expand

`hippie-expand-try-functions-list` で指定された展開関数にて展開を実施します、また、リストは優先順位により並んでいます、現在指定されている関数は下記。

| function                           | description                                                 |
| --------                           | -----------                                                 |
| yas-hippie-try-expand              | yasnippet の展開                                            |
| try-expand-dabbrev                 | 現在のバッファ内から動的略語展開                            |
| try-expand-dabbrev-all-buffers     | 現在のバッファ内から動的略語展開                            |
| try-expand-dabbrev-from-kill       | 現在開いているバッファ全てから動的略語展開                  |
| try-complete-file-name-partially   | ファイル名の補完                                            |
| try-complete-file-name             | ファイル名の補完                                            |
| try-expand-all-abbrevs             | すべての略語表から展開 略語表一覧（abbrev-table-name-list） |
| try-expand-list                    |                                                             |
| try-expand-line                    |                                                             |
| try-complete-lisp-symbol-partially | Lispシンボルから補完                                        |
| try-complete-lisp-symbol           | Lispシンボルから補完                                        |

### auto-yasnippet

| keybind   | command    | description |
| -------   | -------    | ----------- |
| M-m i S c | aya-create |             |


## コンパイル

| keybind | command   | description                      |
| ------- | -------   | -----------                      |
| SPC c C | compile   | コンパイルコマンドを指定して実行 |
| SPC c r | recompile | 再コンパイル                     |

## ivy/counsel

スペース区切りの正規表現マッチングに対応したさまざまな関数を提供してくれます、このマッチングはivyにより実現されています。
正規表現をオフにする場合、入力中に`M-r (ivy-toggle-regexp-quote)` により完全一致にマッチング動作を変更できます。

`counsel-mode` を有効にすることで、Emacsの標準関数はcounselに置き換えられます。

| Keybind   | Emacs command              | Counsel equivalent           | Description                                                        |
| --------- | -------------------------- | ---------------------------- | ------------------------------------------------------------------ |
| M-x       | execute-extended-command   | counsel-M-x                  | コマンド名を指定して実行                                           |
| C-x C-f   | find-file                  | counsel-find-file            | ファイルを開く                                                     |
| M-y       | yank-pop                   | counsel-yank-pop             | 過去に切り取りコピーした文字列を選択して貼り付け                   |
| M-?       | describe-bindings          | counsel-descbinds            | 現在バッファのキーの割り当て表（マイナーモードからグローバルまで） |
| \<f1\> f  | describe-function          | counsel-describe-function    | 指定されたLisp関数のドキュメントを表示                             |
| \<f1\> v  | describe-variable          | counsel-describe-variable    | 指定されたLisp変数のドキュメントを表示                             |
| \<f1\> a  | apropos-command            | counsel-apropos              | 指定した文字列を含むコマンドのリストを表示                         |
| \<f1\> S  | info-lookup-symbol         | counsel-info-lookup-symbol   | 指定したシンボルに対応したInfoを表示                               |
| SPC h d F | describe-face              | counsel-describe-face        | 指定されたfaceのドキュメントを表示                                 |
| SPC f e l | find-library               | counsel-find-library         | 指定したライブラリを表示                                           |
|           | list-faces-display         | counsel-faces                | 現在定義されているフェイス一覧                                     |
|           | imenu                      | counsel-imenu                | ファイル内の主要な定義を検索して移動                               |
|           | load-library               | counsel-load-library         | load-path内含む指定されたライブラリを読み込み                      |
| SPC T m   | load-theme                 | counsel-load-theme           | 指定したテーマを読み込み                                           |
| SPC r m   | pop-to-mark-command        | counsel-mark-ring            | 過去にマークした履歴を選択して移動                                 |
| SPC f b   | bookmark-jump              | counsel-bookmark             | ブックマークを開く                                                 |

| keybind | command              | description                                          |
| ------- | -------              | -----------                                          |
|         | counsel-compile      | コンパイルコマンドの指定もしくは履歴指定でコンパイル |
|         | counsel-git          | 現在のGitリポジトリのファイルを開く                  |
|         | counsel-git-grep     | 現在のGitリポジトリファイルを対象にgrepを実行        |
|         | counsel-ag           | 現在のディレクトリを対象にag                         |
|         | counsel-rg           | 現在のディレクトリを対象にrg                         |
| SPC f L | counsel-locate       | locateコマンドによる検索                             |
| SPC i u | counsel-unicode-char | Unicode文字入力                                      |


## Region

| command                              | description                                                      |         |
| ---                                  | ---                                                              |         |
| apply-macro-to-region-lines          | 領域内で始まる各行で最後のキーボードマクロを実行                 |         |
| avy-copy-region                      | 2行を選択し、それらの間のテキストをコピーしてポイント            |         |
| avy-kill-region                      | 2行を選択してそれらの間の領域を削除                              |         |
| avy-kill-ring-save-region            | 2行を選択し、それらの間の領域をキルリングに保存                  |         |
| avy-move-region                      | 2行を選択し、それらの間のテキストを現在の行の上に移動            |         |
| avy-move-region                      | 2行を選択し、それらの間のテキストを現在の行の上に移動            |         |
| base64-encode-region                 | 選択された範囲をbase64エンコードに変更                           |         |
| base64-decode-region                 | 選択された範囲をbase64デコードに変更                             |         |
| binhex-decode-region                 |                                                                  |         |
| browse-url-of-region                 | 選択された範囲をHTMLソースとしてブラウザで表示                   |         |
| canonically-space-region             | 選択された範囲内の単語間の余分なスペースを削除                   |         |
| center-region                        | 選択された範囲を中央揃え                                         |         |
| comment-or-uncomment-region          | 選択された範囲をコメントもしくは非コメント                       |         |
| comment-region                       | 選択された範囲をコメント                                         |         |
| count-words-region(count-words)      | 選択された範囲の行数、単語数、文字数をカウント                   | M-=     |
| count-region                         | 選択された範囲の行数、単語数、文字数をカウント                   | M-m x c |
| delete-region                        | 選択された範囲の削除（kill ringは変更しない）                    |         |
| delimit-columns-region               | 選択された範囲のテキストを整理                                   |         |
| capitalize-region                    | 選択された範囲の単語の頭文字を大文字に変換                       |         |
| downcase-region                      | 選択された範囲の文字を小文字に変換                               | C-x C-l |
| denato-region                        | 選択された範囲の文字をNATO発音から戻す                           |         |
| ediff-regions-linewise               | 指定されたバッファ内の一対の範囲に対してediffを実行（行単位）    |         |
| ediff-regions-wordwise               | 指定されたバッファ内の一対の範囲に対してediffを実行（単語単位）  |         |
| encode-coding-region                 | 選択された範囲を指定されたコーディングシステムでエンコードをする |         |
| er/expand-region                     | 意味単位の範囲選択を行う                                         | M-m v   |
| eval-region                          | 選択された範囲のLispコードを実行                                 |         |
| expand-region-abbrevs                | 選択された範囲内の略語を展開                                     |         |
| fill-region                          |                                                                  |         |
| fill-region-as-paragraph             |                                                                  |         |
| flyspell-region                      |                                                                  |         |
| format-decode-region                 | 選択された範囲をデコード                                         |         |
| format-encode-region                 | 選択された範囲をエンコード                                       |         |
| gh-md-render-region                  | 選択された範囲をgithub markdownとしてプレビュー                  |         |
| htmlize-region                       | 選択された範囲を色と装飾を維持しながらHTMLに変換                 |         |
| japanese-hankaku-region              | 全角を半角へ変換                                                 |         |
| japanese-hiragana-region             | カタカナをひらがなへ変換                                         |         |
| japanese-katakana-region             | ひらがなをカタカナへ変換                                         |         |
| japanese-zenkaku-region              | 半角を全角へ変換                                                 |         |
| kkc-region                           | かな文字列を漢字かな混在文字列に変換                             |         |
| json-reformat-region                 | 選択された範囲のjsonを整形                                       |         |
| mail-decode-encoded-word-region      |                                                                  |         |
| mail-quote-printable-region          |                                                                  |         |
| mail-unquote-printable-region        |                                                                  |         |
| metamail-region                      |                                                                  |         |
| mml-quote-region                     |                                                                  |         |
| markdown-blockquote-region           |                                                                  |         |
| markdown-complete-region             |                                                                  |         |
| markdown-exdent-region               |                                                                  |         |
| markdown-indent-region               |                                                                  |         |
| markdown-outdent-region              |                                                                  |         |
| markdown-pre-region                  |                                                                  |         |
| markdown-table-convert-region        |                                                                  |         |
| markdown-unfontify-region-wiki-links |                                                                  |         |
| mmm-clear-current-region             |                                                                  |         |
| mmm-end-current-region               |                                                                  |         |
| mmm-ify-region                       |                                                                  |         |
| mmm-insert-region                    |                                                                  |         |
| mmm-parse-region                     |                                                                  |         |
| mmm-reparse-current-region           |                                                                  |         |
| morse-region                         |                                                                  |         |
| move-text-region                     |                                                                  |         |
| move-text-region-down                |                                                                  |         |
| move-text-region-up                  |                                                                  |         |
| reverse-region                       |                                                                  |         |
| shell-command-on-region              |                                                                  |         |
| epa-decrypt-armor-in-region          | 選択された範囲のOpenPGPで暗号テキストを復号化                    |         |
| epa-decrypt-armor-in-region          |                                                                  |         |
| epa-decrypt-region                   |                                                                  |         |
| epa-encrypt-region                   |                                                                  |         |
| epa-import-armor-in-region           |                                                                  |         |
| epa-import-keys-region               |                                                                  |         |
| epa-sign-region                      |                                                                  |         |
| epa-verify-cleartext-in-region       |                                                                  |         |
| epa-verify-region                    |                                                                  |         |

- https://github.com/emacs-pe/gh-md.el
- https://github.com/gongo/json-reformat#configuration

## ファンクションキー

| keybind | command                              | description |
| ---     | ---                                  | ---         |
| <f1>    | help-command                         |             |
| <f2>    | 2C-command                           |             |
| <f3>    | kmacro-start-macro-or-insert-counter |             |
| <f4>    | kmacro-end-or-call-macro             |             |
| <f6>    | ivy-resume                           |             |
| <f10>   | menu-bar-open                        |             |
| <f11>   | toggle-frame-fullscreen              |             |
| <f16>   | clipboard-kill-ring-save             |             |
| <f18>   | clipboard-yank                       |             |
| <f20>   | clipboard-kill-region                |             |

## リンク

- [Emacs の Prefix Key とお約束ごと](https://qiita.com/lazy_dog/items/cfeffe30efd4b32703b1)

