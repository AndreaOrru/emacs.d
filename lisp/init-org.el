;;; init-org.el --- Org Mode.

;;; Commentary:
;;;   Configure Org Mode.

;;; Code:
(require 'org)

(setq org-startup-indented t)

(global-set-key (kbd "C-c a") '(lambda() (interactive) (org-agenda nil "a")))
(define-key org-mode-map (kbd "M-p") 'org-metaup)
(define-key org-mode-map (kbd "M-n") 'org-metadown)

(find-file "~/todo.org")

(provide 'init-org)
;;; init-org.el ends here
