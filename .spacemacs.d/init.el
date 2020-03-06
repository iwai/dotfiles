;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(typescript
     themes-megapack

     lsp
     dap

     org
     emacs-lisp
     shell-scripts
     vimscript

     sql
     markdown
     html
     yaml
     javascript

     (ruby :variables
           ruby-version-manager 'rbenv
           ruby-backend 'lsp
           ruby-test-runner 'rspec)
     ruby-on-rails
     python

     (php :variables php-backend 'lsp)
     (java :variables java-backend 'lsp)

     (go :variables
         go-tab-width 4
         go-backend 'lsp
         go-linter 'golangci-lint
         gofmt-command "goimports"
         go-format-before-save t
         go-use-test-args "-race -timeout 10s"
         godoc-at-point-function 'godoc-gogetdoc
         )
     rust

     docker

     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     syntax-checking

     (ivy :variables
          ivy-enable-advanced-buffer-information t)
     git
     (version-control :variables
                      version-control-diff-tool 'diff-hl
                      version-control-diff-side 'left)

     (shell :variables
            shell-default-term-shell "/bin/bash"
            shell-default-shell 'ansi-term
            shell-default-position 'bottom
            shell-default-full-span t
            )
     ;; spell-checking

     (multiple-cursors :variables
                       multiple-cursors-backend 'mc)

     ;; -- private layers
     my-posframe
     my-defaults
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     persistent-scratch
     eterm-256color
     editorconfig
     rainbow-mode
     ripgrep
     langtool
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(evil-anzu evil-args evil-ediff evil-escape evil-exchange evil-iedit-state evil-indent-plus evil-lisp-state evil-magit evil-matchit evil-mc evil-nerd-commenter evil-numbers evil-search-highlight-persist evil-surround evil-tutor evil-unimpaired evil-visual-mark-mode evil-visualstar)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https nil
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa t

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs

   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         dracula
                         doom-dracula
                         )
   ;; dotspacemacs-themes '(dracula
   ;;                       doom-dracula
   ;;                       spacemacs-dark
   ;;                       spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme (if (display-graphic-p)
                                    '(spacemacs :separator arrow :separator-scale 1.5)
                                  '(spacemacs :separator utf-8 :separator-scale 1.5))
   ;;dotspacemacs-mode-line-theme '(doom)
   ;;dotspacemacs-mode-line-theme '(all-the-icons :separator arrow :separator-scale 1.4)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts.
   dotspacemacs-default-font '("RictyDiminished Nerd Font"
                               :size 12
                               :weight normal
                               :width normal
                               :powerline-scale 1.5
                               )

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout t

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'origami

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  (setq user-full-name (string-trim-right (shell-command-to-string "git config --get user.name") "\n$"))
  (setq user-mail-address (string-trim-right (shell-command-to-string "git config --get user.email") "\n$"))

  (when (eq system-type 'darwin)
    )
  (defun dotspacemacs//mac-command-key-to-meta (style)
    "Set command-key to meta for the given editing STYLE."
    (cond ((and (eq 'emacs style)
                (display-graphic-p))
           ;; Emacs styleの時だけmetaキーに変更
           (setq mac-option-modifier nil)
           (setq mac-command-modifier 'meta))
          (t
           (setq mac-option-modifier 'meta)
           (setq mac-command-modifier 'super)
           )
          ))
  (add-hook 'spacemacs-editing-style-hook 'dotspacemacs//mac-command-key-to-meta)

  ;; start error from commandline
  ;; https://github.com/syl20bnr/spacemacs/issues/4755#issuecomment-292760094
  ;; (setq explicit-shell-file-name "/usr/local/bin/fish")
  ;; (setq shell-file-name "fish")

  (set-language-environment "Japanese")
  (prefer-coding-system 'utf-8-unix)

  ;;(set-terminal-coding-system 'utf-8)

  (when (cond ((and (>= emacs-major-version 23)
                    (display-graphic-p))

               (setq default-font-family "RictyDiminished Nerd Font")

               (set-face-attribute 'default nil     :family default-font-family)
               ;; markdown-modeのテーブルが fixed-pitch を継承していて、Monospace指定だったので変更
               (set-face-attribute 'fixed-pitch nil :family default-font-family)

               (defun set-japanese-font (family)
                 (set-fontset-font (frame-parameter nil 'font) 'japanese-jisx0208 (font-spec :family family))
                 (set-fontset-font (frame-parameter nil 'font) 'japanese-jisx0212 (font-spec :family family))
                 (set-fontset-font (frame-parameter nil 'font) 'katakana-jisx0201 (font-spec :family family)))

               ;; Overwrite latin and greek char's font
               (defun set-latin-and-greek-font (family)
                 (set-fontset-font (frame-parameter nil 'font) '(#x0250 . #x02AF) (font-spec :family family)) ; IPA extensions
                 (set-fontset-font (frame-parameter nil 'font) '(#x00A0 . #x00FF) (font-spec :family family)) ; latin-1
                 (set-fontset-font (frame-parameter nil 'font) '(#x0100 . #x017F) (font-spec :family family)) ; latin extended-A
                 (set-fontset-font (frame-parameter nil 'font) '(#x0180 . #x024F) (font-spec :family family)) ; latin extended-B
                 (set-fontset-font (frame-parameter nil 'font) '(#x2018 . #x2019) (font-spec :family family)) ; end quote
                 (set-fontset-font (frame-parameter nil 'font) '(#x2588 . #x2588) (font-spec :family family)) ; █
                 (set-fontset-font (frame-parameter nil 'font) '(#x2500 . #x2500) (font-spec :family family)) ; ─
                 (set-fontset-font (frame-parameter nil 'font) '(#x2504 . #x257F) (font-spec :family family)) ; box character
                 (set-fontset-font (frame-parameter nil 'font) '(#x0370 . #x03FF) (font-spec :family family)))

               (set-japanese-font default-font-family)
               (set-latin-and-greek-font default-font-family)

               )))

  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (setq delete-by-moving-to-trash t) ; Deleting files go to OS's trash
  (setq compilation-window-height 15)

  ;; http://malkalech.com/emacs_c-h_backspace
  (define-key evil-emacs-state-map (kbd "C-h") (kbd "<DEL>"))
  (define-key counsel-mode-map (kbd "C-h") (kbd "<DEL>"))

  ;; https://github.com/abo-abo/swiper/issues/1525
  ;; counsel-file-jump は非同期じゃないらしいので counsel-fzf にしてみるの巻き
  ;; (define-key evil-emacs-state-map (kbd "C-x C-f") 'counsel-fzf)

  (when (display-graphic-p)

    (if (version< spacemacs-version "0.300.0")
        (exec-path-from-shell-copy-envs '("PATH" "LANG" "WD_ROOT")))

    ;; https://memo.sugyan.com/entry/20120228/1330392943
    (define-key evil-emacs-state-map (kbd "C-,") 'other-window)
    (define-key counsel-mode-map (kbd "C-,") 'other-window)
    )
  
  (setq persistent-scratch-save-file "~/.spacemacs.d/.persistent-scratch")
  (setq persistent-scratch-backup-directory "~/.spacemacs.d/.persistent-scratch-backup")

  (persistent-scratch-setup-default)

  (setq projectile-project-search-path (list (getenv "WD_ROOT")))

  ;; emacs-ja.info
  ;; https://ayatakesi.github.io
  ;; http://emacs.rubikitch.com/emacs245-manual-ja/
  (add-to-list 'Info-directory-list "~/.spacemacs.d/info")
  (defun Info-find-node--info-ja (orig-fn filename &rest args)
    (apply orig-fn
           (pcase filename
             ("emacs" "emacs-ja")
             (t filename))
           args))
  (advice-add 'Info-find-node :around 'Info-find-node--info-ja)


  (setq whitespace-style '(face           ; faceで可視化
                           trailing       ; 行末
                           tabs           ; タブ
                           ;;empty          ; 先頭/末尾の空行
                           space-mark     ; 表示のマッピング
                           tab-mark
                           ))
  (setq whitespace-display-mappings
        '((tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))
  (global-whitespace-mode 1)

  (if (eq (first dotspacemacs-mode-line-theme) 'spacemacs)
      (progn
        ;; http://blog.livedoor.jp/tek_nishi/archives/9654557.html
        ;; https://gist.github.com/tek-nishi/93bfa4614f1254b0c2255bc122d0d1c0#file-buffer-encoding-abbrev-el
        (spaceline-define-segment buffer-encoding-abbrev
          "The line ending convention used in the buffer."
          (let ((buf-coding (format "%s" buffer-file-coding-system)))
            (list (replace-regexp-in-string "^prefer-" ""
                                            (replace-regexp-in-string "-with-signature\\|-unix\\|-dos\\|-mac" "" buf-coding))
                  (concat (and (string-match "with-signature" buf-coding) "ⓑ")
                          (and (string-match "unix"           buf-coding) "ⓤ")
                          (and (string-match "dos"            buf-coding) "ⓓ")
                          (and (string-match "mac"            buf-coding) "ⓜ")
                          )))
          :separator "")

        (spaceline-toggle-buffer-size-off)
        ))

  (add-hook 'term-mode-hook #'eterm-256color-mode)

  (setq spaceline-org-clock-p t)
  (setq org-default-notes-file "notes.org")

  (spacemacs|hide-lighter rainbow-mode)
  (dumb-jump-mode 1)

  (setq ruby-insert-encoding-magic-comment nil)

  (setq langtool-default-language "en-US")
  (setq langtool-bin "/usr/local/bin/languagetool")

  )

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(evil-want-Y-yank-to-eol nil)
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f"))))
 '(ivy-posframe-border-width 3)
 '(ivy-posframe-size-function (quote my-posframe-ivy-posframe-get-size))
 '(package-selected-packages
   (quote
    (mvn meghanada maven-test-mode lsp-java groovy-mode groovy-imports pcache gradle-mode projectile-rails inflections langtool feature-mode enh-ruby-mode ripgrep tide typescript-mode import-js grizzl add-node-modules-path dap-mode bui tree-mode direnv which-key-posframe rainbow-mode ivy-posframe posframe all-the-icons-dired elscreen perspeen yapfify web-beautify toml-mode sql-indent racer pyvenv pytest pyenv-mode py-isort pip-requirements livid-mode skewer-mode simple-httpd live-py-mode js2-refactor multiple-cursors hy-mode flycheck-rust cython-mode company-anaconda cargo rust-mode anaconda-mode pythonic js2-mode js-doc company-tern dash-functional tern coffee-mode treemacs-projectile treemacs-magit origami treemacs ht pfuture git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter diff-hl unfill mwim eterm-256color fzf-spacemacs-layer fzf org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download htmlize gnuplot helm-themes helm-swoop helm-projectile helm-mode-manager helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag ace-jump-helm-line helm helm-core xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help go-guru go-eldoc company-go go-mode flycheck-pos-tip pos-tip flycheck web-mode tagedit slim-mode scss-mode sass-mode pug-mode haml-mode emmet-mode company-web web-completion-data yaml-mode persistent-scratch vimrc-mode dactyl-mode robe bundler insert-shebang fish-mode company-shell rvm ruby-tools ruby-test-mode rubocop rspec-mode rbenv rake minitest chruby inf-ruby dockerfile-mode docker json-mode tablist docker-tramp json-snatcher json-reformat phpunit phpcbf php-extras php-auto-yasnippets drupal-mode php-mode smeargle orgit magit-gitflow magit-popup gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link fuzzy evil-magit magit transient git-commit with-editor company-statistics company auto-yasnippet yasnippet ac-ispell auto-complete mmm-mode markdown-toc markdown-mode gh-md ws-butler winum which-key wgrep volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline smex restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint ivy-hydra indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-make google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump popup f dash s diminish define-word counsel-projectile projectile pkg-info epl counsel swiper ivy column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed async aggressive-indent adaptive-wrap ace-window ace-link avy)))
 '(pdf-view-midnight-colors (quote ("#b2b2b2" . "#292b2e")))
 '(safe-local-variable-values
   (quote
    ((projectile-project-run-cmd . "go run")
     (projectile-project-compilation-cmd . "go build")
     (projectile-project-compilation-cmd . "")
     (javascript-backend . tern)
     (javascript-backend . lsp)
     (go-backend . go-mode)
     (go-backend . lsp))))
 '(which-key-posframe-border-width 3)
 '(which-key-posframe-parameters (quote ((background-color . "#464752"))))
 '(which-key-posframe-poshandler (quote posframe-poshandler-frame-center)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ivy-posframe ((t (:background "#464752"))))
 '(ivy-posframe-border ((t (:background "#565761"))))
 '(term-default-bg-color ((t (:inherit term-color-black))))
 '(which-key-posframe-border ((t (:background "#565761")))))
)
