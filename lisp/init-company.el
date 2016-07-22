;;; init-company.el --- Auto completion.

;;; Commentary:
;;;   Enable auto completion through Company mode.

;;; Code:
(require 'require-package)
(require-package 'company)
(require-package 'company-quickhelp)
(require-package 'company-try-hard)
(require 'company)

(global-company-mode 1)
(company-quickhelp-mode 1)

(define-key company-mode-map (kbd "M-TAB") 'company-try-hard)
(define-key company-active-map (kbd "M-TAB") 'company-select-next)
(define-key company-active-map (kbd "M-h") 'company-quickhelp-mode)

(provide 'init-company)
;;; init-company.el ends here
