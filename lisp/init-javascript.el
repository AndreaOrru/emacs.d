;;; init-javascript.el --- JavaScript mode.

;;; Commentary:
;;;   JavaScript IDE mode for JS, JSX files.

;;; Code:
(require 'require-package)
(require-package 'js2-mode)

; Associate file extensions and Node interpreter:
(add-to-list 'auto-mode-alist  '("\\.jsx?\\'" . js2-jsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))

(add-hook 'js2-jsx-mode-hook '(lambda()
  (setq js2-basic-offset 2)
  ; Fast switch to web-mode (for JSX's HTML tags):
  (local-set-key (kbd "C-c m") 'web-mode)))

; Activate autocompletion in js2-jsx-mode:
(require 'auto-complete-config)
(add-to-list 'ac-modes 'js2-jsx-mode)

(provide 'init-javascript)
;;; init-javascript.el ends here
