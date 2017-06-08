;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

(let ((minver "24.1"))
  (when (version<= emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version<= emacs-version "24.4")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking) ;; Measure startup time

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

;;----------------------------------------------------------------------------
;; Temporarily reduce garbage collection during startup
;;----------------------------------------------------------------------------
(defconst sanityinc/initial-gc-cons-threshold gc-cons-threshold
  "Initial value of `gc-cons-threshold' at start-up time.")
(setq gc-cons-threshold (* 128 1024 1024))
(add-hook 'after-init-hook
          (lambda () (setq gc-cons-threshold sanityinc/initial-gc-cons-threshold)))

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(require 'init-compat)
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
;; Calls (package-initialize)
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-exec-path) ;; Set up $PATH



;;
;; use-package
;;
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/lisp/emacs-for-python-master")
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

;;
;; option key is meta
;;
(setq mac-option-modifier 'meta) ; set alt-key to meta
(setq mac-escape-modifier nil) ; set esc-key to nil

;;
;; ido-mode
;;
(ido-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer 'always)

;;
;; writeroom mode
;;
(use-package writeroom-mode
  :ensure t
  :config (setq writeroom-width  100)
  :init)
(global-writeroom-mode 0)
(global-set-key (kbd "<f6>") 'writeroom-mode)
;----------------------------------------------------

;; tex-mode
(require 'init-tex)

;;
;; Color theme
;;
(require-package 'color-theme-sanityinc-solarized)
(require-package 'color-theme-sanityinc-tomorrow)

;; If you don't customize it, this is the theme you get.
(setq-default custom-enabled-themes '(sanityinc-solarized-dark))

;; Ensure that themes will be applied even if they have not been customized
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

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


;; matlab-mode
(require 'init-matlab)


;;
;; auto-save-buffers-----------------------------
;;
;;Require installation of auto-save-buffers-enhanced
(use-package auto-save-buffers-enhanced
  :config
  :init)
(require 'auto-save-buffers-enhanced)
(auto-save-buffers-enhanced t)

;;automatically revert when a file has been editted in a external program
(global-auto-revert-mode 1)
;---------------------------------------------------------------------

;; customize interface looking
(require 'init-interface)

;; mode line

 ;; (use-package smart-mode-line
 ;;   :ensure t
 ;;   :init
 ;;   (setq sml/theme 'respectful)
 ;;   (sml/setup))

;------------------------------------------------------------------

;;-------------------helm----------------------
;;helm
(use-package helm
  :config
  :init)
(require 'helm-config)
(setq helm-everywhere t)
;---------------------------------------------

;-----------------GOOGLE---------------------
;google this
(use-package google-this
  :config
  :init)
(google-this-mode 1)
;------------------------------------------

;;-----------------org-mode-------------------------
(require 'init-org)

;;--------------------markdown mode-------------------------------------
;;auto load markdown mode
(autoload 'markdown-mode "markdown-mode.el" 
	"Major mode for editing Markdown files" t) 
	(setq auto-mode-alist 
		(cons '("\\.md" . markdown-mode) auto-mode-alist)
		)
;------------------end of markdown-mode---------------------------------

;;--------------------dictionary----------------------------
;dictionary
;; press F8 on keypad to lookup definition
(use-package osx-dictionary
  :config
  :init)
(global-set-key (kbd "<f8>") 'osx-dictionary-search-word-at-point)
;--------------------end of dictionary mode----------------

;;ESS-mode
(require 'init-ess)

;; langtools for grammar checking
(require 'init-langtool)

;;
;;; Smartscan
;;
(use-package smartscan
  :defer t
  :config (global-smartscan-mode t))
;;
;; Dired
;;
(require 'find-dired)
(setq find-ls-option '("-print0 | xargs -0 ls -ld" . "-ld"))
;peep-dired, Allow my use of C-x C-q while in peep-dired mode.
(use-package peep-dired
  :bind (:map peep-dired-mode-map 
         ("SPC" . nil)
         ("<backspace>" . nil)))

;;
;; Smartparens mode
;;
(use-package smartparens
  :config
  (progn
    (require 'smartparens-config)
    (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
    (add-hook 'emacs-lisp-mode-hook 'show-smartparens-mode)))


;;;;;;;;;;;;;;;;;;
    ;; pair management

    (sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)
    (sp-local-pair 'web-mode "<" nil :when '(my/sp-web-mode-is-code-context))

;;; markdown-mode
    (sp-with-modes '(markdown-mode gfm-mode rst-mode)
      (sp-local-pair "*" "*" :bind "C-*")
      (sp-local-tag "2" "**" "**")
      (sp-local-tag "s" "```scheme" "```")
      (sp-local-tag "<"  "<_>" "</_>" :transform 'sp-match-sgml-tags))

;;; tex-mode latex-mode
    (sp-with-modes '(tex-mode plain-tex-mode latex-mode)
		   (sp-local-tag "i" "1d5f8e69396c521f645375107197ea4dfbc7b792quot;<" "1d5f8e69396c521f645375107197ea4dfbc7b792quot;>"))

;;--------------------------------
;; show recent files with <f7>
;;-------------------------------
(require 'init-recentf)


;;
;; fill and unfill by `M+q'
;;
(defun endless/fill-or-unfill ()
  "Like `fill-paragraph', but unfill if used twice."
  (interactive)
  (let ((fill-column
         (if (eq last-command 'endless/fill-or-unfill)
             (progn (setq this-command nil)
                    (point-max))
           fill-column)))
    (call-interactively #'fill-paragraph)))

(global-set-key [remap fill-paragraph]
                #'endless/fill-or-unfill)



;; auto-fill mode
(require 'init-auto-fill)


;; pretty-mode
;; font ligatures
(require 'init-pretty)


;;
;; answer yes or no
;;
(fset 'yes-or-no-p 'y-or-n-p)


;;
;; electric parens
(require 'init-parens)

;; different fonts for different modes
(require 'init-font)

;; sql mode
(require 'init-sql)

;; python model
;; emacs for python
(require 'epy-init)

;; key-bindings
(require 'init-key)

;;--------------------------------------------------------
;; automatically copy text selected with the mouse
;;---------------------------------------------------------
(setq mouse-drag-copy-region t)


;;---------------------
;; spelling
;;--------------------
(require 'init-flyspell)
(require 'init-spelling)

;; UI tweaking
(require 'init-ui)
