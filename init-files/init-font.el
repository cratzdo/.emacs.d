;; default font
; (set-default-font "Inconsolata LGC 12")

;;
;; face per buffer
;;
(add-hook 'org-mode-hook (lambda ()
                           (setq buffer-face-mode-face '(:family "Iosevka" :height 170))
                           (buffer-face-mode)))

;; font for latex-mode
(add-hook 'latex-mode-hook (lambda ()
                            (setq buffer-face-mode-face '(:family "Hasklig" :height 160))
                            (buffer-face-mode)))

;; font for text-mode
(add-hook 'text-mode-hook (lambda ()
                            (setq buffer-face-mode-face '(:family "Iosevka" :height 170))
                            (buffer-face-mode)))

;; font for ess-mode
(add-hook 'ess-mode-hook (lambda ()
                           (setq buffer-face-mode-face '(:family "Iosevka" :height 130))
                           (buffer-face-mode)))
(add-hook 'inferior-ess-mode-hook (lambda ()
                            (setq buffer-face-mode-face '(:family "Fira Code" :height 120))
                            (buffer-face-mode)))


;; font for emacs-lisp-mode
(add-hook 'emacs-lisp-mode-hook (lambda ()
                            (setq buffer-face-mode-face '(:family "Inconsolata LGC"))
                            (buffer-face-mode)))

;; font for eshell
(add-hook 'eshell-mode-hook (lambda ()
                              (setq buffer-face-mode-face '(:family "Hasklig" :height 140))
                              (buffer-face-mode)))

;; font for help-mode
(add-hook 'help-mode-hook (lambda ()
                            (setq buffer-face-mode-face '(:family "Hasklig" :height 130))
                            (buffer-face-mode)))

;; font for python-mode
(add-hook 'python-mode-hook (lambda ()
			      (setq buffer-face-mode-face '(:family "Iosevka" :height 150))
			      (buffer-face-mode)))

(add-hook 'inferior-python-mode-hook (lambda ()
				       (setq buffer-face-mode-face '(:family "Hasklig" :height 130))
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

;; font for scala-mode
(add-hook 'scala-mode-hook (lambda ()
                            (setq buffer-face-mode-face '(:family "Hasklig" :height 140))
                            (buffer-face-mode)))

;; font for c++ and c
(add-hook 'c++-mode-hook (lambda ()
                           (setq buffer-face-mode-face '(:family "PragmataPro" :height 150))
                           (buffer-face-mode)))
(add-hook 'c-mode-hook (lambda ()
			 (setq buffer-face-mode-face '(:family "PragmataPro" :height 150))
			 (buffer-face-mode)))

;; SQL mode
(add-hook 'sql-mode-hook (lambda ()
			   (setq buffer-face-mode-face '(:family "Hasklig" :height 160))
			   (buffer-face-mode)))

;; use ligature in emacs
(mac-auto-operator-composition-mode t)

(provide 'init-font)






