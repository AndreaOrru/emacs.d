;;; init-multiple-cursors.el --- Multiple cursors.

;;; Commentary:
;;;   Support multiple cursors inside buffers.

;;; Code:
(require 'require-package)
(require-package 'multiple-cursors)

; Commands that start from current region/point:
(bind-keys*
 ("C->"   . mc/mark-next-like-this)
 ("C-<"   . mc/mark-previous-like-this)
 ("C-S-l" . mc/mark-all-like-this)
 ; Add cursors by clicking:
 ("C-S-<mouse-1>" . mc/add-cursor-on-click))

(provide 'init-multiple-cursors)
;;; init-multiple-cursors.el ends here
