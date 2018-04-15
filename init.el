;; -*- coding: utf-8 -*-
;;(defvar best-gc-cons-threshold gc-cons-threshold "Best default gc threshold value. Should't be too big.")


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(let ((minver "24.3"))
  (when (version< emacs-version minver)
    (error "This config requires Emacs v%s or higher" minver)))

(defvar best-gc-cons-threshold 4000000 "Best default gc threshold value. Should't be too big.")
;; don't GC during startup to save time
(setq gc-cons-threshold most-positive-fixnum)

(setq emacs-load-start-time (current-time))

;; {{ emergency security fix
;; https://bugs.debian.org/766397
(eval-after-load "enriched"
  '(defun enriched-decode-display-prop (start end &optional param)
     (list start end)))
;; }}
;;----------------------------------------------------------------------------
;; Which functionality to enable (use t or nil for true and false)
;;----------------------------------------------------------------------------
(setq *is-a-mac* (eq system-type 'darwin))
(setq *win64* (eq system-type 'windows-nt) )
(setq *cygwin* (eq system-type 'cygwin) )
(setq *linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux)) )
(setq *unix* (or *linux* (eq system-type 'usg-unix-v) (eq system-type 'berkeley-unix)) )
(setq *emacs24* (and (not (featurep 'xemacs)) (or (>= emacs-major-version 24))) )
(setq *emacs25* (and (not (featurep 'xemacs)) (or (>= emacs-major-version 25))) )
(setq *no-memory* (cond
                   (*is-a-mac*
                    (< (string-to-number (nth 1 (split-string (shell-command-to-string "sysctl hw.physmem")))) 4000000000))
                   (*linux* nil)
                   (t nil)))

;; emacs 24.3-
(setq *emacs24old*  (or (and (= emacs-major-version 24) (= emacs-minor-version 3))
                        (not *emacs24*)))

;; @see https://www.reddit.com/r/emacs/comments/55ork0/is_emacs_251_noticeably_slower_than_245_on_windows/
;; Emacs 25 does gc too frequently
(when *emacs25*
  ;; (setq garbage-collection-messages t) ; for debug
  (setq gc-cons-threshold (* 64 1024 1024) )
  (setq gc-cons-percentage 0.5)
  (run-with-idle-timer 5 t #'garbage-collect))

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------

(add-to-list 'load-path "~/.emacs.d/init-files")
(add-to-list 'load-path "~/.emacs.d/init-files/emacs-for-python-master")


;;(require 'init-compat)
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
(require 'init-ivy)


;; themes
(require 'init-theme)


;; writeroom-mode for a distraction free environment
(require 'init-writeroom)


;; tex-mode
(require 'init-tex)


;; auto-save buffer
(require 'init-autosave)


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
;;(require 'init-pretty)

;; sql mode
;;(require 'init-sql)

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
;;(require 'init-shell)

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


;; find file at project
;;(require 'init-findfile)

;; smex to handle M-x
(require 'init-smex)


;; fast switch windows
(require 'init-acewindow)


;;----------------------------------------------
;; require linum-mode in python and c
;;---------------------------------------------
(require 'init-linum-mode)


;; Then reset it as late as possible; these are the reasonable defaults I use.
(setq gc-cons-threshold best-gc-cons-threshold)


;;----------------------------------
(provide 'init)
