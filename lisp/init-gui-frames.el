;;; init-gui-frames.el --- Interface appearance.

;;; Commentary:
;;;   Minimize the interface looks by disabling bars, startup screens, etc.

;;; Code:

; Disable toolbar and scrollbar:
(menu-bar-mode -1)
(if window-system (tool-bar-mode -1))
(if window-system (scroll-bar-mode -1))
; Set custom font (except on Mac):
(if (not (eq system-type 'darwin))
  (add-to-list 'default-frame-alist '(font . "Envy Code R-10")))
; Disable startup screen:
(setq inhibit-startup-screen t)

(provide 'init-gui-frames)
;;; init-gui-frames.el ends here
