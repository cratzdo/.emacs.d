(deftheme Moe-edit
  "Created 2017-07-31.")

(custom-theme-set-variables
 'Moe-edit
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector ["#839496" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(custom-safe-themes (quote ("4cbec5d41c8ca9742e7c31cc13d8d4d5a18bd3a0961c18eb56d69972bbcf3071" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(fill-column 100)
 '(inhibit-startup-screen t)
 '(magit-git-executable "/usr/local/bin/git")
 '(package-selected-packages (quote (moe-theme powerline helm-bibtex aggressive-fill-paragraph markdown-mode markdown-mode+ markdown-preview-eww smart-mode-line-powerline-theme smart-mode-line magit-gitflow magic-latex-buffer magithub magit exec-path-from-shell ivy-bibtex ivy-gitlab elpy jedi smartrep ein ein-mumamo flycheck-color-mode-line flycheck flyspell-correct-helm writeroom-mode use-package smartscan smartparens smart-cursor-color pretty-mode peep-dired osx-dictionary org-bullets matlab-mode langtool helm google-this ess company-auctex color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized auto-save-buffers-enhanced auto-compile)))
 '(powerline-default-separator (quote curve))
 '(pyvenv-workon nil)
 '(visual-fill-column-center-text t)
 '(visual-fill-column-width 100)
 '(writeroom-width 110)
 '(display-time-mode t)
 '(global-pretty-mode nil)
 '(global-smartscan-mode t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(custom-theme-set-faces
 'Moe-edit
 '(default ((t (:family "SF Mono" :foundry "nil" :slant normal :weight normal :height 120 :width normal))))
 '(font-latex-sectioning-2-face ((t (:foreground "sienna2" :weight bold :height 1.1 :family "Arima Madurai"))))
 '(font-latex-sectioning-3-face ((t (:foreground "DarkGoldenrod3" :weight ultra-bold :height 1.1 :family "Arima Madurai"))))
 '(font-latex-sectioning-4-face ((t (:inherit font-latex-sectioning-5-face :height 1.1 :family "Apercu"))))
 '(font-latex-sectioning-5-face ((t (:foreground "yellow" :weight bold :family "Apercu"))))
 '(fringe ((t (:background "nil" :foreground "nil"))))
 '(minibuffer-prompt ((t (:foreground "#268bd2" :family "Inconsolata"))))
 '(mode-line ((t (:background "#eee8d5" :box (:line-width 1 :color "#657b83") :weight normal :height 100 :family "Roboto Mono for Powerline")))))

(provide-theme 'Moe-edit)
