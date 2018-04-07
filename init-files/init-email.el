"
write and send email in emacs
"
;; send mail
(setq
send-mail-function 'smtpmail-send-it
message-send-mail-function 'smtpmail-send-it
user-mail-address "hgong2@vols.utk.com"
smtpmail-starttls-credentials '(("smtp.gmail.com" "587" nil nil))
smtpmail-auth-credentials (expand-file-name "~/.authinfo")
smtpmail-default-smtp-server "smtp.gmail.com"
smtpmail-smtp-server "smtp.gmail.com"
smtpmail-smtp-service 587
smtpmail-debug-info t
starttls-extra-arguments nil
starttls-gnutls-program "/usr/local/bin/gnutls-cli"
starttls-extra-arguments nil
starttls-use-gnutls t
)

;; signature
(add-hook 'mail-setup-hook 'fortune-to-signature)

;; debug in case of error
(setq smtpmail-debug-info t)
(setq smtpmail-debug-verb t)


(provide 'init-email)
