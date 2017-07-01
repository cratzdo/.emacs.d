;; python setup

;; elpy
(use-package elpy
  :ensure t
  :config
  :init)
(elpy-enable)

;;jedi
(use-package jedi
  :ensure t
  :init)

(add-to-list 'ac-sources 'ac-source-jedi-direct)
;; enable for python-mode
(add-hook 'python-mode-hook 'jedi:setup)

;; (defvar jedi-config:with-virtualenv nil
;;   "Set to non-nil to point to a particular virtual environment ")

;; ;; Variable help to find the project root
;; (defvar jedi-config:vcs-root-sentinel ".git")
;; (defvar jedi-config:python-module-sentinel "__init__.py")

;; ;; Functions used to find project root for a given buffer)
;; (defun get-project-root (buf repo-type init-file)
;;   (vc-find-root (expand-file-name (buffer-file-name buf)) repo-type))

;; (defvar jedi-config:find-root-function 'get-project-root)

;; ;; And call this on initialization
;; (defun current-buffer-project-root ()
;;   (funcall jedi-config:find-root-function
;; 	   (current-buffer)
;; 	   jedi-config:vcs-root-sentinel
;; 	   jedi-config:python-module-sentinel))

;; ;; jedi-server-args
;; (defun jedi-config:setup-server-args ()
;;   ;; little helper macro
;;   (defmacro add-args (arg-list arg-name arg-value)
;;     '(setq ,arg-list (append ,arg-list (list ,arg-name ,arg-value))))

;;   (let ((project-root (current-buffer-project-root )))
    
;;     ;; variable for this buffer only
;;   (make-local-variable 'jedi:server-args)
  
;;   ;; set your variables
;;   (when project-root
;;     (add-args jedi:server-args "--sys-path" project-root))
;;   (when jedi-config:with-virtualenv
;;     (add-args jedi:server-args "--virtual-env" jedi-config:with-virtualenv))))
    
;; ;; set python path for mac
;; (defvar jedi-config:use-system-python t)

;; (defun jedi-config:set-python-executable ()
;;   (set-exec-path-from-shell-path) ;; for OS X
;;   (make-local-variable 'jedi:server-command)
;;   (set 'jedi:server-command
;;        (list (executable-find "python3")
;; 	     (cadr default-jedi-server-command))))

;; (add-hook 'python-mode-hook
;; 	  'jedi-config:setup-server-args)

;; (when jedi-config:use-system-python
;;   (add-hook 'python-mode-hook
;; 	    'jedi-config:set-python-executable))
  
;; modify jedi default key-combos
(defun jedi-config:setup-keys ()
  (local-set-key (kbd "M-.") 'jedi:goto-definition)
  (local-set-key (kbd "M-,") 'jedi:goto-definition-pop-marker)
  (local-set-key (kbd "M-?") 'jedi:show-doc)
  (local-set-key (kbd "M-/") 'jedi:get-in-function-call) )

(add-hook 'python-mode-hook 'jedi-config:setup-keys)

;; never show in-function call automatically
(setq jedi:get-in-function-call-delay 100000000000)
(setq jedi:complete-on-dot t)

;; install iedit
(use-package iedit
  :ensure t
  :config
  :init)

;; Fixing a key binding bug in elpy
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)

;; Fixing another key binding bug in iedit mode
(define-key global-map (kbd "C-c o") 'iedit-mode)

;; major mode for editing pip requirements files
(use-package pip-requirements
  :config
  :ensure t
  :init)

;; epc
(use-package epc
  :ensure t
  :init)

(provide 'init-python)
