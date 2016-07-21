;;; init-semantic.el --- Semantic mode.

;;; Commentary:
;;;  Enable Semantic mode and submodes.

;;; Code:
(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)

(semantic-mode 1)

(provide 'init-semantic)
;;; init-semantic.el ends here
