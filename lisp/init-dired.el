;;; init-dired.el --- Dired.

;;; Commentary:
;;;   Configure Dired.

;;; Code:
(require 'dired)
(require 'require-package)

; Use just a single buffer:
(require-package 'dired-single)

; Show VCS differences:
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)

(bind-keys :map dired-mode-map
           ("RET"       . dired-single-buffer)
           ("<mouse-1>" . dired-single-buffer-mouse)
           ("^" . (function
                   (lambda nil (interactive) (dired-single-buffer "..")))))

(provide 'init-dired)
;;; init-dired.el ends here
