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

; Disable Semantic for everything but C/C++:
(with-eval-after-load 'semantic
  (add-to-list 'semantic-inhibit-functions (lambda()
    (not (member major-mode '(c-mode c++-mode))))))
(semantic-mode 1)

; Use info extracted from Irony to help Semantic:
(require 'irony)
(defadvice irony-cdb--update-compile-options (after my/irony-cdb--update-compile-options activate)
  "Pass the include paths detected by Irony to Semantic."
  (dolist (dir (irony--extract-user-search-paths
                irony--compile-options
                irony--working-directory))
    (semantic-add-system-include dir)))

; Force reloading all the includes after Irony update:
(add-to-list 'semantic-init-db-hook (lambda()
  (semanticdb-find-translate-path nil nil)))

(defun semantic-parse-dir (root)
  "Make Semantic parse all source files in directory ROOT, recursively."
  (interactive (list (read-directory-name "Root directory; "
                                          irony--working-directory)))
  (dolist (file (directory-files-recursively
                 root
                 ".*\\.\\(c\\|cpp\\|cxx\\|h\\|hpp\\|hxx\\)"))
    (semanticdb-file-table-object file)))

; Key bindings:
(bind-keys :map semantic-mode-map
           ("C-c P" . semantic-decoration-unparsed-include-parse-all-includes)
           ("C-c t" . semantic-analyze-proto-impl-toggle)
           ("C-c j" . semantic-ia-fast-jump)
           ("M-<down-mouse-1>" . semantic-ia-fast-mouse-jump)

           ("C-c u" . senator-go-to-up-reference)
           ("C-c p" . senator-previous-tag)
           ("C-c n" . senator-next-tag)

           ("C-c C-w" . senator-kill-tag)
           ("C-c M-w" . senator-copy-tag))

(provide 'init-semantic)
;;; init-semantic.el ends here
