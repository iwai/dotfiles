# SPACEMACS


## 日本語フォント

- 12pt設定じゃないと綺麗な等幅にならない...
- https://shino.tumblr.com/post/25720825967/等幅フォントでは3-の倍数以外のフォントサイズを使用すると半角文字と全角文字の横幅比が-12
- https://qiita.com/melito/items/238bdf72237290bc6e42
- https://miyazakikenji.wordpress.com/2016/08/30/日本語-font-の導入/


## lsp-mode

- https://microsoft.github.io/language-server-protocol/


## パースペクティブ

パースペクティブは、ウィンドウ構成と一連のバッファーで構成されており、少なくとも一つのワークスペースを保持します。
また、パースペクティブに連動してプロジェクトを切替られるようになっています。
これらは、 persp-mode, eyebrowse, projectile のパッケージにより実現されています。

|SPC p l|spacemacs/ivy-persp-switch-project (Layouts)|パースペクティブとプロジェクトの切替|


## プロジェクト

プロジェクトの新規作成はありません、プロジェクト＝Gitリポジトリの概念で、プロジェクト固有のファイルは必要ありません。
Gitリポジトリ以外にも mercurial などいくつかに対応しています。もしリポジトリの無いフォルダを対象としたい場合は、
`.projectile` という名前の空ファイルを置くだけです。

|SPC p SPC|counsel-projectile|プロジェクトを選択してファイルを開く|
|SPC p p|counsel-projectile-switch-project|プロジェクトを選択（切替）してファイルを開く|

|SPC p f|counsel-projectile-find-file|プロジェクト内からファイルを開く|
|SPC p b|counsel-projectile-switch-to-buffer|プロジェクト内で表示されているバッファを選択|
|SPC p k|projectile-kill-buffers|プロジェクトに関連するバッファをすべて削除|
|SPC p r|projectile-recentf|プロジェクトに関連する訪問履歴からファイルを開く|

|SPC p %|projectile-replace-regexp|
|SPC p g|projectile-find-tag|
|SPC p G|projectile-regenerate-tags|
|SPC p c|projectile-compile-project|
|SPC p T|projectile-test-project|
|SPC p I|projectile-invalidate-cache|

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

|SPC p l w|spacemacs/ivy-persp-switch-project (Workspace)|ワークスペースの切替|
|SPC b W|spacemacs/goto-buffer-workspace|指定したバッファを表示しているワークスペースへ移動、表示がなければ現在のバッファに表示|


## Layout





## モードライン

|keybind|unicode|ascii|mode||
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

https://github.com/DarthFennec/highlight-indent-guides
https://github.com/zk-phi/indent-guide
https://github.com/Malabarba/aggressive-indent-mode
https://github.com/Fuco1/smartparens

### 

```elisp
   dotspacemacs-mode-line-theme (if (display-graphic-p)
                                    '(all-the-icons :separator arrow :separator-scale 1.5)
                                  '(spacemacs :separator arrow :separator-scale 1.5))
```

`M-x all-the-icons-install-fonts`

## Flycheck

`syntax-checking` レイヤーにより自動で有効になるようになっていて、 `flycheck-global-modes` に含まれるモードは、自動的に有効になる

Emacs-Lispは有効になっていなかったので追加する `(spacemacs/add-flycheck-hook 'emacs-lisp-mode)`

|SPC e v|flycheckの設定を確認|
|SPC e l|すべてのエラーのリストを表示します|
|SPC e .||


## Emcas Lisp




## Reference

Emacsの補完と検索を超強化する
https://qiita.com/blue0513/items/c0dc35a880170997c3f5
Emacsの検索機能を使いこなす
http://dev.ariel-networks.com/articles/emacs/part1/

https://www.reddit.com/r/emacs/comments/cfag4z/emacsp0rn_emacs_with_a_slick_ui_link_in_comments/
https://github.com/ianpan870102/.emacs.d
https://github.com/ianpan870102/.use-package.emacs.d

https://github.com/cy20lin/.spacemacs.d
https://github.com/yoshidaster/emacs-config
https://github.com/jupl/.spacemacs.d
https://github.com/drgeb/spacemacs

https://sriramkswamy.github.io/dotemacs/


EmacsWiki
https://www.emacswiki.org/emacs/サイトマップ

## Package Manager

https://nukosuke.hatenablog.jp/entry/straight-el
https://emacs-jp.github.io/packages/package-management/package-el
http://emacs.rubikitch.com/use-package-2/

## terminal

https://github.com/dieggsy/eterm-256color

emacs上のterm.elで正しくansi colorを256色表示する方法
http://geekna.hatenablog.jp/entry/20130901/p1
Emacs上のターミナルを最強に: term+.el
https://tarao.hatenablog.com/entry/20121021/1350844264


## Theme

`dotspacemacs-configuration-layers` に `themes-megapack` を追加して、 `dotspacemacs-themes` に `dracula` を追加


## Migration

アップグレードを実施した際、init.elの構成が変更される場合があるので、差分を適用する場合

|SPC f e D|ediff-dotfile-and-template|現在のinit.elとテンプレートをediff|
