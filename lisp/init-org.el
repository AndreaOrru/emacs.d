;;; init-org.el --- Org Mode.

;;; Commentary:
;;;   Configure Org Mode.

;;; Code:
(require 'org)

(setq org-startup-indented t)
(setq org-default-priority 67)  ; "C" is default priority.

(bind-key* "C-c a" (lambda() (interactive) (org-agenda nil "a")))
(bind-keys :map org-mode-map
           ("M-p" . org-metaup)
           ("M-n" . org-metadown)
           ("M-S-<return>" . org-insert-subheading)
           ("C-c C-w" . org-cut-special)
           ("C-c p" . org-priority))

(find-file "~/todo.org")

(provide 'init-org)
;;; init-org.el ends here
