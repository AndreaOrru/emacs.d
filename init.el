;;; init.el --- Emacs initialization.

;;; Commentary:
;;;   Bootstrap the configuration by loading all the modules.

;;; Code:

; Initialize package.el before everything else (required by Emacs 25):
(setq package-enable-at-startup nil)
(package-initialize)

(setq load-prefer-newer t)  ; Prefer newer .el files.
; Add the "lisp/" directory to the load path:
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

; Set external customization file:
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file) (load custom-file))

; Load all configuration modules:
(require 'init-elpa)
(require 'init-exec-path)
(require 'init-frame)
(require 'init-misc)
(require 'init-theme)

(require 'init-editing)
(require 'init-multiple-cursors)

(require 'init-company)
(require 'init-flycheck)
(require 'init-ivy)

(require 'init-cc)
(require 'init-javascript)
(require 'init-markdown)
(require 'init-org)
(require 'init-php)
(require 'init-python)
(require 'init-rust)
(require 'init-web-mode)

(require 'init-dired)
(require 'init-gdb)
(require 'init-git)
(require 'init-neotree)
(require 'init-semantic)
(require 'init-term)

(provide 'init)
;;; init.el ends here
