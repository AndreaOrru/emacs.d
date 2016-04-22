;;; init-gdb.el --- Debugger.

;;; Commentary:
;;;   Configure the debugger interface.

;;; Code:
(require 'gdb-mi)

; Enable the full GDB interface:
(setq gdb-many-windows t)

(provide 'init-gdb)
;;; init-gdb.el ends here
