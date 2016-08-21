;;; init-editing.el --- Text editing behaviour.

;;; Commentary:
;;;  Indentation, parenthesis highlight, and other editing utils.

;;; Code:

; Cut/copy the current line if no region is active:
(require 'require-package)
(require-package 'whole-line-or-region)
(whole-line-or-region-mode 1)
(diminish 'whole-line-or-region-mode)

(show-paren-mode 1)      ; Highlight matching parentheses.
(electric-pair-mode 1)   ; Autocomplete pairs.
(blink-cursor-mode -1)   ; Disable blinking cursor.
(global-subword-mode 1)  ; CamelCase aware editing.
; Highlight the current line in graphical mode:
(if window-system (global-hl-line-mode 1))

(setq-default
  auto-save-default nil     ; Don't auto save files.
  delete-active-region nil  ; Don't delete selection with backspace.
  column-number-mode t      ; Show column number in status bar.
  indent-tabs-mode nil      ; Don't use tabs to indent.
  make-backup-files nil     ; Don't create backup files.
  require-final-newline t   ; Add final newline on saving.
  tab-width 4)              ; Tabs displayed as 4 spaces.

; Delete trailing whitespaces on saving:
(require-package 'whitespace-cleanup-mode)
(global-whitespace-cleanup-mode 1)
; Show trailing whitespaces in programming buffers:
(add-hook 'prog-mode-hook (lambda()
  (setq show-trailing-whitespace t)))

; Insert line break and then indent the new line:
(global-set-key (kbd "RET") 'newline-and-indent)

; Progressive expansion of selected region:
(require-package 'expand-region)
(setq expand-region-fast-keys-enabled nil)
(setq expand-region-smart-cursor t)
(global-set-key (kbd "C-.") 'er/expand-region)
(global-set-key (kbd "C-,") 'er/contract-region)

; Transpose line/region up and down:
(require-package 'move-dup)
(diminish 'move-dup-mode)
(defadvice md/move-line (after my/md-move-line activate)
  "Do not set the mark after moving lines."
  (deactivate-mark))
(global-set-key (kbd "C-S-n") 'md/move-lines-down)
(global-set-key (kbd "C-S-p") 'md/move-lines-up)
(global-set-key (kbd "M-N") 'md/duplicate-down)
(global-set-key (kbd "M-P") 'md/duplicate-up)

(provide 'init-editing)
;;; init-editing.el ends here
