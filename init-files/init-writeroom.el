;;==============================
;; writeroom mode
;;==============================

(use-package writeroom-mode
  :ensure t
  :config (setq writeroom-width  120)
  :init)

(global-writeroom-mode 0)
(global-set-key (kbd "<f6>") 'writeroom-mode)
(setq writeroom-fullscreen-effect 'fullscreen)

(provide 'init-writeroom)
