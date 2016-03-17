;;; init.el --- Emacs initialization.

;;; Commentary:
;;;   Bootstrap the configuration by loading all the modules.

;;; Code:

; Add the "lisp/" directory to the load path:
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

; Set external customization file:
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file) (load custom-file))

; Load all configuration modules:
(require 'init-elpa)
(require 'init-themes)
(require 'init-gui-frames)
(require 'init-flycheck)
(require 'init-ido)
(require 'init-auto-complete)
(require 'init-editing-utils)

(require 'init-cc)
(require 'init-web-mode)
(require 'init-python-mode)
(require 'init-php)
(require 'init-lisp)

(require 'init-semantic)
(require 'init-misc)

(provide 'init)
;;; init.el ends here
