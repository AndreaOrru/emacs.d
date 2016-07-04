;;; init-elpa.el --- Package manager initialization.

;;; Commentary:
;;;   Configure package repositories.

;;; Code:
(require 'package)

; Add MELPA repository:
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(provide 'init-elpa)
;;; init-elpa.el ends here
