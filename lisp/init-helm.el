;;-------------------helm----------------------
;;helm
(use-package helm
  :config
  :ensure
  :init)
(require 'helm-config)
(setq helm-everywhere t)

(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x b") #'helm-buffers-list)

(helm-mode 1)

(provide 'init-helm)
