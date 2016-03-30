;;; init-ido.el --- IDO mode initialization.

;;; Commentary:
;;;   Enable IDO wherever is possible.

;;; Code:
(require 'ido)
(require 'require-package)

; General IDO options:
(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-matching t)

; IDO beyond everywhere:
(require-package 'ido-ubiquitous)
(ido-ubiquitous-mode t)

; IDO mode in M-x (command selection):
(require-package 'smex)
(defvar smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(provide 'init-ido)
;;; init-ido.el ends here
