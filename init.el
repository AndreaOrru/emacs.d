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
(require 'init-themes)
(require 'init-gui-frames)
(require 'init-dired)
(require 'init-flycheck)

(require 'init-swiper)
(require 'init-auto-complete)
(require 'init-windows)
(require 'init-editing-utils)
(require 'init-multiple-cursors)
(require 'init-git)

(require 'init-cc)
(require 'init-nim)
(require 'init-web-mode)
(require 'init-javascript)
(require 'init-python)
(require 'init-php)
(require 'init-lisp)

(require 'init-term)
(require 'init-semantic)
(require 'init-misc)
(require 'init-neotree)
(require 'init-gdb)

(provide 'init)
;;; init.el ends here
