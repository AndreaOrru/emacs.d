;; -*- lexical-binding: t -*-

;; Dim text in surrounding paragraphs.
(require-package 'focus)

(defun my/focus-pin ()
  "Pin the focused section or the region, if active. Ensure focus-mode is enabled."
  (interactive)
  (focus-mode 1)
  (focus-pin)
  (evil-exit-visual-state))

;; Key bindings.
(after 'init-evil
  (evil-leader/set-key "ff" 'focus-mode)
  (evil-leader/set-key "fp" 'my/focus-pin)
  (evil-leader/set-key "fu" 'focus-unpin))

;; HACK: override { and } in focus mode.
(advice-add
 'focus-mode :after
 #'(lambda (orig-fun &rest args)
     (if (bound-and-true-p focus-mode)
         (progn (define-key evil-motion-state-map "}" 'focus-next-thing)
                (define-key evil-motion-state-map "{" 'focus-prev-thing))
       (define-key evil-motion-state-map "}" 'evil-forward-paragraph)
       (define-key evil-motion-state-map "{" 'evil-backward-paragraph))))

(provide 'init-focus)
