
;dictionary
;; press F8 on keypad to lookup definition
(use-package osx-dictionary
  :config
  :ensure t
  :init)
(global-set-key (kbd "<f8>") 'osx-dictionary-search-word-at-point)

(use-package synonyms
  :config
  :ensure t
  :init)

(setq synonyms-file "~/.emacs.d/lisp/ mthesaur.txt")
(require 'synonyms)

(provide 'init-dictionary)




