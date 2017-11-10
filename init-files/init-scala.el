;;---------------------------------
;; Scala set up
;;--------------------------------
;; Use ENSIME 

(use-package ensime
  :ensure t
  :init)

;; sbt-mode
(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

(use-package scala-mode
  :pin melpa)

;; add path 
(add-to-list 'exec-path "/usr/local/bin")
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(provide 'init-scala)

