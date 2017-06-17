;; auto-fill-mode = wrap word
;; turn on auto-fill-mode for tex- mode

 (add-hook 'text-mode-hook 'turn-on-auto-fill)

;; ESS mode
(add-hook 'ESS-hook 'turn-on-auto-fill)

;; global visual-line-mode
(global-visual-line-mode 1)


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

(provide 'init-auto-fill)
