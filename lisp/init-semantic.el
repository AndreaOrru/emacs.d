;;; init-semantic.el --- Semantic mode.

;;; Commentary:
;;;  Enable Semantic mode and submodes.

;;; Code:
(require 'semantic)

; Extra Semantic submodes:
(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode)

; Disable Semantic for Python mode (conflicts with Anaconda ElDoc):
(with-eval-after-load 'semantic
  (add-to-list 'semantic-inhibit-functions (lambda()
    (equal major-mode 'python-mode))))

; Force loading all the includes:
(add-to-list 'semantic-init-db-hook (lambda()
  (semanticdb-find-translate-path nil nil)))

(semantic-mode 1)  ; Enable Semantic globally.

(provide 'init-semantic)
;;; init-semantic.el ends here
