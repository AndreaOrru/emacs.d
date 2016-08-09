;;; init-frame.el --- Interface look and feel.

;;; Commentary:
;;;   Setup the interface appearence.

;;; Code:

; Start maximized:
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

; Disable toolbar, scrollbar and menu (but keep menu on Mac):
(if window-system (tool-bar-mode -1))
(if window-system (scroll-bar-mode -1))
(if (not (and window-system (eq system-type 'darwin)))
  (menu-bar-mode -1))

; Set custom fonts on Mac and on the other platforms:
(if (eq system-type 'darwin)
  (add-to-list 'default-frame-alist '(font . "Menlo-14"))
  (add-to-list 'default-frame-alist '(font . "Envy Code R-10")))

; Suppress GUI features:
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t)
; Disable fancy tooltips on Linux:
(if (boundp 'x-gtk-use-system-tooltips)
  (setq x-gtk-use-system-tooltips nil))

; Slower mouse scrolling:
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-scroll-amount
      '(             2
        ((shift)   . 1)
        ((control) . 7)))
; Smooth scrolling:
(require 'require-package)
(require-package 'smooth-scrolling)
(smooth-scrolling-mode 1)

(provide 'init-frame)
;;; init-frame.el ends here
