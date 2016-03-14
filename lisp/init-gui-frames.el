;;; init-gui-frames.el --- Interface appearance.

;;; Commentary:
;;;   Minimize the interface looks by disabling bars, startup screens, etc.

;;; Code:

; Disable toolbar and scrollbar:
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'set-scroll-bar-mode) (set-scroll-bar-mode nil))
; Disable startup screen:
(setq inhibit-startup-screen t)

(provide 'init-gui-frames)
;;; init-gui-frames.el ends here
