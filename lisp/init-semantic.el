;;; init-semantic.el --- Semantic mode.

;;; Commentary:
;;;  Enable Semantic mode, submodes and integration with Auto-Complete.

;;; Code:
(require 'auto-complete-config)

(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)

(semantic-mode 1)

; Add Semantic source to Auto-Complete:
(add-hook 'prog-mode-hook (lambda()
  (add-to-list 'ac-sources 'ac-source-semantic)))

(provide 'init-semantic)
;;; init-semantic.el ends here
