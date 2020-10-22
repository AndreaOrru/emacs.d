;; -*- lexical-binding: t -*-

;; Evil mode.
(require-package 'evil)
(add-hook 'after-init-hook 'evil-mode)

;; Use undo-tree as the undo system.
(require-package 'undo-tree)
(add-hook 'after-init-hook 'global-undo-tree-mode)
(after 'evil
  (evil-set-undo-system 'undo-tree))

;; VIM-like search with persistent highlight.
(setq-default evil-search-module 'evil-search)
(setq-default evil-want-C-u-scroll t)       ;; C-u to scroll up.
(setq-default evil-ex-substitute-global t)  ;; Substitute globally by default.
(setq-default evil-symbol-word-search t)    ;; * and # search for symbols.

;; Support using * and # on selections.
(require-package 'evil-visualstar)
(add-hook 'after-init-hook 'global-evil-visualstar-mode)

;; Collection of extra Evil keybindings.
(require-package 'evil-collection)
(setq evil-want-keybinding nil)
(after 'evil
  (setq evil-collection-company-use-tng nil)  ;; Use standard Company completion.
  (evil-collection-init))

;; Use s for surround and S for substitute.
(require-package 'evil-surround)
(add-hook 'after-init-hook 'global-evil-surround-mode)
(after 'evil-surround
  (evil-define-key 'visual evil-surround-mode-map "s" 'evil-surround-region)
  (evil-define-key 'visual evil-surround-mode-map "S" 'evil-substitute))

;; Use xref for jump to definition.
(after 'evil
  (define-key evil-motion-state-map "gd" 'xref-find-definitions)
  (define-key evil-motion-state-map "gD" 'xref-find-definitions-other-window))

;; Use Space as leader key.
(require-package 'evil-leader)
(add-hook 'after-init-hook 'global-evil-leader-mode)
(after 'evil-leader
  (evil-leader/set-leader "SPC"))

;; Use which-key to display available key bindings.
(require-package 'which-key)
(add-hook 'after-init-hook 'which-key-mode)
(after 'which-key
  (setq which-key-idle-delay 0.4
        which-key-idle-secondary-delay 0.01))

;; Utility function to define which key prefix descriptions.
(after 'evil
  (require 'evil-leader)
  (defun which-key/describe-prefix (prefix description)
    "Assign a which-key DESCRIPTION to a evil-leader PREFIX."
    (which-key-add-key-based-replacements
      (concat evil-leader/leader " " prefix) description)))

(provide 'init-evil)
