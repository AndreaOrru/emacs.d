;; -*- lexical-binding: t -*-

(require-package 'evil-mc)
(add-hook 'after-init-hook 'global-evil-mc-mode)

;; HACK: prevent evil-collection from wiping evil-mc bindings.
(after 'evil-collection
  (advice-add 'evil-collection-evil-mc-clear-keymap :around #'(lambda (&rest args))))

;; Use C-g to undo all cursors.
(defun my/keyboard-quit ()
  (interactive)
  (evil-mc-undo-all-cursors)
  (evil-force-normal-state)
  (keyboard-quit))

;; Key bindings.
(after 'evil
  ;; Undefine some of the default bindings.
  (evil-define-key '(normal visual) evil-mc-key-map (kbd "gr") nil)
  (evil-define-key '(normal visual) evil-mc-key-map (kbd "C-t") nil)

  ;; Add a new cursor on the next line.
  (evil-define-key '(normal visual) evil-mc-key-map
    (kbd "C-j") 'evil-mc-make-cursor-move-next-line)
  ;; Add a new cursor on the previous line.
  (evil-define-key '(normal visual) evil-mc-key-map
    (kbd "C-k") 'evil-mc-make-cursor-move-prev-line)

  ;; Go to last cursor.
  (evil-define-key '(normal visual) evil-mc-key-map
    (kbd "C-b") 'evil-mc-make-and-goto-last-cursor)
  ;; Go to first cursor.
  (evil-define-key '(normal visual) evil-mc-key-map
    (kbd "C-f") 'evil-mc-make-and-goto-first-cursor)

  ;; Skip matches.
  (evil-define-key '(normal visual) evil-mc-key-map (kbd "M-n")
    'evil-mc-skip-and-goto-next-match)
  (evil-define-key '(normal visual) evil-mc-key-map (kbd "M-p")
    'evil-mc-skip-and-goto-prev-match)

  ;; Undo all cursors.
  (evil-define-key '(normal visual insert) evil-mc-key-map
    (kbd "C-g") 'my/keyboard-quit))

;; Integration with expand-region to edit all occurrences of region.
;; Adapted from https://github.com/syl20bnr/evil-iedit-state/blob/master/evil-iedit-state.el#L157
(after 'expand-region
  (defun my/evil-mc-mode-from-expand-region (&optional arg)
    (interactive "P")
    (evil-mc-make-all-cursors)
    ;; Force expand-region temporary overlay map exit.
    (setq overriding-terminal-local-map nil))

  (defadvice er/prepare-for-more-expansions-internal
      (around my/er-prepare-for-more-expansions-internal activate)
    ad-do-it
    (let ((default-msg (car ad-return-value))
          (default-bindings (cdr ad-return-value)))
      (setq ad-return-value
            (cons (concat default-msg ", e to edit")
                  (add-to-list 'default-bindings
                               '("e" my/evil-mc-mode-from-expand-region)))))))

(provide 'init-multiple-cursors)
