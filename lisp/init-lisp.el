;;; init-lisp.el --- Emacs Lisp configuration.

;;; Commentary:
;;;   Set initial message and discard old bytecode files.

;;; Code:
(setq-default initial-scratch-message ";; Close the world, txEn eht nepO\n\n")
(setq load-prefer-newer t)  ; Prefer newer .el files.

(provide 'init-lisp)
;;; init-lisp.el ends here
