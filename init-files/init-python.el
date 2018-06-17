;; python setup
(after-load 'projectile
  (setq-default
   projectile-mode-line
   '(:eval
     (if (file-remote-p default-directory)
	 " Pr"
       (format " Pr[%s]" (projectile-project-name))))))

;; elpy
(use-package elpy
  :ensure t
  :config
  :init)
(elpy-enable)
(pyenv-mode 1)

;; enable autopep8 formatting on save
(use-package py-autopep8
  :ensure t
  :init)
;; (require 'py-autopep8)
;; (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; Interactive Python through ipython 
;; (setq python-shell-interpreter "ipython"
;;       python-shell-interpreter-args "-i --simple-prompt") 

;; Interactive Python through jupyter
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil) 
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter") 


(let ((pyvenv-workon-starts-python nil))
  (pyvenv-workon "~/Python/ve/bin/"))


;;=============================================
;;jedi for code completion and auto-complete
;;============================================
(use-package jedi
  :ensure t
  :init)
(defun company-jedi-setup ()
  (add-to-list 'company-backends 'company-jedi))
(add-hook 'python-mode-hook 'company-jedi-setup)

(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)
(add-hook 'python-mode-hook 'jedi:setup)

;; major mode for editing pip requirements files
(use-package pip-requirements
  :config
  :ensure t
  :init)

;;=========================================
;; ein (emacs IPython Notebook)
;;=========================================
(use-package ein
  :ensure t
  :init)

(require 'ein)
(require 'ein-loaddefs)
(require 'ein-notebook)
(require 'ein-subpackages)
(setq ein:use-auto-complete-superpack t)

;; mumamo
;; (load "nxhtml/autostart.el")
;; (use-package ein-mumamo
;;   :ensure t
;;   :init)
;; (setq ein:notebook-modes '(ein:notebook-mumamo-mode ein:notebook-plain-mode))

;; smart repeat
;; (use-package smartrep
;;   :ensure t
;;   :init)
;; (setq ein:use-smartrep t)

(setq python-shell-completion-native-enable nil)

;;=====================================
;; show indent line
;;=====================================
(use-package indent-guide
  :ensure t
  :init)
(indent-guide-global-mode)

(provide 'init-python)

