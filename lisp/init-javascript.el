;;; init-javascript.el --- JavaScript mode.

;;; Commentary:
;;;   JavaScript IDE mode for JS, JSX files.

;;; Code:
(require 'company)
(require 'require-package)
(require-package 'js2-mode)

; Associate file extensions and Node interpreter:
(add-to-list 'auto-mode-alist  '("\\.jsx?\\'" . js2-jsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))

(add-hook 'js2-jsx-mode-hook '(lambda()
  (tern-mode 1)  ; Intelligent analysis.
  (setq js2-basic-offset 2)
  (setq js-switch-indent-offset 2)
  ; Align company annotations to the right:
  (set (make-local-variable 'company-tooltip-align-annotations) t)
  ; Fast switch to web-mode (for JSX tags):
  (local-set-key (kbd "C-c m") 'web-mode)))

; We are relying on Flycheck for error reporting:
(defadvice js2-report-error (around my/js2-report-error activate)
  "Don't report errors in JS2 mode."
  nil)
(defadvice js2-report-warning (around my/js2-report-warning activate)
  "Don't report warnings in JS2 mode."
  nil)

; Company autocompletion through Tern:
(require-package 'company-tern)
(add-to-list 'company-backends 'company-tern)

; Dash documentation:
(add-hook 'js2-jsx-mode-hook '(lambda()
  (setq-local counsel-dash-docsets
              '("JavaScript" "jQuery" "MomentJS" "NodeJS" "React"))))

(provide 'init-javascript)
;;; init-javascript.el ends here
