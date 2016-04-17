;;; init-dired.el --- Dired.

;;; Commentary:
;;;   Configure Dired.

;;; Code:
(require 'require-package)

; Use just a single buffer:
(require-package 'dired-single)

(add-hook 'dired-mode-hook '(lambda()
  (define-key dired-mode-map [return] 'dired-single-buffer)
  (define-key dired-mode-map [mouse-1] 'dired-single-buffer-mouse)
  (define-key dired-mode-map "^"
    (function
      (lambda nil (interactive) (dired-single-buffer ".."))))))

; Show VCS differences:
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)

(provide 'init-dired)
;;; init-dired.el ends here
