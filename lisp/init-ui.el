;;
;;;; UI Tweaking
;;
(menu-bar-mode +1) ;keep  menu-bar
(global-set-key [f9] 'toggle-menu-bar-mode-from-frame)
(scroll-bar-mode 0) ;remove scroll bar
(fringe-mode '(15 . 15))
(tool-bar-mode 0) ; disable toolbar
;(tabbar-mode -1) ; disable tabbar-mode
(global-hl-line-mode 1) ;highlight the current line
(linum-mode 0) ;disable linum-mode
(display-time-mode 1);display time on the mode line
(blink-cursor-mode 0) ; disable blinking cursor
;;

;;
;; default font
;;
(add-to-list 'default-frame-alist '(font . "Input Mono-13"))

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

(provide 'init-ui)
