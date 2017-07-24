;;
;; TeX-Mode
;;
;;; AucTeX
(setq TeX-auto-save t)
(setq auto-save-interval 10);
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)

;; Use PDF mode by default
(setq-default TeX-PDF-mode t)
;; Make emacs aware of multi-file projects
(setq-default TeX-master nil)

;The following lines is to ensure environment variables inside Emacs look the same as in the user's shell.
;(when (memq window-system '(mac ns))
; (exec-path-from-shell-initialize)) 

;;have texbin in your $PATH
;an example: (setenv "PATH" (concat (getenv "PATH") ":/usr/texbin"))
(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin:/Library/TeX/texbin"))
(let ((my-path (expand-file-name "/usr/local/bin:/usr/local/texlive/2015/bin/x86_64-darwin")))
    (setenv "PATH" (concat my-path ":" (getenv "PATH")))
    (add-to-list 'exec-path my-path))

;;SynTex set-up
;; make latexmk available via C-c C-c
;; Note: SyncTeX is setup via ~/.latexmkrc (see below)
(add-hook 'LaTeX-mode-hook (lambda ()
  (push
    '("latexmk" "latexmk -pdf -pvc %s" TeX-run-TeX nil t
      :help "Run latexmk on file")
    TeX-command-list)))
(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background  
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
     '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

(server-start) ;start emacs in server mode so that skim can talk to it

;;use c+n to add a new line, where the point is at the end of the buffer
(setq next-line-add-newlines t)

;;load company-auctex
;(add-to-list 'load-path "path/to/company-auctex.el")
(use-package company-auctex
  :config
  :init)
  (require 'company-auctex)
(company-auctex-init)
(add-hook 'after-init-hook 'global-company-mode)

;;-------------TeX-Count--------------------------------;
;; TeXcount setup for TeXcount version 2.3 and later
;;
 (defun texcount ()
   (interactive)
   (let*
     ( (this-file (buffer-file-name))
       (enc-str (symbol-name buffer-file-coding-system))
       (enc-opt
         (cond
           ((string-match "utf-8" enc-str) "-utf8")
           ((string-match "latin" enc-str) "-latin1")
           ("-encoding=guess")
       ) )
       (word-count
         (with-output-to-string
           (with-current-buffer standard-output
             (call-process "texcount" nil t nil "-0" enc-opt this-file)
     ) ) ) )
     (message word-count)
 ) )
 (add-hook 'LaTeX-mode-hook (lambda () (define-key LaTeX-mode-map "\C-cw" 'texcount)))
 (add-hook 'latex-mode-hook (lambda () (define-key latex-mode-map "\C-cw" 'texcount)))
;;
;; TeXcount setup for AUCTeX
;;
 (require 'tex)
 (add-to-list 'TeX-command-list
       (list "TeXcount" "texcount %s.tex" 'TeX-run-command nil t))

;------------------add a $$ using Key Bindings----------------------
(defun dollar-pair ()
  "We insert a pair of dollar signs and position
    point in between them."
  (interactive)
  (progn
    (insert "$$")
    (backward-char)))

(defun jump-out ()
  "We first expand the abbrev before point (if there is an abbrev
    before point), and then we move point forward in the file until we
    pass the first dollar sign, right paren, right bracket, right brace
    or double quote."
  (interactive)
  (progn
    (expand-abbrev)
    (re-search-forward "[])}$\"]")))
;;--------------------------------------------------------------------
;keybindings
(global-set-key "\em"     'dollar-pair)
(global-set-key "\C-cm"   'dollar-pair)

;; fill paragraph
(setq LaTeX-fill-break-at-separators '(\\\( \\\[))

;; use PDFViewer rather than Skim as pdf-viewer
;; ;; The following only works with AUCTeX loaded
;; 		(require 'tex-site)
;; 		(add-hook 'TeX-mode-hook
;; 		    (lambda ()
;; 		        (add-to-list 'TeX-output-view-style
;; 		            '("^pdf$" "."
;; 		              "/Applications/PDFView.app/Contents/MacOS/gotoline.sh %n %(OutFullPath)"))
;; 		        (add-to-list 'TeX-expand-list
;; 		            '("%(OutFullPath)" (lambda nil
;; 		                                 (expand-file-name
;; 		                                  (TeX-active-master (TeX-output-extension) t)
;; 		                                  (TeX-master-directory))))))
;; 		)

(provide 'init-tex)
