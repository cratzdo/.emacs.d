;;; Install elpy 

(use-package elpy
  :ensure t
  :config
  :init)

;; install iedit
(use-package iedit
  :config
  :init)

(setq python-shell-interpreter "ipython3"
      python-shell-interpreter-args "-i")


(elpy-enable)
(elpy-use-ipython)

;; Fixing a key binding bug in elpy
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)

;; Fixing another key binding bug in iedit mode
(define-key global-map (kbd "C-c o") 'iedit-mode)

(provide 'init-elpy)
