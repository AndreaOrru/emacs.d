;;; init-gui-frames.el --- Interface looks.

;;; Commentary:
;;;   Minimize the interface appearence and set a nice font.

;;; Code:

; Disable menus, startup screen, etc...
(menu-bar-mode -1)
(if window-system (tool-bar-mode -1))
(if window-system (scroll-bar-mode -1))
(setq inhibit-startup-screen t)

; Set custom fonts on Mac and on the other platforms:
(if (eq system-type 'darwin)
  (add-to-list 'default-frame-alist '(font . "Menlo-14"))
  (add-to-list 'default-frame-alist '(font . "Envy Code R-10")))

; Disable fancy tooltips on Linux:
(if (boundp 'x-gtk-use-system-tooltips)
  (setq x-gtk-use-system-tooltips nil))

(provide 'init-gui-frames)
;;; init-gui-frames.el ends here
