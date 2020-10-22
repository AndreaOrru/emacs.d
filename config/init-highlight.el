;; -*- lexical-binding: t -*-

;; Highlight matching parenthesis.
(add-hook 'prog-mode-hook 'show-paren-mode)
;; Highlight TODOs, HACKs, etc.
(require-package 'hl-todo)
(add-hook 'after-init-hook 'global-hl-todo-mode)

;; Highlight the current line.
(add-hook 'after-init-hook 'global-hl-line-mode)
(after 'hl-line
  (set-face-background 'hl-line (doom-color 'base3)))
;; Disable line highlighting in Eshell.
(add-hook 'eshell-mode-hook
          #'(lambda () (setq-local global-hl-line-mode nil)))

;; Auto-highlight the symbol at point.
(require-package 'auto-highlight-symbol)
(add-hook 'after-init-hook 'global-auto-highlight-symbol-mode)
(after 'auto-highlight-symbol
  (setq ahs-case-fold-search nil
        ahs-face 'isearch
        ahs-definition-face 'isearch)
  (set-face-background 'ahs-plugin-defalt-face (face-background 'isearch))
  (set-face-foreground 'ahs-plugin-defalt-face (face-foreground 'isearch)))

;; Highlight arbitrary regions of the buffer.
(require-package 'highlight)
(after 'highlight
  (setq hlt-auto-faces-flag t)
  (setq hlt-auto-face-foreground nil)
  (defface hlt-red '((t (:background "#332525" :extend t))) "")
  (setq hlt-auto-face-backgrounds '(hlt-red)))

(defun my/hlt-highlight-region ()
  "Highlight the current region, or the buffer if no region is selected."
  (interactive)
  (hlt-highlight-region)
  (evil-exit-visual-state))

(after 'evil-leader
  ;; Toggle auto-highlight.
  (evil-leader/set-key "ht" 'auto-highlight-symbol-mode)
  (evil-leader/set-key "hh" 'my/hlt-highlight-region)
  (evil-leader/set-key "hu" 'hlt-unhighlight-region)
  (evil-global-set-key 'normal (kbd "]h") 'hlt-next-highlight)
  (evil-global-set-key 'normal (kbd "[h") 'hlt-previous-highlight)

  ;; Clear search selection.
  (evil-leader/set-key "sc" 'evil-ex-nohighlight))

(provide 'init-highlight)
