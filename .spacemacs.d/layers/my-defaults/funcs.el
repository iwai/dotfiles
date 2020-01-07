

(defun my/swiper-region ()
  (interactive)
  (if (use-region-p)
      (progn (let ((thing (buffer-substring-no-properties (region-beginning) (region-end))))
               (deactivate-mark)
               (swiper thing)))
    (swiper)))

(defun my/dap-for-go-mode ()
  (require 'dap-go)
  (spacemacs/dap-bind-keys-for-mode 'go-mode))
