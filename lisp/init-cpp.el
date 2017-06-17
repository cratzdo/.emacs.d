;; set-up for c++
(use-package cmake-ide
  :config
  :init)

(use-package rtags
  :config
  :init)

(require 'rtags) ;; optional, must have rtags installed
(cmake-ide-setup)

(provide 'init-cpp)
