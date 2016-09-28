;;; init-org.el --- Org Mode.

;;; Commentary:
;;;   Configure Org Mode.

;;; Code:
(require 'org)

(setq org-startup-indented t)

(bind-key* "C-c a" (lambda() (interactive) (org-agenda nil "a")))
(bind-keys :map org-mode-map
           ("M-p" . org-metaup)
           ("M-n" . org-metadown)
           ("C-c C-w" . org-cut-special))

(find-file "~/todo.org")

(provide 'init-org)
;;; init-org.el ends here
