;; -*- lexical-binding: t -*-

;; Enable Ivy mode.
(require-package 'counsel)
(add-hook 'after-init-hook 'ivy-mode)

;; Use Ivy Rich to provide a friendlier Ivy interface.
(require-package 'ivy-rich)
(add-hook 'after-init-hook 'ivy-rich-mode)
(after 'ivy-rich
  (setq ivy-rich-path-style 'abbrev)
  (setcdr (assq t ivy-format-functions-alist) 'ivy-format-function-line))
;; Use icons in Ivy Rich in graphic mode.
(require-package 'all-the-icons-ivy-rich)
(when (display-graphic-p)
  (add-hook 'after-init-hook 'all-the-icons-ivy-rich-mode))

;; Extra functionalities.
(require-package 'ivy-hydra)       ;; Ivy action selection.
(require-package 'ivy-posframe)    ;; Show Ivy in sub-frames.
(require-package 'ivy-prescient)   ;; Order results by frequency.
(require-package 'wgrep)           ;; Edit search results.

(after 'counsel
  (setq-default ivy-initial-inputs-alist nil)  ;; No ^ in Ivy regex by default.
  (ivy-prescient-mode 1)                       ;; Order results by frequency.
  ;; Separate items in kill ring.
  (setq-default counsel-yank-pop-separator "\n\n"))

(after 'ivy
  ;; Bigger Ivy minibuffer with fixed size.
  (setq-default
   ivy-height 15
   ivy-fixed-height-minibuffer t)
  ;; Show Ivy in sub-frames.
  (ivy-posframe-mode 1)

  ;; Search by filtering.
  (global-set-key (kbd "C-s") 'swiper)
  ;; VIM-like keybindings inside Ivy minibuffer.
  (define-key ivy-minibuffer-map (kbd "C-j") 'ivy-next-line)
  (define-key ivy-minibuffer-map (kbd "C-k") 'ivy-previous-line)
  (define-key ivy-switch-buffer-map (kbd "C-k") 'ivy-previous-line))

;; Display Ivy at point for Company completion filtering.
(after 'ivy-posframe
  (setq ivy-posframe-display-functions-alist
        '((counsel-company . ivy-posframe-display-at-point)
          (t . nil))))

;; Use Ivy for Xref filtering.
(require-package 'ivy-xref)
(setq xref-show-definitions-function 'ivy-xref-show-defs)

;; Key bindings.
(after 'init-evil
  (evil-leader/set-key "SPC" 'counsel-M-x)
  (evil-leader/set-key "/" 'counsel-rg)
  (evil-leader/set-key "r" 'ivy-resume)
  (evil-leader/set-key "P" 'counsel-yank-pop)

  (evil-global-set-key 'normal ",." 'counsel-semantic-or-imenu))

(provide 'init-ivy)
