;;; init-git.el --- Git, Magit, Github stuff.

;;; Commentary:
;;;   Configure Git related modules, maily Magit but also Github integration.

;;; Code:
(require 'require-package)
(require-package 'magit)

(global-magit-file-mode t)

; Key bindings:
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(provide 'init-git)
;;; init-git.el ends here
