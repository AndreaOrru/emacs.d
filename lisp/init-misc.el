;;; init-misc.el --- Miscellaneous.

;;; Commentary:
;;;   Small adjustments to various things.

;;; Code:
(require 'require-package)
(require-package 'diminish)
(require 'apropos)

(setq ring-bell-function 'ignore)     ; No alarm bell.
(fset 'yes-or-no-p 'y-or-n-p)         ; Y/N instead of yes/no.
(setq apropos-do-all t)               ; Show more informations.
(setq disabled-command-function nil)  ; Enable all functions.

(winner-mode 1)                 ; Windows layout history.
(windmove-default-keybindings)  ; Navigate windows with S-arrows.

; Don't show some minor modes:
;(diminish 'abbrev-mode)

(provide 'init-misc)
;;; init-misc.el ends here
