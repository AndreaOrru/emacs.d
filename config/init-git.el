;; -*- lexical-binding: t -*-

;; Follow symlinks in Git repositories.
(setq vc-follow-symlinks t)

;; Install Magit and configure Evil key bindings.
(require-package 'magit)
(require-package 'evil-magit)
(after 'magit
  (evil-magit-init))

;; Enable diff-hl for Git diff in the fringe.
(require-package 'diff-hl)
(add-hook 'after-init-hook 'global-diff-hl-mode)
;; Show diff-hl in the margin in the terminal.
(unless (display-graphic-p)
  (add-hook 'after-init-hook 'diff-hl-margin-mode))
(add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

;; Navigate through different revisions of the same file.
(require-package 'git-timemachine)
(after 'git-timemachine
  ;; Make git-timemachine's keymap override evil's defaults.
  (evil-make-overriding-map git-timemachine-mode-map 'normal)
  (add-hook 'git-timemachine-mode-hook 'evil-normalize-keymaps))

;; GitHub integration.
(require-package 'browse-at-remote)
;; Keep track of project's TODOs:
(require-package 'magit-todos)
(after 'ivy (require 'magit-todos))

;; Key bindings.
(after 'init-evil
  (which-key/describe-prefix "g" "git")

  (evil-leader/set-key "gb" 'magit-blame-addition)
  (evil-leader/set-key "gd" 'magit-diff-buffer-file)
  (evil-leader/set-key "gD" 'magit-diff-working-tree)
  (evil-leader/set-key "gh" 'git-timemachine-toggle)
  (evil-leader/set-key "gl" 'magit-log-all)
  (evil-leader/set-key "gr" 'browse-at-remote)
  (evil-leader/set-key "gs" 'magit-status)
  (evil-leader/set-key "gt" 'ivy-magit-todos)

  (evil-global-set-key 'normal (kbd "]g") 'diff-hl-next-hunk)
  (evil-global-set-key 'normal (kbd "[g") 'diff-hl-previous-hunk)
  (evil-leader/set-key "u" 'diff-hl-revert-hunk))

(provide 'init-git)
