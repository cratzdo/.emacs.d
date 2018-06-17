
;;----------------------------------------------------------------------------
;; Temporarily reduce garbage collection during startup
;;----------------------------------------------------------------------------


;;
;; Color theme
;;
;;(require-package 'eink-theme)
;;(require-package 'color-theme-sanityinc-solarized)
;;(require-package 'color-theme-sanityinc-tomorrow)
(require-package 'powerline)
;; (require-package 'moe-theme)
(require-package 'doom-themes)

;; If you don't customize it, this is the theme you get.
;; (setq-default custom-enabled-themes '(moe-dark))

;; Ensure that themes will be applied even if they have not been customized
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote , custom-enabled-themes))))

(add-hook 'after-init-hook 'reapply-themes)

;;===========================
;; doom-themes
;;===========================
(require 'powerline)
(powerline-center-theme)
(require 'doom-themes)
(setq-default custom-enabled-themes '(doom-one))

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
(load-theme 'doom-one t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme
(doom-themes-neotree-config)  ; all-the-icons fonts must be installed!

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)


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

(defun doom-one ()
  (interactive)
  (doom-one))

;;--------------------------
;; spacemacs like mode-line
;;--------------------------
(use-package spaceline
  :demand t
  :init
  (setq powerline-default-separator 'arrow-fade)
  :config
  (require 'spaceline-config)
  (spaceline-spacemacs-theme)  )


;; setup moe-theme

;; (require 'moe-theme)
;; (powerline-moe-theme)
;;  (setq moe-theme-highlight-buffer-id t)
;;  (moe-theme-set-color 'cyan)
;;  (moe-dark)

(provide 'init-theme)
