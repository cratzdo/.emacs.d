(use-package ess
  :config
  :init)


(add-hook 'ess-mode-hook
          (lambda ()
            (local-set-key (kbd "RET") 'newline)))
;underscore
(setq ess-smart-S-assign-key ":")
;(ess-toggle-S-assign nil)
(add-hook 'ess-mode-hook
      (lambda ()
(ess-toggle-S-assign nil)
(ess-toggle-underscore nil) ; leave underscore key alone!
))
;Comment-uncomment a selected region with C-d or C-maj-d

(defun uncomment-region (beg end)
  "Like `comment-region' invoked with a C-u prefix arg."
  (interactive "r")
  (comment-region beg end -1))

(add-hook 'ess-mode-hook
      (lambda ()
(define-key ess-mode-map (kbd "C-:") 'comment-region)
(define-key ess-mode-map (kbd "C-:") 'uncomment-region)
))

(provide 'init-ess)
