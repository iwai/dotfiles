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
    org
    yasnippet
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

(defun my-defaults/post-init-yasnippet ()
  (spacemacs|use-package-add-hook yasnippet
    :post-init
    (progn
      (add-to-list 'yas-snippet-dirs yas-installed-snippets-dir)

      )))


;;; packages.el ends here
