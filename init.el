;;; init.el --- Emacs initialization.

;;; Commentary:
;;;   Bootstrap the configuration by loading all the modules.

;;; Code:

; Initialize package.el before everything else (required by Emacs 25):
(setq package-enable-at-startup nil)
(package-initialize)

; Add the "lisp/" directory to the load path:
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

; Set external customization file:
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file) (load custom-file))

; Load all configuration modules:
(require 'init-elpa)
(require 'init-exec-path)
(require 'init-frame)
(require 'init-theme)

(require 'init-editing)
(require 'init-misc)
(require 'init-multiple-cursors)

(require 'init-company)
(require 'init-dired)
(require 'init-git)
(require 'init-ivy)
(require 'init-neotree)
(require 'init-term)

(require 'init-cc)
(require 'init-lisp)
(require 'init-nim)
(require 'init-javascript)
(require 'init-php)
(require 'init-python)
(require 'init-web-mode)

(require 'init-flycheck)
(require 'init-gdb)
(require 'init-semantic)

(provide 'init)
;;; init.el ends here
