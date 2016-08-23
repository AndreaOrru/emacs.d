;;; init-php.el --- PHP mode.

;;; Commentary:
;;;   Install and configure PHP mode.

;;; Code:
(require 'require-package)
(require-package 'php-mode)

(add-hook 'php-mode-hook 'php-enable-default-coding-style)

; Dash documentation:
(add-hook 'php-mode-hook '(lambda()
  (setq-local counsel-dash-docsets '("PHP Laravel MySQL"))))

(provide 'init-php)
;;; init-php.el ends here
