# SPACEMACS



## 日本語フォント

- 12pt設定じゃないと綺麗な等幅にならない...
- https://shino.tumblr.com/post/25720825967/等幅フォントでは3-の倍数以外のフォントサイズを使用すると半角文字と全角文字の横幅比が-12
- [Emacs のフォント設定について](https://qiita.com/melito/items/238bdf72237290bc6e42)
- [日本語 font の導入](https://miyazakikenji.wordpress.com/2016/08/30/日本語-font-の導入/)
- https://github.com/tsunesan3/awsome-jp-coding-fonts

## lsp-mode

- https://microsoft.github.io/language-server-protocol/


## パースペクティブ

パースペクティブは、ウィンドウ構成と一連のバッファーで構成されており、少なくとも一つのワークスペースを保持します。
また、パースペクティブに連動してプロジェクトを切替られるようになっています。
これらは、 persp-mode, eyebrowse, projectile のパッケージにより実現されています。

| keybind | command | description |
| ------- | ------- | ----------- |
|SPC p l|spacemacs/ivy-persp-switch-project|パースペクティブとプロジェクトの切替|

## プロジェクト

プロジェクトの新規作成はありません、プロジェクト＝Gitリポジトリの概念で、プロジェクト固有のファイルは必要ありません。
Gitリポジトリ以外にも mercurial などいくつかに対応しています。もしリポジトリの無いフォルダを対象としたい場合は、
`.projectile` という名前の空ファイルを置くだけです。

| keybind | command | description |
| ------- | ------- | ----------- |
|SPC p SPC|counsel-projectile|プロジェクトを選択してファイルを開く|
|SPC p p|counsel-projectile-switch-project|プロジェクトを選択（切替）してファイルを開く|
||||
|SPC p f|counsel-projectile-find-file|プロジェクト内からファイルを開く|
|SPC p b|counsel-projectile-switch-to-buffer|プロジェクト内で表示されているバッファを選択|
|SPC p k|projectile-kill-buffers|プロジェクトに関連するバッファをすべて削除|
|SPC p r|projectile-recentf|プロジェクトに関連する訪問履歴からファイルを開く|
||||
|SPC p %|projectile-replace-regexp|
|SPC p g|projectile-find-tag|
|SPC p G|projectile-regenerate-tags|
|SPC p c|projectile-compile-project|
|SPC p T|projectile-test-project|
|SPC p I|projectile-invalidate-cache|
||||
|SPC p t|neotree-find-project-root|
|SPC p o|org-projectile/goto-todos|
|SPC p v|projectile-vc|

key             binding
---             -------

M-m p !         projectile-run-shell-command-in-root
M-m p $         Prefix Command
M-m p %         projectile-replace-regexp
M-m p &         projectile-run-async-shell-command-in-root
M-m p '         spacemacs/projectile-shell-pop
M-m p D         projectile-dired
M-m p F         projectile-find-file-dwim
M-m p G         projectile-regenerate-tags
M-m p I         projectile-invalidate-cache
M-m p R         projectile-replace
M-m p T         projectile-test-project
M-m p a         projectile-toggle-between-implementation-and-test
M-m p c         projectile-compile-project
M-m p d         counsel-projectile-find-dir
M-m p f         counsel-projectile-find-file
M-m p g         projectile-find-tag
M-m p h         helm-projectile
M-m p k         projectile-kill-buffers
M-m p l         spacemacs/ivy-persp-switch-project
M-m p p         counsel-projectile-switch-project
M-m p r         projectile-recentf
M-m p t         neotree-find-project-root
M-m p v         projectile-vc

M-m p $ t       projectile-multi-term-in-root

## ワークスペース

ワークスペースは、ウィンドウ構成を保持しています。

| keybind | command | description |
| ------- | ------- | ----------- |
|SPC p l w|spacemacs/ivy-persp-switch-project|ワークスペースの切替|
|SPC b W|spacemacs/goto-buffer-workspace|指定したバッファを表示しているワークスペースへ移動<br>表示がなければ現在のバッファに表示|


## Layout





## モードライン

| keybind | unicode | ascii | mode | description |
| ------- | ------- | ----- | ---- | ----------- |
|SPC t -|⊝|-|centered-cursor mode|カーソルをウィンドウの中央に維持するモード|
|SPC t 8|⑧|8|toggle highlight of characters for long lines|長い行をハイライト表示するモード|
|SPC t C-8|⑧|8|global toggle highlight of characters for long lines|長い行をハイライト表示するモード（グローバル）|
|SPC t C--|⊝|-|global centered cursor|カーソルをウィンドウの中央に維持するモード（グローバル）|
|SPC t a|ⓐ|a|auto-completion|自動補完|
|SPC t c|ⓒ|c|camel case motion with subword mode(camel-case-motion)||
|none|ⓔ|e|evil-org mode|org-modeのvimモード|
|SPC t E e|Ⓔe|Ee|emacs editing style (holy mode)|Emacs編集モード|
|SPC t E h|Ⓔh|Eh|hybrid editing style (hybrid mode)|Hybrid編集モード|
|SPC t f|ⓕ|f|fill-column-indicator mode|一行の最大文字数のラインに縦罫線を表示（デフォルト70文字）|
|SPC t F|Ⓕ|F|auto-fill mode|行が長くなりすぎたとき、それを自動的に分割する|
|SPC t G|Ⓖ|G|ggtags mode|GNUグローバルソースコードタグ付け|
|SPC t g|ⓖ|g|golden-ratio mode|黄金比(1:1.618)に基いて自動でウィンドウを幅を調整|
|SPC t h i|ⓗi|hi|toggle highlight indentation levels|インデントレベルをハイライト表示|
|SPC t h c|ⓗc|hc|toggle highlight indentation current column|現在のカラムのインデントレベルをハイライト表示|
|SPC t i|ⓘ|i|indentation guide|カーソル位置に関連するインデントを縦線で表示|
|SPC t C-i|ⓘ|i|global indentation guide|カーソル位置に関連するインデントを縦線で表示（グローバル）|
|SPC t I|Ⓘ|I|aggressive indent mode|インデント変更のたびに関連するブロックを自動で再インデント|
|SPC t K|Ⓚ|K|which-key mode|現在入力されている不完全なキーバインド（接頭辞）に続くキー割り当てをポップアップで表示 |
|SPC t p|ⓟ|p|smartparens mode|括弧のペアを自動で挿入／削除など操作を行います|
|SPC t C-p|ⓟ|p|global smartparens|括弧のペアを自動で挿入／削除など操作を行います（グローバル）|
|SPC t s|ⓢ|s|syntax checking (flycheck)|リアルタイムでシンタックスチェック|
|SPC t S|Ⓢ|S|enabled in spell checking layer (flyspell)|リアルタイムでスペルチェック|
|SPC t w|ⓦ|w|whitespace mode|空白やタブなど不可視文字を表示|
|SPC t C-w|ⓦ|w|global whitespace|空白やタブなど不可視文字を表示（グローバル）|
|SPC t W|Ⓦ|W|automatic whitespace cleanup (see dotspacemacs-whitespace-cleanup)|保存時に行末などの不要な空白を削除|
|SPC t C-W|Ⓦ|W|automatic whitespace cleanup globally|保存時に行末などの不要な空白を削除（グローバル）|
|SPC t y|ⓨ|y|yasnippet mode|スニペットモード|

- https://github.com/zk-phi/indent-guide
- https://github.com/Malabarba/aggressive-indent-mode
- https://github.com/Fuco1/smartparens

### all-the-icons

```elisp
   dotspacemacs-mode-line-theme (if (display-graphic-p)
                                    '(all-the-icons :separator arrow :separator-scale 1.5)
                                  '(spacemacs :separator arrow :separator-scale 1.5))
```

`M-x all-the-icons-install-fonts`

## Flycheck

`syntax-checking` レイヤーにより自動で有効になるようになっていて、 `flycheck-global-modes` に含まれるモードは、自動的に有効になる
Emacs-Lispは有効になっていなかったので追加する `(spacemacs/add-flycheck-hook 'emacs-lisp-mode)`

| keybind | description |
| ------- | ----------- |
|SPC e v|flycheckの設定を確認|
|SPC e l|すべてのエラーのリストを表示します|
|SPC e .||

## Emcas Lisp




## Reference

- [Emacsの補完と検索を超強化する](https://qiita.com/blue0513/items/c0dc35a880170997c3f5)
- [Emacsの検索機能を使いこなす](http://dev.ariel-networks.com/articles/emacs/part1/)
- https://www.reddit.com/r/emacs/comments/cfag4z/emacsp0rn_emacs_with_a_slick_ui_link_in_comments/
- https://github.com/ianpan870102/.emacs.d
- https://github.com/ianpan870102/.use-package.emacs.d
- https://github.com/cy20lin/.spacemacs.d
- https://github.com/yoshidaster/emacs-config
- https://github.com/jupl/.spacemacs.d
- https://github.com/drgeb/spacemacs
- https://sriramkswamy.github.io/dotemacs/
- [EmacsWiki](https://www.emacswiki.org/emacs/サイトマップ)
- https://with-emacs.com/posts/editing/show-matching-lines-when-parentheses-go-off-screen/
- https://medium.com/@mopemope/個人的に使っているemacsパッケージの話-26260a26fe3b
- https://ladicle.com/post/config/

## Package Manager

- https://nukosuke.hatenablog.jp/entry/straight-el
- https://emacs-jp.github.io/packages/package-management/package-el
- http://emacs.rubikitch.com/use-package-2/

## Terminal

- https://github.com/dieggsy/eterm-256color
- [emacs上のterm.elで正しくansi colorを256色表示する方法](http://geekna.hatenablog.jp/entry/20130901/p1)
- [Emacs上のターミナルを最強に: term+.el](https://tarao.hatenablog.com/entry/20121021/1350844264)

## Theme

`dotspacemacs-configuration-layers` に `themes-megapack` を追加して、 `dotspacemacs-themes` に `dracula` を追加

## Migration

アップグレードを実施した際、init.elの構成が変更される場合があるので、差分を適用する場合

| keybind | command | description |
| ------- | ------- | ----------- |
|SPC f e D|ediff-dotfile-and-template|現在のinit.elとテンプレートをediff|

## Troubleshooting

[Posframe Mac OS black fullscreen](https://github.com/tumashu/posframe/issues/30) 問題は、下記のMacPort版を利用することで、問題解決。

- https://github.com/railwaycat/homebrew-emacsmacport
- https://bitbucket.org/mituharu/emacs-mac/src/master/

## org-mode

| keybind | command | description |
| ------- | ------- | ----------- |
|SPC a o #|org-agenda-list-stuck-projects||
|SPC a o /|org-occur-in-agenda-files||
|SPC a o a|org-agenda-list||
|SPC a o c|org-capture||
|SPC a o e|org-store-agenda-views||
|SPC a o l|org-store-link||
|SPC a o m|org-tags-view||
|SPC a o o|org-agenda||
|SPC a o p|org-projectile/capture||
|SPC a o s|org-search-view||
|SPC a o t|org-todo-list||
|SPC t m c|spacemacs/toggle-mode-line-org-clock||

### リスト作成

| keybind | command | description |
| ------- | ------- | ----------- |
|C-RET|org-insert-heading-respect-content|新しい見出しを追加|
|C-S-RET|org-insert-todo-heading-respect-content|新しいTODOを追加|
|TAB|org-cycle|入力中の見出し階層を変更|
|M-\<left\>|カーソル位置の見出し階層を1上げる|
|M-\<right\>|カーソル位置の見出し階層を1下げる|
|S-\<left\>|org-support-shift-select|bulletのスタイルを切り替え|
|S-\<right\>|org-support-shift-select|bulletのスタイルを切り替え|
|C-c C-l|org-insert-link|リンクの挿入|
|C-c C-o|org-open-at-point|カーソル位置のリンクを開く|
|S-\<up\>|org-support-shift-select|現在の見出し優先度を上下する|
|S-\<down\>|org-support-shift-select|現在の見出し優先度を上下する|
|C-c C-d|org-deadline|締切日を挿入|
|C-c C-s|org-schedule|予定日を挿入|

- 見出しに `[/]` もしくは `[%]` を追加することで進捗状況を表示
- 見出しの末尾に `:foo:` もしくは `:foo:bar:` のようにタグを設定

### リスト表示

| keybind | command | description |
| ------- | ------- | ----------- |
|TAB|org-cycle|カーソル位置のツリーの開閉|
|S-TAB|org-shifttab|ツリー全体の開閉|
|C-c c|org-capture|簡易メモ|
|C-c a|org-agenda|
|C-c ^|org-sort-entries-or-items|同じ階層のエントリーを並び替え|

### 時間計測

| keybind | command | description |
| ------- | ------- | ----------- |
|C-c C-x C-i|org-clock-in|時間計測開始|
|C-c C-x C-o|org-clock-in|時間計測停止|

### 休止時間

| keybind | description |
| ------- | ----------- |
|k|休止時間として計測された時間の一部または全てをタスクの計測時間として保持、何分間保持するか入力|
|K|入力された分数だけ時間を保持すると同時にただちに現在のタスクの計測を中止|
|s|計測時間から全ての休止時間が差し引かれ、戻ってきた時点から再開|
|S|休止時間を保持せず、休止開始時の時刻で時間の計測を中止|
|C|時間計測そのものをキャンセル|

### Reference

- https://pxaka.tokyo/wiki/emacs:org-tree-slide
- https://github.com/org-mode-doc-ja/org-ja
- https://takaxp.github.io/org-ja.html
- https://sfus.net/blog/2018/12/org-mode-with-ox-hugo/
- https://qiita.com/takaxp/items/6b2d1e05e7ce4517274d
- https://github.com/takaxp/emacs.d/blob/d4fb1e356b93a8b236468fdbc30390a2ceaaac04/init-org.el



C c     |org-capture
p o     |org-projectile/goto-todos
a o #   |org-agenda-list-stuck-projects
a o /   |org-occur-in-agenda-files
a o a   |org-agenda-list
a o c   |org-capture
a o e   |org-store-agenda-views
a o l   |org-store-link
a o m   |org-tags-view
a o o   |org-agenda
a o p   |org-projectile/capture
a o s   |org-search-view
a o t   |org-todo-list
t m c   |spacemacs/toggle-mode-line-org-clock
a o B a |org-brain-agenda
a o B v |org-brain-visualize
a o C I |org-clock-in-last
a o C c |org-clock-cancel
a o C g |org-clock-goto
a o C i |org-clock-in
a o C j |spacemacs/org-clock-jump-to-current-clock
a o C o |org-clock-out
a o C r |org-resolve-clocks
a o f i |org-feed-goto-inbox
a o f u |org-feed-update-all



- TODOリスト
- 時間計測
  + カウントダウンタイマー
  + タイマー開始
- アジェンダ

```org
sc* 
```


C-c C-a         org-attach
C-c C-b         org-backward-heading-same-level
C-c C-c         org-ctrl-c-ctrl-c
C-c C-d         org-deadline
C-c C-e         org-export-dispatch
C-c C-f         org-forward-heading-same-level
C-c TAB         org-ctrl-c-tab
C-c C-j         org-goto
C-c C-k         org-kill-note-or-show-branches
C-c C-l         org-insert-link
C-c RET         org-ctrl-c-ret
C-c C-o         org-open-at-point
C-c C-q         org-set-tags-command
C-c C-r         org-reveal
C-c C-s         org-schedule
C-c C-t         org-todo
C-c C-v         Prefix Command
C-c C-w         org-refile
  (that binding is currently shadowed by another mode)
C-c C-x         Prefix Command
C-c C-y         org-evaluate-time-range
C-c C-z         org-add-note
C-c ESC         Prefix Command
C-c C-^         org-up-element
C-c C-_         org-down-element
C-c SPC         org-table-blank-field
C-c !           org-time-stamp-inactive
C-c "           Prefix Command
C-c #           org-update-statistics-cookies
C-c $           org-archive-subtree
C-c %           org-mark-ring-push
C-c &           org-mark-ring-goto
C-c '           org-edit-special
C-c *           org-ctrl-c-star
C-c +           org-table-sum
C-c ,           org-priority
C-c -           org-ctrl-c-minus
C-c .           org-time-stamp
C-c /           org-sparse-tree
C-c :           org-toggle-fixed-width
C-c ;           org-toggle-comment
C-c <           org-date-from-calendar
C-c =           org-table-eval-formula
C-c >           org-goto-calendar
C-c ?           org-table-field-info
C-c @           org-mark-subtree
C-c [           org-agenda-file-to-front
C-c \           org-match-sparse-tree
C-c ]           org-remove-file
C-c ^           org-sort
C-c `           org-table-edit-field
C-c {           org-table-toggle-formula-debugger
C-c |           org-table-create-or-convert-from-region
C-c }           org-table-toggle-coordinate-overlays
C-c ~           org-table-create-with-table.el
C-c C-*         org-list-make-subtree
C-c C-,         org-insert-structure-template


## ドキュメント

- [Swiper(ivy/counsel)](https://oremacs.com/swiper/)
- [Projectile](https://docs.projectile.mx/en/latest/)

## マイナーモード

標準ではオフになっているが任意でオンにするモード

| mode                                                                          | description                                          |
| ----                                                                          | -----------                                          |
| [aggressive-indent-mode](https://github.com/Malabarba/aggressive-indent-mode) | コードを常にインデントし続け変更のたびに再インデント |
| whitespace-mode                                                               | 空白の表示設定                                       |
|                                                                               |                                                      |
|                                                                               |                                                      |


## spacemacs.env

```shell
sed -i '.bak' "s|^PATH=.*|PATH=$PATH|" .spacemacs.d/.spacemacs.env
```

```elisp
(spacemacs/load-spacemacs-env)
```
