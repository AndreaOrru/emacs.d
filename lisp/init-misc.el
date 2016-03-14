;;; init-misc.el --- Miscellaneous.

;;; Commentary:
;;;   Small adjustments to various things.

;;; Code:
(require 'apropos)

(fset 'yes-or-no-p 'y-or-n-p)         ; Y/N instead of yes/no.
(setq apropos-do-all t)               ; Show more informations.
(setq disabled-command-function nil)  ; Enable all functions.

(provide 'init-misc)
;;; init-misc.el ends here
