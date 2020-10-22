;; -*- lexical-binding: t -*-

;; Custom bullets.
(require-package 'org-bullets)
(add-hook 'org-mode-hook 'org-bullets-mode)
;; Speed up font loading.
(setq inhibit-compacting-font-caches t)

(provide 'init-org)
