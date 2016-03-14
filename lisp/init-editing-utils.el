;;; init-editing-utils.el --- Editor behaviour.

;;; Commentary:
;;;  Indentation levels, highlight matching parenthesis, etc.

;;; Code:
(setq-default
  column-number-mode t
  indent-tabs-mode nil
  make-backup-files nil
  auto-save-default nil)

(show-paren-mode 1)
(if window-system (global-hl-line-mode 1))

(global-set-key (kbd "RET") 'newline-and-indent)

(provide 'init-editing-utils)
;;; init-editing-utils.el ends here
