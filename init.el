;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

(let ((minver "24.1"))
  (when (version<= emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version<= emacs-version "24.4")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

;(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;(require 'init-benchmarking) ;; Measure startup time

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))


(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------

(add-to-list 'load-path "~/.emacs.d/init-files")
(add-to-list 'load-path "~/.emacs.d/init-files/emacs-for-python-master")


(require 'init-compat)
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el

;; Calls (package-initialize)
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-exec-path) ;; Set up $PATH

;;-------------------------------------------------
;; use-package
;;-------------------------------------------------

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-verbose t)
(setq use-package-always-ensure t)
(require 'use-package)
(use-package auto-compile
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)

;;-------------------------------------------------
;; customization in a separate file
;;-------------------------------------------------
 (setq custom-file "~/.emacs.d/emacs-custom.el")
     (load custom-file)

;; load mac key-bindings
(require 'init-smartparens)
(require 'init-key)

;; ido
;;(require 'init-ido)

;; ivy
;;(require 'init-ivy)

;; themes
(require 'init-theme)

;; writeroom-mode for a distraction free environment
(require 'init-writeroom)

;; tex-mode
(require 'init-tex)

;; matlab-mode
;;(require 'init-matlab)

;; auto-save buffer
(require 'init-autosave)

;; customize interface looking
;;(require 'init-frame-gui)

;; mode-line
(require 'init-modeline)

;; helm
(require 'init-helm) 

;;org-mode
(require 'init-org)

;; markdown
(require 'init-markdown)

;; dictionary
(require 'init-dictionary)

;;ESS-mode
(require 'init-ess)

;; langtools for grammar checking
;;(require 'init-langtool) 

;; smart-scan
;;(require 'init-smartscan)

;; dired
(require 'init-dired)

;; smart-parens
(require 'init-smartparens)

;; electric parens
;;(require 'init-parens)

;;--------------------------------
;; show recent files with <f7>
;;-------------------------------
(require 'init-recentf)

;; auto-fill mode
(require 'init-auto-fill)

;; different fonts for different modes
(require 'init-font)

;; pretty-mode
;; font ligatures
(require 'init-pretty)

;; sql mode
(require 'init-sql)

;; key-bindings
(require 'init-key)

;;---------------------
;; spelling
;;--------------------
(require 'init-flyspell)
(require 'init-spelling)

;; UI tweaking
(require 'init-gui)

;;---------------------------------
;; Python
;;----------------------------------
(require 'init-python)

;; magit
(require 'init-magit)

;; cpp
(require 'init-cpp)

;; projectile
;;(require 'init-projectile)

;; auto-complete
(require 'init-autocomplete)

;; fix rubbish codes in shell-mode
(require 'init-shell)

;; expand region with "C-="
(require 'init-expandregion)

;; beautify eshell
(require 'init-eshell)

;; emacs-lisp
(require 'init-lisp)

;; scala & ensime
;;(require 'init-scala) 

;; c++
(require 'init-c++)

;; email
(require 'init-email)

;; pdf
;; (require 'init-pdf)

;; find file at project
(require 'init-findfile)

;; smex to handle M-x
(require 'init-smex)

;; fast move windows
;;(require 'init-windows)

;; Then reset it as late as possible; these are the reasonable defaults I use.
(add-hook 'emacs-startup-hook
	  (setq gc-cons-threshold 16777216
		gc-cons-percentage 0.1))

;;----------------------------------
(provide 'init)
