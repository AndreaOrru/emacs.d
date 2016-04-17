;;; init-dired.el --- Dired.

;;; Commentary:
;;;   Configure Dired.

;;; Code:

; Show VCS differences:
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)

(provide 'init-dired)
;;; init-dired.el ends here
