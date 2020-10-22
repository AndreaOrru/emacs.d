;; -*- lexical-binding: t -*-

;; Dash documentation search.
(require-package 'counsel-dash)
(require 'dash-docs)
(setq dash-docs-docsets-path (no-littering-expand-var-file-name "docsets"))
(after 'init-evil
  (which-key/describe-prefix "d" "docs")
  (evil-leader/set-key "dd" 'counsel-dash-at-point)
  (evil-leader/set-key "ds" 'counsel-dash))

;; Open documentation in Firefox.
(setq browse-url-browser-function 'browse-url-firefox)

;; Help and documentation functions.
(after 'init-evil
  (which-key/describe-prefix "h" "help/highlight")
  (evil-leader/set-key "ha" 'apropos)
  (evil-leader/set-key "hf" 'counsel-describe-function)
  (evil-leader/set-key "hk" 'describe-key)
  (evil-leader/set-key "hv" 'counsel-describe-variable))

(provide 'init-docs)
