;; auto-complete

(use-package auto-complete
  :ensure t
  :init)

(require 'auto-complete-config)
(ac-config-default)
(setq ac-show-menu-immediately-on-auto-complete t)

(provide 'init-autocomplete)

