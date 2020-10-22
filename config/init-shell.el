;; -*- lexical-binding: t -*-

;; Launch inferior shells on a lightweight shell.
(setq shell-file-name "/bin/sh")

(after 'eshell
  ;; Custom prompt.
  (setq eshell-prompt-regexp "^[^#\nλ]*[#λ] ")
  (setq eshell-prompt-function
        #'(lambda ()
            (concat
             (propertize (abbreviate-file-name (eshell/pwd)) 'face `(:foreground ,(doom-color 'cyan)))
             (propertize " λ" 'face `(:foreground ,(doom-color 'red) :weight bold))
             (propertize " " 'face nil))))

  ;; Eshell aliases.
  (defun eshell/d () (dired-other-window "."))
  (defalias 'eshell/e 'find-file-other-window)
  (defalias 'eshell/s 'magit-status)
  (defalias 'eshell/x 'eshell/exit)

  ;; Use Emacs key bindings inside Eshell.
  (evil-set-initial-state 'eshell-mode 'emacs)
  (evil-define-key 'emacs eshell-mode-map (kbd "C-c") 'eshell-interrupt-process))

;; Pop an Eshell at the bottom of the frame.
(require-package 'shell-pop)
(setq shell-pop-full-span t
      shell-pop-shell-type '("eshell" "*eshell" #'(lambda () (eshell))))
(global-set-key (kbd "M-x") 'shell-pop)

;; Tmux integration.
(require-package 'tmux-pane)
(after 'evil-leader
  (if (display-graphic-p)
      (evil-leader/set-key "RET" 'shell-pop)
    (require 'tmux-pane)
    (evil-leader/set-key "RET" 'tmux-pane-toggle-horizontal)))

(provide 'init-shell)
