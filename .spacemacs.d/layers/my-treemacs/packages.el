;;; packages.el --- my-treemacs layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
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
;; added to `my-treemacs-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `my-treemacs/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `my-treemacs/pre-init-PACKAGE' and/or
;;   `my-treemacs/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst my-treemacs-packages
  '(
    golden-ratio
    treemacs
    treemacs-projectile
    treemacs-magit
    winum
    )
  "The list of Lisp packages required by the my-treemacs layer.

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

(defun my-treemacs/pre-init-golden-ratio ()
  (spacemacs|use-package-add-hook golden-ratio
    :post-config
    (add-to-list 'golden-ratio-exclude-buffer-regexp
                 (rx "*Treemacs" (0+ any)))))

(defun my-treemacs/pre-init-winum ()
  (spacemacs|use-package-add-hook winum
    :post-config
    (progn
      ;; window 0 is reserved for file trees
      (spacemacs/set-leader-keys "0" #'treemacs-select-window)
      (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))))


(defun my-treemacs/init-treemacs ()
  (use-package treemacs
    :commands (treemacs-select-window treemacs--window-number-ten treemacs-current-visibility)
    :defer t
    :init
    (spacemacs/set-leader-keys
      "ft"    #'treemacs
      "fT"    #'treemacs
      "fB"    #'treemacs-bookmark
      "f C-t" #'treemacs-find-file)
    :config
    (progn
      ;;(spacemacs/define-evil-state-face "treemacs" "MediumPurple1")
      (setq treemacs-no-png-images t
            treemacs-width 30
            treemacs-position 'left
            treemacs-is-never-other-window nil
            treemacs-silent-refresh nil
            treemacs-indentation 2
            treemacs-change-root-without-asking nil
            treemacs-sorting 'alphabetic-desc
            treemacs-show-hidden-files t
            treemacs-never-persist nil
            treemacs-goto-tag-strategy 'refetch-index
            ;;treemacs-collapse-dirs treemacs-use-collapsed-directories
            )
      (treemacs-follow-mode -1)
      ;; (when treemacs-use-follow-mode
      ;;   (treemacs-follow-mode t))
      ;; (when treemacs-use-filewatch-mode
      ;;   (treemacs-filewatch-mode t))

      ;; ;; this boundp check guards against a new feature that not all treemacs installations will have
      ;; ;; TODO remove this guard in a few weeks
      ;; (when (boundp 'treemacs-git-mode)
      ;;   (when (memq treemacs-use-git-mode '(simple extended))
      ;;     (treemacs-git-mode treemacs-use-git-mode)))
      )))

(defun my-treemacs/init-treemacs-projectile ()
  (use-package treemacs-projectile
    :commands (treemacs--projectile-current-user-project-function)
    :defer t
    :init
    (spacemacs/set-leader-keys
      "fp" #'my-treemacs-projectile-toggle
      "fP" #'treemacs-projectile
      "pt" #'my-treemacs-projectile-toggle)))

(defun my-treemacs/init-treemacs-magit ()
  (use-package treemacs-magit
    :defer t
    :after treemacs magit
    ))


;;; packages.el ends here
