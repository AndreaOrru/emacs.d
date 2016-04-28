;;; init-elpa.el --- Package manager initialization.

;;; Commentary:
;;;   Configure package repositories.

;;; Code:
(require 'package)

; Add MELPA repositories:
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa"        . "http://melpa.org/packages/"))

; Give priority to stable packages:
(setq package-archive-priorities
      '(("gnu"          . 10)
        ("melpa-stable" . 10)
        ("melpa"        . 0)))

; Unstable packages:
(setq package-pinned-packages
      '((js2-mode . "melpa")
        (neotree  . "melpa")))

(provide 'init-elpa)
;;; init-elpa.el ends here
