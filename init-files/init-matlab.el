;;
;; Enable matlab-mode
;;

;;use the following line enable the path of matlab to be identifiable by Emacs.
;;sudo ln -s /Applications/MATLAB_R2015b.app/bin/matlab /usr/bin/matlab
(use-package matlab-mode
  :config
  :init)
    ;; Enable CEDET feature support for MATLAB code. (Optional)
(matlab-cedet-setup)
;;

;;override C-l and use it to do M-x erase-buffer
(defun clear-and-return () 
  "Erases the buffer, and then passes a return to the buffer process.
Assumes the buffer is attached to a comint process."
  (interactive)
  (erase-buffer) 
  (comint-send-input))

(defun my-m-shell-mode-hook ()
  (local-set-key (kbd "C-l") 'clear-and-return))

(add-hook 'm-shell-mode-hook 'my-m-shell-mode-hook)

(provide 'init-matlab)
