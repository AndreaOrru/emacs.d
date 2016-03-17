;;; init-php.el --- PHP mode.

;;; Commentary:
;;;   Install and configure PHP mode.

;;; Code:
(require 'require-package)
(require-package 'php-mode)

(add-hook 'php-mode-hook 'php-enable-default-coding-style)

(provide 'init-php)
;;; init-php.el ends here
