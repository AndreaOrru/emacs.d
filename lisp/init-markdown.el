;;; init-markdown --- Markdown mode.

;;; Commentary:
;;;   Enable rich Markdown editing.

;;; Code:
(require 'require-package)
(require-package 'markdown-mode)

; Prefer Github mode:
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
(add-hook 'gfm-mode-hook '(lambda()
  (setq markdown-command "marked")))

(provide 'init-markdown)
;;; init-markdown.el ends here
