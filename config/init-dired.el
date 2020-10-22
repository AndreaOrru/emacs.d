;; -*- lexical-binding: t -*-

(require 'dired)
(add-hook 'dired-mode-hook 'dired-hide-details-mode)  ;; Minimal interface.
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)       ;; Git diffs.

;; Don't open useless Dired buffers.
(require-package 'dired-single)
(after 'dired
  (define-key dired-mode-map [remap dired-find-file]
    'dired-find-alternate-file)
  (define-key dired-mode-map [remap dired-mouse-find-file-other-window]
    'dired-single-buffer-mouse)
  (define-key dired-mode-map [remap dired-up-directory]
    'dired-single-up-directory))

;; VIM Vinegar emulation.
(after 'evil
  (evil-global-set-key 'normal (kbd "-") 'dired-jump))

(provide 'init-dired)
