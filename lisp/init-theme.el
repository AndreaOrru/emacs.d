;;; init-theme.el --- Theme configuration.

;;; Commentary:
;;;   Install "Tomorrow" theme from MELPA and load it.

;;; Code:
(require 'require-package)

(require-package 'color-theme-sanityinc-tomorrow)
(load-theme 'sanityinc-tomorrow-night)

(provide 'init-theme)
;;; init-theme.el ends here
