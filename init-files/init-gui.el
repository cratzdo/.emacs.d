;;
;;;; GUI Tweaking
;;
(menu-bar-mode +1) ;keep  menu-bar
(global-set-key [f9] 'toggle-menu-bar-mode-from-frame)
(scroll-bar-mode 0) ;remove scroll bar
(fringe-mode '(20 . 0))
(set-face-attribute 'fringe nil :background nil)
(tool-bar-mode 0) ; disable toolbar
; (tabbar-mode -1) ; disable tabbar-mode
(global-hl-line-mode 1) ;highlight the current line
(linum-mode 0) ;disable linum-mode
(display-time-mode 1) ;display time on the mode line
(display-battery-mode 1) ; display battery information on the mode line
(blink-cursor-mode 0) ; disable blinking cursor
(setq inhibit-startup-echo-area-message t)

;;
;; default font
;;
;; (add-to-list 'default-frame-alist '(font . "Input Mono-13"))

;;;; cursor color
					;(setq-default cursor-type '(bar . 5))
(setq-default cursor-type 'box)

;;change cursor color dynamically
(use-package smart-cursor-color
  :ensure t
  :init)
(smart-cursor-color-mode +1)

;; initial frame size
(setq initial-frame-alist
      '((top . 110) (left . 350) (width . 100) (height . 35)))

;; customize fringe
;; text-mode
(add-hook 'text-mode-hook
          (lambda ()
            (set-window-fringes nil 350 100)))
;; tex-mode
;; (add-hook 'latex-mode-hook
;;           (lambda ()
;;             (set-window-fringes nil 350 100)))

 (add-hook 'LaTeX-mode-hook
           (lambda ()
             (set-window-fringes nil 350 100)))

(defun wide-fringes ()
  (set-window-fringes (selected-window) 350 100))

(add-hook 'latex-mode-hook 'wide-fringes)

(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)

;; show init time
(emacs-init-time)

(provide 'init-gui)
