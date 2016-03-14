;;; init-ido.el --- IDO mode initialization.

;;; Commentary:
;;;   Enable IDO whenever is possible.

;;; Code:
(require 'ido)

(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-matching t)

(provide 'init-ido)
;;; init-ido.el ends here
