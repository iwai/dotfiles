;;; packages.el --- my-defaults layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Yuji Iwai <iwai.ug@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `my-defaults-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `my-defaults/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `my-defaults/pre-init-PACKAGE' and/or
;;   `my-defaults/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst my-defaults-packages
  '(
    ;; appearance
    doom-themes

    ;; general
    swiper
    multiple-cursors

    ;; additional
    direnv

    ;; customize
    org
    markdown-mode
    yasnippet
;;    treemacs
    lsp-ui
    go-mode
    )
  "The list of Lisp packages required by the my-defaults layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun my-defaults/init-doom-themes ()
  (use-package doom-themes
    :config
    (doom-themes-treemacs-config)
    ))


(defun my-defaults/pre-init-swiper ()
  (spacemacs|use-package-add-hook swiper
    :post-config
    (progn
      (setq ivy-count-format "(%d/%d) ")
      ;; 範囲指定されている文字列を検索
      (define-key evil-emacs-state-map (kbd "C-s") 'my/swiper-region)
      (define-key evil-emacs-state-map (kbd "C-r") 'my/swiper-region)
      ;; (define-key evil-emacs-state-map (kbd "C-s") 'swiper-thing-at-point)
      ;; ;; https://github.com/abo-abo/swiper/issues/2137
      (define-key ivy-minibuffer-map (kbd "C-r") 'ivy-previous-line-or-history)

      )))

(defun my-defaults/pre-init-multiple-cursors ()
  (spacemacs|use-package-add-hook multiple-cursors
    :post-init
    (progn
      (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
      (global-set-key (kbd "C->") 'mc/mark-next-like-this)
      (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
      (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
      )))

(defun my-defaults/post-init-org ()
  (spacemacs|use-package-add-hook org
    :post-config
    (progn

      ;; https://emacs.stackexchange.com/a/22589
      (defun my/org-mode-hook ()
        "Stop the org-level headers from increasing in height relative to the other text."
        (dolist (face '(org-level-1
                        org-level-2
                        org-level-3
                        org-level-4
                        org-level-5))
          (set-face-attribute face nil :height 1.0)))
      (add-hook 'org-mode-hook 'my/org-mode-hook)

      )))

(defun my-defaults/post-init-markdown-mode ()
  (spacemacs|use-package-add-hook markdown-mode
    :post-config
    (progn
      ;; workaround for failed jit-lock-mode same error
      ;; https://github.com/syl20bnr/spacemacs/issues/12059
      (remove-hook 'markdown-mode-hook 'orgtbl-mode)
      (remove-hook 'markdown-mode-hook 'spacemacs//cleanup-org-tables-on-save)
      )))

(defun my-defaults/post-init-yasnippet ()
  (spacemacs|use-package-add-hook yasnippet
    :post-init
    (progn
      (add-to-list 'yas-snippet-dirs yas-installed-snippets-dir)

      )))

;; (defun my-defaults/post-init-treemacs ()
;;   (spacemacs|use-package-add-hook treemacs
;;     :post-config
;;     (progn
;;       (treemacs-follow-mode -1)
;;       )))

(defun my-defaults/post-init-lsp-ui ()
  (spacemacs|use-package-add-hook lsp-ui
    :post-config
    (progn
      (setq lsp-ui-sideline-enable nil)
      (setq lsp-ui-doc-enable nil)
      )))

(defun my-defaults/post-init-go-mode ()
  (spacemacs|use-package-add-hook go-mode
    :post-config
    (progn
      (if (configuration-layer/layer-used-p 'lsp)
          (progn
            (add-hook 'go-mode-hook 'my/dap-for-go-mode t)
            (remove-hook 'go-mode-hook 'go-eldoc-setup)
            ))
      )))

(defun my-defaults/init-direnv ()
  (use-package direnv
    :config
    (direnv-mode)))

;;; packages.el ends here
