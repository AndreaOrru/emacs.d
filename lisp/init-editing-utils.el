;;; init-editing-utils.el --- Editor behaviour.

;;; Commentary:
;;;  Indentation levels, highlight matching parenthesis, etc.

;;; Code:

; Cut/copy the current line if no region is active:
(require 'require-package)
(require-package 'whole-line-or-region)
(whole-line-or-region-mode t)

(show-paren-mode t)     ; Highlight matching parentheses.
(electric-pair-mode t)  ; Autocomplete pairs.
; Highlight the current line in graphical mode:
(if window-system (global-hl-line-mode t))

(setq-default
  auto-save-default nil    ; Don't auto save files.
  column-number-mode t     ; Show column number in status bar.
  indent-tabs-mode nil     ; Don't use tabs to indent.
  make-backup-files nil    ; Don't create backup files.
  require-final-newline t  ; Add final newline on saving.
  tab-width 4)             ; Tabs displayed as 4 spaces.

; Delete trailing whitespaces on saving:
(add-hook 'before-save-hook 'delete-trailing-whitespace)

; Insert line break and then indent the new line:
(global-set-key (kbd "RET") 'newline-and-indent)

; Setup multiple cursors support:
(require-package 'multiple-cursors)
(global-set-key (kbd "C-S-n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-S-p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-S-s") 'mc/mark-all-like-this)

(provide 'init-editing-utils)
;;; init-editing-utils.el ends here
