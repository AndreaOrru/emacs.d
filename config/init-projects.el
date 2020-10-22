;; -*- lexical-binding: t -*-

;; Enable Projectile.
(require-package 'projectile)
(add-hook 'after-init-hook 'projectile-mode)
(after 'projectile
  (setq
   projectile-completion-system 'ivy  ;; Use Ivy for completion.
   projectile-enable-caching t))      ;; Faster file indexing.

;; Enable dumb-jump as a fallback to search for definitions inside projects.
(require-package 'dumb-jump)
(setq dumb-jump-force-searcher 'rg)
(setq dumb-jump-selector 'ivy)

(defun my/xref-find-definitions (orig-fun &rest args)
  (condition-case nil (apply orig-fun args)
    (error (dumb-jump-go)))
  (mapc 'funcall imenu-after-jump-hook))
(advice-add 'xref-find-definitions :around 'my/xref-find-definitions)

(defun my/xref-find-definitions-other-window (orig-fun &rest args)
  (condition-case nil (apply orig-fun args)
    (error (dumb-jump-go-other-window)))
  (mapc 'funcall imenu-after-jump-hook))
(advice-add 'xref-find-definitions-other-window
            :around 'my/xref-find-definitions-other-window)

(defun edit-dotemacs ()
  "Open the directory of the current Emacs configuration."
  (interactive)
  (find-file (expand-file-name "config" user-emacs-directory)))

;; Key bindings.
(after 'init-evil
  (evil-leader/set-key "fd" 'edit-dotemacs)

  (which-key/describe-prefix "p" "projects")
  (evil-leader/set-key "p" 'projectile-command-map))

(provide 'init-projects)
