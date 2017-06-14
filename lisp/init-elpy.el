;;; Install elpy 

(use-package elpy
  :config
  :init)

;; install iedit
(use-package iedit
  :config
  :init)

(elpy-enable)

;; Fixing a key binding bug in elpy
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)

;; Fixing another key binding bug in iedit mode
(define-key global-map (kbd "C-c o") 'iedit-mode)

(provide 'init-elpy)