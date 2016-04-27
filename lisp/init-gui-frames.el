;;; init-gui-frames.el --- Interface look and feel.

;;; Commentary:
;;;   Setup the interface appearence.

;;; Code:
(require 'require-package)

(setq inhibit-startup-screen t)
(if window-system (tool-bar-mode -1))
(if window-system (scroll-bar-mode -1))
; Disable menus everywhere but on Mac's graphical mode:
(if (not (and window-system (eq system-type 'darwin)))
  (menu-bar-mode -1))

; Set custom fonts on Mac and on the other platforms:
(if (eq system-type 'darwin)
  (add-to-list 'default-frame-alist '(font . "Menlo-14"))
  (add-to-list 'default-frame-alist '(font . "Envy Code R-10")))

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
(require-package 'smooth-scrolling)
(smooth-scrolling-mode 1)

(provide 'init-gui-frames)
;;; init-gui-frames.el ends here
