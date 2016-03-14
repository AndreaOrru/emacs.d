;;; init-auto-complete.el --- Auto completion.

;;; Commentary:
;;;   Enable auto completion in all buffers.

;;; Code:
(require 'require-package)
(require-package 'auto-complete)
(require 'auto-complete-config)

(ac-config-default)
(global-auto-complete-mode t)

(provide 'init-auto-complete)
;;; init-auto-complete.el ends here
