;; -*- lexical-binding: t -*-

;; Keep the code always indented.
(require-package 'aggressive-indent)
(add-hook 'emacs-lisp-mode-hook 'aggressive-indent-mode)

;; Enable Emacs Lisp documentation through Dash.
(after 'init-docs
  (add-hook 'emacs-lisp-mode-hook
            #'(lambda () (setq-local counsel-dash-docsets '("Emacs Lisp")))))

(after 'init-evil
  (defun describe-symbol-at-point ()
    "Display the full documentation of symbol at point."
    (interactive)
    (describe-symbol (symbol-at-point)))

  (evil-define-key 'visual emacs-lisp-mode-map (kbd ",e") 'eval-region)
  (evil-define-key '(normal visual) emacs-lisp-mode-map (kbd ",p") 'check-parens)
  (evil-define-key '(normal visual) emacs-lisp-mode-map (kbd ",,")
    'describe-symbol-at-point))

(provide 'init-emacs-lisp)
