;;----------------------
;; cpp IDE
;; ---------------------
;(require 'setup-helm)

(use-package helm-gtags
  :ensure t
  :init)
(require 'setup-helm-gtags)

;; or use ggtags
(use-package ggtags
  :ensure t
  :init)

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

(require 'helm-gtags)
;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

;; (require 'setup-ggtags)
(setq speedbar-show-unknown-files t)
(use-package company
  :ensure t
  :init)
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(use-package sr-speedbar
  :ensure t
  :init)

;; code completion
(use-package cedet
 :ensure t
 :init)

(use-package cc-mode
  :ensure t
  :init)
(require 'cc-mode)
;; company-c-headers
(use-package company-c-headers
  :init
  (add-to-list 'company-backends 'company-c-headers))

;;
(use-package semantic
  :ensure t
  :init)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)

(semantic-mode 1)

;; project management with projectile
(projectile-mode 1)

;;-----------------------
;; counsel-etags
;;-----------------------
;; (require 'counsel-etags) 


(provide 'init-c++)
