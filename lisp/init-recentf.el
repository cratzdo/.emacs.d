;;
;; recent files
;;
(use-package recentf
  :ensure t
  :init)
(recentf-mode 1)
(global-set-key (kbd "<f7>") 'recentf-open-files)


(provide 'init-recentf)
