;;; init-git.el --- Git, Magit, Github stuff.

;;; Commentary:
;;;   Configure Git related modules (mainly Magit).

;;; Code:
(require 'require-package)

; Magit:
(require-package 'magit)
(require 'magit)
(global-magit-file-mode 1)

; Highlight differences:
(require-package 'diff-hl)
(global-diff-hl-mode 1)
(diff-hl-flydiff-mode 1)

; Magit/diff-hl integration:
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
; Ivy integration:
(setq magit-completing-read-function 'ivy-completing-read)

; Key bindings:
(global-set-key (kbd "M-g d") 'magit-diff-buffer-file)
(global-set-key (kbd "M-g M-d") 'magit-diff)
(global-set-key (kbd "M-g M-c") 'magit-commit)
(global-set-key (kbd "M-g M-p") 'magit-push-current-to-upstream)

(provide 'init-git)
;;; init-git.el ends here
