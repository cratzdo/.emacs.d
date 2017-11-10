;; all customizations goes here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (moe-dark)))
 '(display-time-mode t)
 '(elpy-rpc-python-command "python3")
 '(ess-swv-plug-into-AUCTeX-p nil)
 '(ess-swv-processor (quote knitr))
 '(ess-swv-prossor (quote knitr))
 '(exec-path-from-shell-arguments (quote ("-l" "-i")))
 '(fci-rule-color "#073642")
 '(fill-column 70)
 '(fringe-mode 15 nil (fringe))
 '(global-hl-line-mode t)
 '(inhibit-startup-screen t)
 '(ns-tool-bar-display-mode (quote both) t)
 '(ns-tool-bar-size-mode nil t)
 '(package-selected-packages
   (quote
    (company-c-headers sr-speedbar ggtags helm-gtags hlem-gtags helm-projectile helm-bibtex helm-bibtexkey helm-bind-key helm-company helm-flycheck helm-flyspell setup-helm paredit paredit-menu beacon dirtree color-theme-solarized color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized ensime powerline moe-theme aggressive-fill-paragraph prettify-symbols-mode expand-region jedi epc projectile auto-org-md markdown-mode eink-theme eink browse-kill-ring pip-requirements synonyms rtags cmake-ide magit iedit ivy ivy-bibtex ivy-gitlab elpy flyspell-correct-helm writeroom-mode use-package smartscan smartparens smart-cursor-color pretty-mode peep-dired osx-dictionary org-bullets matlab-mode langtool helm google-this ess company-auctex auto-save-buffers-enhanced auto-compile)))
 '(python-shell-interpreter "ipython3")
 '(python-shell-virtualenv-root "'~/Python/py3virtualenv/'")
 '(sentence-end-double-space nil)
 '(show-paren-mode t)
 '(synonyms-file "/Users/Frank/.emacs.d/lisp/mthesaur.txt")
 '(tool-bar-mode nil)
 '(visual-fill-column-center-text t)
 '(visual-fill-column-width 120)
 '(visual-line-mode nil t)
 '(writeroom-width 120))

;; customize faces
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "PragmataPro Mono" :foundry "nil" :slant normal :weight normal :height 130 :width normal))))
 '(font-latex-sectioning-2-face ((t (:foreground "sienna" :weight bold :height 1.2 :family "Arima Madurai"))))
 '(font-latex-sectioning-3-face ((t (:inherit font-latex-sectioning-4-face :height 1.05))))
 '(font-latex-sectioning-4-face ((t (:inherit font-latex-sectioning-5-face :height 1.05))))
 '(fringe ((t (:background "nil" :foreground "#a8a8a8"))))
 '(linum ((t (:inherit nil :background "#4e4e4e" :foreground "#b2b2b2" :height 0.85))))
 '(minibuffer-prompt ((t (:background "#a1db00" :foreground "#4e4e4e" :height 120 :family "Inconsolata"))))
 '(mode-line ((t (:background "#5faf87" :foreground "#ffffff" :box nil :weight normal :family "Hasklig" :height 115)))))
