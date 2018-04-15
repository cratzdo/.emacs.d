
;dictionary
;; press F8 on keypad to lookup definition
(use-package osx-dictionary
  :ensure t
  :init)
(global-set-key (kbd "<f8>") 'osx-dictionary-search-word-at-point)

;; define words at points
(use-package define-word
  :ensure t
  :init
  :config (global-set-key (kbd "C-c d") 'define-word-at-point))
(global-set-key (kbd "C-c D") 'define-word)


(provide 'init-dictionary)




