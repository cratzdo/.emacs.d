;;------------------------------
;; fast window switching
;;------------------------------
(use-package window-numbering
  :ensure t
  :init)

(setq window-numbering-assign-func
      (lambda () (when (equal (buffer-name) "*Calculator*") 9)))

(provide 'init-windows)
