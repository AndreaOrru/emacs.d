;;; init-lisp.el --- Emacs Lisp configuration.

;;; Commentary:
;;;   Set initial message and discard old bytecode files.

;;; Code:
(setq-default initial-scratch-message ";; Close the world, txEn eht nepO\n\n")
(setq load-prefer-newer t)  ; Prefer newer .el files.

; Emacs Lisp indentation can sometimes be quite annoying:
(require 'aggressive-indent)
(add-to-list 'aggressive-indent-excluded-modes 'emacs-lisp-mode)

(provide 'init-lisp)
;;; init-lisp.el ends here
