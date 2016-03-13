; Add the "lisp/" directory to the load path:
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

; Set external customization file:
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file) (load custom-file))

; Load all configuration modules:
(require 'init-elpa)
(require 'init-themes)
(require 'init-gui-frames)