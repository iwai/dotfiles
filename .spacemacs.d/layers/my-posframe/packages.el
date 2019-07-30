;;; packages.el --- my-posframe layer packages file for Spacemacs.
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
;; added to `my-posframe-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `my-posframe/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `my-posframe/pre-init-PACKAGE' and/or
;;   `my-posframe/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst my-posframe-packages
  '(
    ivy-posframe
    which-key-posframe
    )
  "The list of Lisp packages required by the my-posframe layer.

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


(defun my-posframe/init-ivy-posframe ()
  (use-package ivy-posframe
    :diminish ""
    :init
    (progn
      (setq ivy-posframe-display-functions-alist
            '((swiper            . nil)
              (complete-symbol   . ivy-posframe-display-at-point)
              (counsel-M-x       . ivy-posframe-display-at-window-bottom-left)
              (ivy-switch-buffer . ivy-posframe-display-at-window-bottom-left)
              (counsel-find-file . ivy-posframe-display-at-window-bottom-left)))

      (setq ivy-posframe-height-alist
            '(
              (counsel-M-x . 8)
              ))
      (ivy-posframe-mode 1)
      )
    :config
    (progn
      (setq posframe-arghandler #'my-posframe-arghandler)

      (defun my-posframe-arghandler (posframe-buffer arg-name value)
        (if posframe-buffer
            (message "%s %s: %s" posframe-buffer arg-name value)
            )
        ;; (let ((info '(:internal-border-width 10 :background-color "green")))
        ;;   (or (plist-get info arg-name) value))
        value)
      )
    :custom
    (ivy-posframe-border-width 3)
    (ivy-posframe-size-function #'my-posframe-ivy-posframe-get-size)
    :custom-face
    (ivy-posframe ((t (:background "#464752"))))
    (ivy-posframe-border ((t (:background "#565761"))))
    ))

(defun my-posframe/init-which-key-posframe ()
  (use-package which-key-posframe
    :init
    (progn
      (which-key-posframe-mode)
      ;; override max-dimensions function, return custom values.
      (setq which-key-custom-popup-max-dimensions-function
            'my-posframe-which-key-custom-popup-max-dimensions-function)
      )
    :custom
    (which-key-posframe-poshandler 'posframe-poshandler-frame-center)
    ;; (which-key-posframe-width 180)
    (which-key-posframe-border-width 3)
    (which-key-posframe-parameters `((background-color . "#464752")))
    :custom-face
    (which-key-posframe-border ((t (:background "#565761"))))
    ))

;;; packages.el ends here
