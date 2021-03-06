;; Enable org-mode
(require 'org)

;;UTF-8 characters in org-mode
(use-package org-bullets
  :ensure t
  :init)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-bullets-bullet-list '("✙" "♱" "♰" "☥" "✞" "✟" "✝" "†" "✠" "✚" "✜" "✛" "✢" "✣" "✤" "✥"))
;;complete using ido
(setq org-completion-us-ido t)
;; markdown and beamer output
(require 'ox-latex)
(require 'ox-md nil t)
(require 'ox-beamer nil t)

					;(require 'org-latex)
(setq org-export-latex-listings t) 
;; Originally taken from Bruno Tavernier: \ http://thread.gmane.org/gmane.emacs.orgmode/31150/focus=31432
;; but adapted to use latexmk 4.20 or higher.  
(defun my-auto-tex-cmd ()
  "When exporting from .org with latex, automatically run latex,
       pdflatex, or xelatex as appropriate, using latexmk."
  (let ((texcmd)))
  ;; default command: oldstyle latex via dvi
  (setq texcmd "latexmk -dvi -pdfps %f")        
  ;; pdflatex -> .pdf
  (if (string-match "LATEX_CMD: pdflatex" (buffer-string))
      (setq texcmd "latexmk -pdf %f"))
  ;; xelatex -> .pdf
  (if (string-match "LATEX_CMD: xelatex" (buffer-string))
      (setq texcmd "latexmk -pdflatex=xelatex -pdf %f"))
  ;; LaTeX compilation command
  (setq org-latex-to-pdf-process (list texcmd)))
(add-hook 'org-export-latex-after-initial-vars-hook 'my-auto-tex-cmd)
;; Default packages included in every tex file, pdflatex or xelatex
(setq org-export-latex-packages-alist
      '(("" "graphicx" t)
	("" "longtable" nil)
	("" "float" nil)))

(defun my-auto-tex-parameters ()
  "Automatically select the tex packages to include."
  ;; default packages for ordinary latex or pdflatex export
  (setq org-export-latex-default-packages-alist
	'(("AUTO" "inputenc" t)
	  ("T1"   "fontenc"   t)
	  (""     "fixltx2e"  nil)
	  (""     "wrapfig"   nil)
	  (""     "soul"      t)
	  (""     "textcomp"  t)
	  (""     "marvosym"  t)
	  (""     "wasysym"   t)
	  (""     "latexsym"  t)
	  (""     "amssymb"   t)
	  (""     "hyperref"  nil)))
  
  ;; Packages to include when xelatex is used
  ;; (see https://github.com/kjhealy/latex-custom-kjh for the 
  ;; non-standard ones.)
  (if (string-match "LATEX_CMD: xelatex" (buffer-string))
      (setq org-export-latex-default-packages-alist
	    '(("" "fontspec" t)
	      ("" "xunicode" t)
	      ("" "url" t)
	      ("" "rotating" t)
	      ("" "memoir-article-styles" t)
	      ("american" "babel" t)
	      ("babel" "csquotes" t)
	      ("" "listings" nil)
	      ("" "listings-sweave-xelatex" nil)
	      ("svgnames" "xcolor" t)
	      ("" "soul" t)
	      ("xetex, colorlinks=true, urlcolor=FireBrick, plainpages=false, pdfpagelabels, bookmarksnumbered" "hyperref" nil)
	      )))
  
  (if (string-match "LATEX_CMD: xelatex" (buffer-string))
      (setq org-export-latex-classes
	    (cons '("article"
		    "\\documentclass[11pt,article,oneside]{memoir}
        \\input{vc}
        \\usepackage[style=authoryear-comp-ajs, abbreviate=true]{biblatex}
        \\bibliography{socbib}"
		    ("\\section{%s}" . "\\section*{%s}")
		    ("\\subsection{%s}" . "\\subsection*{%s}")
		    ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		    ("\\paragraph{%s}" . "\\paragraph*{%s}")
		    ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
		  org-export-latex-classes))))  

(add-hook 'org-export-latex-after-initial-vars-hook 'my-auto-tex-parameters)

(setq org-highlight-latex-and-related '(latex))

(use-package auto-org-md
  :ensure t
  :init)

(setq org-src-tab-acts-natively t)

;; tomato working
(use-package org-pomodoro
  :ensure
  :init)

;; drag and drop images to org-mode
(use-package org-download
  :ensure
  :init)

;;=============================================
;; ob-ipython: org-babel integrate with Jupyter
;;============================================

(use-package ob-ipython
  :ensure t
  :init)
(require 'ob-ipython)

(setq org-confirm-babel-evaluate nil)   ;don't prompt me to confirm everytime I want to evaluate a block
;;; display/update images in the buffer after I evaluate
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

(add-to-list 'org-latex-minted-langs '(ipython "python"))


;; enable ipython in org-babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ipython . t)
   (emacs-lisp . t)
   (R . t)
   (latex . t)
   (sql . t)
   ;; (c++ . t)
   (python . t)
   ;; (sh . t)
   (awk . t)
   (sed . t)
   ))

(provide 'init-org)

