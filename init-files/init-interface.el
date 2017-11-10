;;UI Tweaking

(use-package smart-cursor-color
  :config
  :init)

(menu-bar-mode t) ;keep  menu bar
(scroll-bar-mode -1) ;remove scroll bar
(tool-bar-mode -1) ; disable toolbar
;(fringe-mode '(200 . 200))
;(tabbar-mode 0) ; disable tabbar-mode
(global-hl-line-mode t) ;highlight the current line
(linum-mode -1) ;disable linum-mode
(display-time-mode t);display time on the mode line
;---------------------cursor color-------------------
;(setq-default cursor-type 'bar)
(setq-default cursor-type 'box)
;;change cursor color dynamically
(require 'smart-cursor-color)
(smart-cursor-color-mode +1)

(set-face-attribute 'fringe nil :background nil)


;; cursor
(use-package beacon
  :ensure t
  :init)
(beacon-mode 1)
(setq beacon-push-mark 35)
(setq beacon-color "#666600")

(provide 'init-interface)
