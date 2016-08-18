;;; init-flycheck.el --- Syntax checking.

;;; Commentary:
;;;   Initialize Flycheck for syntax checking.

;;; Code:
(require 'require-package)
(require-package 'flycheck)

(global-flycheck-mode 1)
; Set the current Emacs load path in Flycheck:
(setq-default flycheck-emacs-lisp-load-path load-path)

(provide 'init-flycheck)
;;; init-flycheck.el ends here
