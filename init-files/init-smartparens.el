;;
;; Smartparens mode
;;
(use-package smartparens
  :ensure t
  :config
  (progn
    (require 'smartparens-config)
    (add-hook 'emacs-lisp-mode-hook #'smartparens-mode)
    (add-hook 'emacs-lisp-mode-hook 'show-smartparens-mode)
    (add-hook 'c++-mode-hook #'smartparens-mode)
    (add-hook 'latex-mode-hook #'smartparens-mode)
    (add-hook 'ess-mode-hook #'smartparens-mode)
    (add-hook 'python-mode-hook #'smartparens-mode)
    (add-hook 'scala-mode-hook #'smartparens-mode)
    (add-hook 'text-mode-hook #'smartparens-mode)))

;; add more pairs
(sp-local-pair 'c++-mode "<" ">" :wrap "C-<")
(sp-local-pair 'c-mode "<" ">" :wrap "C-<")
(sp-local-pair 'LaTeX-mode "$" "$" :wrap "C-$")
(sp-pair "$" "$" :wrap "C-$")


;; pair management
    (sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)
    (sp-local-pair 'web-mode "<" nil :when '(my/sp-web-mode-is-code-context))

;;; markdown-mode
    (sp-with-modes '(markdown-mode gfm-mode rst-mode)
      (sp-local-pair "*" "*" :bind "C-*")
      (sp-local-tag "2" "**" "**")
      (sp-local-tag "s" "```scheme" "```")
      (sp-local-tag "<"  "<_>" "</_>" :transform 'sp-match-sgml-tags))

;; wrap-region
(use-package wrap-region
  :ensure t
  :init)

(wrap-region-add-wrapper "$" "$" nil '(latex-mode org-mode))
(wrap-region-add-wrapper "{-" "-}" "#")
(wrap-region-add-wrapper "/" "/" nil 'ruby-mode)
(wrap-region-add-wrapper "/* " " */" "#" '(java-mode javascript-mode css-mode c++-mode sas-mode))
(wrap-region-add-wrapper "`" "`" nil '(markdown-mode ruby-mode))

(provide 'init-smartparens)
