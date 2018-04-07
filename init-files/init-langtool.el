;;----------------------------------------------------
;;-----------grammar-checking-----------------------
;;----------------------------------------------------
(use-package langtool
  :config
  :init)
(require 'langtool)

(if (file-exists-p "~/.emacs.d/LanguageTool-4.1/")
    (setq langtool-language-tool-jar "~/.emacs.d/LanguageTool-4.1/languagetool-commandline.jar")) 
(setq langtool-default-language "en-US")

(global-set-key "\C-x4w" 'langtool-check)
(global-set-key "\C-x4W" 'langtool-check-done)
(global-set-key "\C-x4l" 'langtool-switch-default-language)
(global-set-key "\C-x44" 'langtool-show-message-at-point)
(global-set-key "\C-x4c" 'langtool-correct-buffer)

(provide 'init-langtool)
