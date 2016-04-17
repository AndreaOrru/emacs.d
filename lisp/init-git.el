;;; init-git.el --- Git, Magit, Github stuff.

;;; Commentary:
;;;   Configure Git related modules, mainly Magit but also Github integration.

;;; Code:
(require 'require-package)

; Magit:
(require-package 'magit)
(global-magit-file-mode t)

; Highlight differences:
(require-package 'diff-hl)
(global-diff-hl-mode t)
(diff-hl-flydiff-mode t)
; Magit/diff-hl integration:
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

; Key bindings:
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(provide 'init-git)
;;; init-git.el ends here
