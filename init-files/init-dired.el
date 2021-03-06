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

(provide 'init-dired)
