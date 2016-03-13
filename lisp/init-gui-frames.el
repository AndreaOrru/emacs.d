; Disable startup screen:
(setq inhibit-startup-screen t)
; Disable toolbar and scrollbar:
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'set-scroll-bar-mode) (set-scroll-bar-mode nil))

(provide 'init-gui-frames)