;;; init-multiple-cursors.el --- Multiple cursors.

;;; Commentary:
;;;   Support multiple cursors inside buffers.

;;; Code:
(require 'require-package)
(require-package 'multiple-cursors)

; Commands that start from current region/point:
(global-set-key (kbd "C-S-n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-S-p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-S-l") 'mc/mark-all-like-this)
; Add cursors by clicking:
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

(provide 'init-multiple-cursors)
;;; init-multiple-cursors.el ends here
