;; default font
; (set-default-font "Inconsolata LGC 12")

;;
;; face per buffer
;;
(add-hook 'org-mode-hook (lambda ()
                            (setq buffer-face-mode-face '(:family "SF Mono"))
                            (buffer-face-mode)))

;; font for latex-mode
(add-hook 'latex-mode-hook (lambda ()
                            (setq buffer-face-mode-face '(:family "GT Pressura Mono" :height 160))
                            (buffer-face-mode)))

;; font for text-mode
(add-hook 'text-mode-hook (lambda ()
                            (setq buffer-face-mode-face '(:family "GT Pressura Mono" :height 170))
                            (buffer-face-mode)))

;; font for ess-mode
(add-hook 'ess-mode-hook (lambda ()
                            (setq buffer-face-mode-face '(:family "Fantasque Sans Mono" :height 140))
                            (buffer-face-mode)))
(add-hook 'inferior-ess-mode-hook (lambda ()
                            (setq buffer-face-mode-face '(:family "Consola Mono" :height 110))
                            (buffer-face-mode)))


;; font for emacs-lisp-mode
(add-hook 'emacs-lisp-mode-hook (lambda ()
                            (setq buffer-face-mode-face '(:family "Inconsolata LGC"))
                            (buffer-face-mode)))
;; font for eshell
(add-hook 'eshell-mode-hook (lambda ()
                            (setq buffer-face-mode-face '(:family "Input Mono"))
                            (buffer-face-mode)))

;; font for help-mode
(add-hook 'help-mode-hook (lambda ()
                            (setq buffer-face-mode-face '(:family "Monoid"))
                            (buffer-face-mode)))

;; font for python-mode
(add-hook 'python-mode-hook (lambda ()
                            (setq buffer-face-mode-face '(:family "Consola Mono" :height 130))
                            (buffer-face-mode)))

(add-hook 'inferior-python-mode-hook (lambda ()
				       (setq buffer-face-mode-face '(:family "Inconsolata LGC" :height 130))
                            (buffer-face-mode)))

;; font for message-buffer-mode
(add-hook 'message-buffer-mode-hook (lambda ()
                            (setq buffer-face-mode-face '(:family "Inconsolata"))
                            (buffer-face-mode)))

(add-hook 'minibuffer-inactive-hook (lambda ()
                            (setq buffer-face-mode-face '(:family "Inconsolata"))
                            (buffer-face-mode)))

;; font for fundamental-mode
(add-hook 'fundamental-mode-hook (lambda ()
                            (setq buffer-face-mode-face '(:family "Inconsolata"))
                            (buffer-face-mode)))

;; font for shell-mode
(add-hook 'shell-mode-hook (lambda ()
                            (setq buffer-face-mode-face '(:family "Inconsolata"))
                            (buffer-face-mode)))



(provide 'init-font)
