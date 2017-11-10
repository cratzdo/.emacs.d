
;;
;; auto-save-buffers-----------------------------
;;
;;Require installation of auto-save-buffers-enhanced
(use-package auto-save-buffers-enhanced
  :config
  :init)
(require 'auto-save-buffers-enhanced)
(auto-save-buffers-enhanced t)

;;automatically revert when a file has been editted in a external program
(global-auto-revert-mode 1)

(provide 'init-autosave)
