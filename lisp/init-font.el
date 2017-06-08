;; default font
(set-default-font "Inconsolata 12")

;;
;; face per buffer
;;
(add-hook 'org-mode-hook (lambda ()
                            (setq buffer-face-mode-face '(:family "SF Mono"))
                            (buffer-face-mode)))

;; font for latex-mode
(add-hook 'latex-mode-hook (lambda ()
                            (setq buffer-face-mode-face '(:family "Input Mono"))
                            (buffer-face-mode)))

;; font for text-mode
(add-hook 'text-mode-hook (lambda ()
                            (setq buffer-face-mode-face '(:family "GT Pressura Mono" :height 150))
                            (buffer-face-mode)))

;; font for ess-mode
(add-hook 'ess-mode-hook (lambda ()
                            (setq buffer-face-mode-face '(:family "Fantasque Sans Mono" :height 140))
                            (buffer-face-mode)))
(add-hook 'inferior-ess-mode-hook (lambda ()
                            (setq buffer-face-mode-face '(:family "Monoid" :height 100))
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
                            (setq buffer-face-mode-face '(:family "Monoid" :height 100))
                            (buffer-face-mode)))

(add-hook 'inferior-python-mode-hook (lambda ()
                            (setq buffer-face-mode-face '(:family "Consolas"))
                            (buffer-face-mode)))

;; font for message-buffer-mode
(add-hook 'message-buffer-mode-hook (lambda ()
                            (setq buffer-face-mode-face '(:family "Source Code Pro"))
                            (buffer-face-mode)))

(add-hook 'minibuffer-inactive-hook (lambda ()
                            (setq buffer-face-mode-face '(:family "Source Code Pro"))
                            (buffer-face-mode)))

;; font for fundamental-mode
(add-hook 'fundamental-mode-hook (lambda ()
                            (setq buffer-face-mode-face '(:family "Source Code Pro"))
                            (buffer-face-mode)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minibuffer-prompt ((t (:foreground "#268bd2" :family "Inconsolata")))))

(provide 'init-font)
