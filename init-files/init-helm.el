;;-------------------helm----------------------
;;helm
(use-package helm
  :ensure t
  :init)

(require 'helm-config)
;(require 'helm-flycheck)
;(require 'helm-flyspell)
(setq helm-everywhere t)

(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key "\C-x\C-m" #'helm-M-x)
(global-set-key "\C-c\C-m" #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x b") #'helm-buffers-list)

;; helm for project management
(use-package helm-projectile
      :init
      (helm-projectile-on)
      (setq projectile-completion-system 'helm)
      (setq projectile-indexing-method 'alien))

(helm-mode 1)

(provide 'init-helm)
