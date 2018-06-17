
;;
;; auto-save-buffers-----------------------------
;;
;;Require installation of auto-save-buffers-enhanced
(use-package auto-save-buffers-enhanced
  :ensure t
  :init)
(require 'auto-save-buffers-enhanced)
(auto-save-buffers-enhanced t)

;;automatically revert when a file has been editted in a external program
(global-auto-revert-mode 1)

;; use super-save to replace vanilla auto-save
(use-package super-save
  :defer
  :ensure t
  :init  )

(super-save-mode +1)
(setq super-save-auto-save-when-idle t)
(setq auto-save-default nil) 


(provide 'init-autosave)
