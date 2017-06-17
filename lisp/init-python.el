;; python setup
(use-package elpy
  :ensure t
  :config
  :init)

;; install iedit
(use-package iedit
  :ensure t
  :config
  :init)

(elpy-enable)

;; Fixing a key binding bug in elpy
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)

;; Fixing another key binding bug in iedit mode
(define-key global-map (kbd "C-c o") 'iedit-mode)

;; epy
;; Trick to get the filename of the installation directory
(defconst epy-install-dir
  (file-name-directory (or load-file-name
                           (when (boundp 'bytecomp-filename) bytecomp-filename)
                           buffer-file-name))
  "Installation directory of emacs-for-python"
)

(add-to-list 'load-path epy-install-dir)
(require 'epy-setup)
(require 'epy-python)
(require 'epy-completion)
(require 'epy-editing)
(require 'epy-nose)
(require 'epy-bindings)

;; major mode for editing pip requirements files
(use-package pip-requirements
  :config
  :ensure t
  :init)

(provide 'init-python)
