;;; init-multiple-cursors.el --- Multiple cursors.

;;; Commentary:
;;;   Support multiple cursors inside buffers.

;;; Code:
(require 'require-package)
(require-package 'multiple-cursors)

; TEMPORARY: waiting for this fix to get accepted upstream.
(require 'mc-mark-more)
(defun mc/mark-previous-like-this-word (arg)
  "Find and mark the previous part of the buffer matching the active region.
If no region is active, mark the word at the point and find the previous match.
With negative ARG, delete the last one instead.
With zero ARG, skip the last one and mark previous."
  (interactive "p")
  (if (< arg 0)
      (let ((cursor (mc/furthest-cursor-after-point)))
	(if cursor
	    (mc/remove-fake-cursor cursor)
	  (error "No cursors to be unmarked")))
    (if (region-active-p)
        (mc/mark-more-like-this (= arg 0) 'backwards)
      (mc--select-thing-at-point 'word)
      (mc/mark-more-like-this (= arg 0) 'backwards)))
  (mc/maybe-multiple-cursors-mode))

; Commands that start from current region/point:
(global-set-key (kbd "C-S-n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-S-p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-S-l") 'mc/mark-all-like-this)
; Commands that start from the word on point:
(global-set-key (kbd "M-N") 'mc/mark-next-like-this-word)
(global-set-key (kbd "M-P") 'mc/mark-previous-like-this-word)
(global-set-key (kbd "M-L") 'mc/mark-all-words-like-this)
; Add cursors by clicking:
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

(provide 'init-multiple-cursors)
;;; init-multiple-cursors.el ends here
