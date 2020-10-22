;; -*- lexical-binding: t -*-

(setq initial-major-mode 'emacs-lisp-mode)
(setq initial-scratch-message
      (concat ";; You can be like the common people\n"
              ";;   Or you can gather the effort\n"
              ";;      To rise above them all\n"
              ";;\n"
              ";;                 - Hafez Shirazi -\n\n"))

(require-package 'auto-package-update)  ;; Utility to update packages.
(setq disabled-command-function nil)    ;; Enable all functions.
(require-package 'pkgbuild-mode)        ;; Support Arch Linux's PKGBUILDs.

;; Re-center the screen and make the line pulse after jumping to definition.
(after 'imenu
  (add-to-list 'imenu-after-jump-hook
               #'(lambda () (pulse-momentary-highlight-one-line (point))))
  (add-to-list 'imenu-after-jump-hook 'recenter))

;; Persist prescient data.
(after 'prescient
  (prescient-persist-mode 1))

;; Make clipboard work in TTY Emacs.
(require-package 'clipetty)
(unless (display-graphic-p)
  (add-hook 'after-init-hook 'global-clipetty-mode))

;; Use avy for quick navigation.
(require-package 'avy)
(after 'evil
  (setq avy-timeout-seconds 0.35)
  (evil-define-key '(normal motion) global-map "s" 'avy-goto-char-timer))

;; Google search integration.
(require-package 'google-this)
(after 'init-evil
  (which-key/describe-prefix "s" "search/selection")
  (evil-leader/set-key "sg" 'google-this-noconfirm)
  (evil-leader/set-key "sG" 'google-this-search))

;; Pastebin integration.
(require-package 'webpaste)
(after 'init-evil
  (setq webpaste-paste-confirmation t)
  (evil-leader/set-key "sp" 'webpaste-paste-region))

(provide 'init-misc)
