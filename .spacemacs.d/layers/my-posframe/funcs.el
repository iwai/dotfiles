;;; funcs.el
;;
;; Copyright (c) 2018 Yuji Iwai
;;
;; Author: Yuji Iwai <iwai.ug@gmail.com>
;; URL: 
;;
;;; License: MIT

;;; Code:


(defun my-posframe-ivy-posframe-get-size ()
  "Customizing `ivy-posframe-size-function' functon :min-width tweak."
  (list
   :height ivy-posframe-height
   :width ivy-posframe-width
   :min-height (or ivy-posframe-min-height (+ ivy-height 1))
   :min-width (or ivy-posframe-min-width (+ (window-width) 2))))

(defun my-posframe-which-key-custom-popup-max-dimensions-function ()
  (cons (frame-height) 180))

;;; func.el ends here
