

(defun my/swiper-region ()
  (interactive)
  (if (use-region-p)
      (progn (let ((thing (buffer-substring-no-properties (region-beginning) (region-end))))
               (deactivate-mark)
               (swiper thing)))
    (swiper)))
