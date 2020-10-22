;; -*- lexical-binding: t -*-

;; Sane defaults.
(setq-default
 auto-save-default nil  ;; Don't auto save files.
 c-basic-offset 4       ;; Use 4 spaces for indentation.
 column-number-mode t   ;; Show column number in modeline.
 create-lockfiles nil   ;; Don't create # lock files.
 make-backup-files nil  ;; Don't create ~ backup files.
 indent-tabs-mode nil   ;; Use spaces for indentation.
 tab-width 4)           ;; Show tabs as 4 spaces.

(add-hook 'after-init-hook 'global-subword-mode) ;; CamelCase words.
(add-hook 'after-init-hook 'electric-pair-mode)  ;; Insert separators in pairs.

;; Intelligently clean up extra whitespaces on save.
(require-package 'whitespace-cleanup-mode)
(add-hook 'after-init-hook 'global-whitespace-cleanup-mode)

(require-package 'expand-region)        ;; Interactively expand region.
(require-package 'evil-nerd-commenter)  ;; Utilities for (un-)commenting.

;; Key bindings.
(after 'init-evil
  ;; Toggle line numbers.
  (which-key/describe-prefix "t" "toggle")
  (evil-leader/set-key "tl" 'global-linum-mode)

  ;; Adjust region indentation.
  (evil-define-key 'visual prog-mode-map (kbd "TAB") 'indent-region)
  (evil-leader/set-key "v" 'er/expand-region)  ;; Expand region.

  ;; Comment/uncomment.
  (require 'evil-nerd-commenter)
  (evil-leader/set-key ";" 'evilnc-comment-operator))

(provide 'init-editing)
