
;;----------------------------------------------------------------------------
;; Temporarily reduce garbage collection during startup
;;----------------------------------------------------------------------------

(defconst sanityinc/initial-gc-cons-threshold gc-cons-threshold
  "Initial value of `gc-cons-threshold' at start-up time.")
(setq gc-cons-threshold (* 128 1024 1024))
(add-hook 'after-init-hook
          (lambda () (setq gc-cons-threshold sanityinc/initial-gc-cons-threshold)))

;;
;; Color theme
;;
(require-package 'eink-theme)
(require-package 'color-theme-sanityinc-solarized)
(require-package 'color-theme-sanityinc-tomorrow)
(require-package 'powerline)
(require-package 'moe-theme)
;; If you don't customize it, this is the theme you get.
(setq-default custom-enabled-themes '(moe-dark))

;; Ensure that themes will be applied even if they have not been customized
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote , custom-enabled-themes))))

(add-hook 'after-init-hook 'reapply-themes)


;;------------------------------------------------------------------------------
;; Toggle between light and dark
;;------------------------------------------------------------------------------

(defun light ()
  "Activate a light color theme."
  (interactive)
  (color-theme-sanityinc-solarized-light))

(defun dark ()
  "Activate a dark color theme."
  (interactive)
  (color-theme-sanityinc-solarized-dark))

(defun tomorrow ()
  "Activate a dark color theme."
  (interactive)
  (color-theme-sanityinc-tomorrow-night))

(defun moe ()
  "Activate a dark color theme."
  (interactive)
  (moe-dark))

(setq gc-cons-threshold sanityinc/initial-gc-cons-threshold)

;; setup moe-theme
(require 'powerline)
(require 'moe-theme)
(powerline-moe-theme)
 (setq moe-theme-highlight-buffer-id t)
 (moe-theme-set-color 'cyan)
 (moe-dark)

(provide 'init-theme)
