;; auto-fill-mode = wrap word
;; turn on auto-fill-mode for tex- mode

 (add-hook 'text-mode-hook 'turn-on-auto-fill)

;; ESS mode
(add-hook 'ESS-hook 'turn-on-auto-fill)

;; global visual-line-mode
(global-visual-line-mode 1)

(provide 'init-auto-fill)
