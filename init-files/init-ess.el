;; install ESS
(use-package ess
  :config
  :init)

(require 'ess-swv)
(require 'ess-utils)
(require 'ess-noweb)
(require 'ess-noweb-mode)
;; (require ‘ess-eldoc)

;; hit ENTER for newline
(add-hook 'ess-mode-hook
          (lambda ()
            (local-set-key (kbd "RET") 'newline)))
;; smart underscore
(setq ess-smart-S-assign-key ":")
(setq ess-smart-operators "%")

(add-hook 'ess-mode-hook
          (lambda ()
            (ess-toggle-S-assign nil)
            (ess-toggle-underscore nil) ; leave underscore key alone!
            ))

;; Comment-uncomment a selected region with C-d or C-maj-d
;; (defun uncomment-region (beg end)
;;   "Like `comment-region' invoked with a C-u prefix arg."
;;   (interactive "r")
;;   (comment-region beg end -1))

;; (add-hook 'ess-mode-hook
;;       (lambda ()
;; (define-key ess-mode-map (kbd "C-:") 'comment-region)
;; (define-key ess-mode-map (kbd "C-:") 'uncomment-region)
;; ))

;; aggressive-indent mode
(use-package aggressive-indent
  :ensure t
  :init )

;; enable in emacs-lisp-mode
(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
(add-hook 'ess-mode-hook #'aggressive-indent-mode)
	  

;; default sweave processor
(custom-set-variables
 '(ess-swv-prossor (quote knitr)))

;; poly-mode for writing Rmd with ess
(use-package polymode
  :ensure t
  :init)
(require 'poly-R)
(require 'poly-markdown)

;;; MARKDOWN
(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))
;;; R modes
(add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))

(provide 'init-ess)
