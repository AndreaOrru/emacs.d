;;; init-themes.el --- Theme configuration.

;;; Commentary:
;;;   Install "Tomorrow" theme from MELPA and load it.

;;; Code:
(require 'require-package)

; Set custom font (except on Mac):
(if (not (eq system-type 'darwin))
  (add-to-list 'default-frame-alist '(font . "Envy Code R-10")))

; Set theme:
(require-package 'color-theme-sanityinc-tomorrow)
(load-theme 'sanityinc-tomorrow-night)

; Disable fancy tooltips on Linux:
(setq x-gtk-use-system-tooltips nil)

(provide 'init-themes)
;;; init-themes.el ends here
