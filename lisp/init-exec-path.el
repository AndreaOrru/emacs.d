;;; init-exec-path.el --- Set up $PATH.

;;; Commentary:
;;;   Make Emacs use the $PATH set up by the user's shell.

;;; Code:
(require 'require-package)
(require-package 'exec-path-from-shell)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(provide 'init-exec-path)
;;; init-exec-path.el ends here
