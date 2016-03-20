;;; init-elpa.el --- Package manager initialization.

;;; Commentary:
;;;   Add MELPA as a source and initialize Package.

;;; Code:
(require 'package)

; Add MELPA repository to the package sources:
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
; Initialize Package but don't load packages by default:
(setq package-enable-at-startup nil)
(package-initialize)

(provide 'init-elpa)
;;; init-elpa.el ends here
