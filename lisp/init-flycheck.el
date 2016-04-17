;;; init-flycheck.el --- Syntax checking.

;;; Commentary:
;;;   Initialize Flycheck for syntax checking.

;;; Code:
(require 'require-package)
(require-package 'flycheck)

(global-flycheck-mode 1)
; Set the current Emacs load path in Flycheck:
(setq-default flycheck-emacs-lisp-load-path load-path)

(defadvice semantic-idle-summary-idle-function (around my/semantic-idle-summary-idle-function activate)
  "Don't show semantic informations if there are errors."
  (if (flycheck-overlay-errors-at (point))
      (flycheck-display-error-at-point)
    ad-do-it))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
