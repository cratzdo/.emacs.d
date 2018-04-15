;; python setup
(setq python-python-command "usr/local/bin/python3")
(setq python-shell-interpreter 'python3)

;; elpy
(use-package elpy
  :ensure t
  :config
  :init)
(elpy-enable)

;; use ipython
(setq python-shell-interpreter "ipython3"
      python-shell-interpreter-args "--simple-prompt --pprint")
(elpy-enable)
(elpy-use-ipython)
; use IPython
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")

(let ((pyvenv-workon-starts-python nil))
  (pyvenv-workon "~/Python/ve/bin/"))


;; use anaconda-mode for code navigation, documentation lookup
(use-package anaconda-mode
  :ensure t
  :init)
(add-hook 'python-mode-hook 'anaconda-mode)

;; company-mode for anaconda
(use-package company-anaconda
  :ensure t
  :init)
(require 'company-anaconda)

;; install iedit
(use-package iedit
  :ensure t
  :init)

;; Fixing a key binding bug in elpy
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
;; Fixing another key binding bug in iedit mode
(define-key global-map (kbd "C-c o") 'iedit-mode)

;;jedi
(use-package jedi
  :ensure t
  :init)

(add-to-list 'ac-sources 'ac-source-jedi-direct)
;; enable for python-mode
(add-hook 'python-mode-hook 'jedi:setup)
 
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


;; major mode for editing pip requirements files
(use-package pip-requirements
  :config
  :ensure t
  :init)

;; epc
(use-package epc
  :ensure t
  :init)

;;
;; solve ipython does not show output
;;
(defun python-shell-append-to-output (string)
  (let ((buffer (current-buffer)))
    (set-buffer (process-buffer (python-shell-get-process)))
    (let ((oldpoint (point)))
      (goto-char (process-mark (python-shell-get-process)))
      (insert string)
      (set-marker (process-mark (python-shell-get-process)) (point))
      (goto-char oldpoint))
    (set-buffer buffer)))

(defadvice python-shell-send-string
    (around advice-python-shell-send-string activate)
  (interactive)
  (let* ((append-string1
         (if (string-match "import codecs, os;__pyfile = codecs.open.*$" string)
             (replace-match "" nil nil string)
           string))
        (append-string2
         (if (string-match "^# -\\*- coding: utf-8 -\\*-\n*$" append-string1)
             (replace-match "" nil nil append-string1)
           append-string1))
        (append-string
         (if (string-match "^\n*$" append-string2)
             (replace-match "" nil nil append-string2)
           append-string2)))  
    (python-shell-append-to-output
     (concat (string-trim-right append-string) "\n")))
  (if (called-interactively-p 'any)
      (call-interactively (ad-get-orig-definition 'python-shell-send-string))
    ad-do-it))

;; ein (emacs IPython Notebook)
(use-package ein
  :ensure t
  :init)

(require 'ein)
(require 'ein-loaddefs)
(require 'ein-notebook)
(require 'ein-subpackages)


(provide 'init-python)
