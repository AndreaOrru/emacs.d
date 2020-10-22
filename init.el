;; -*- lexical-binding: t -*-

;; Initialize the core functionalities.
(load (expand-file-name "core" user-emacs-directory))
(defvar config-directory (expand-file-name "config" user-emacs-directory))
(defvar vendor-directory (expand-file-name "vendor" user-emacs-directory))

;; Load config files.
(cl-loop for file in (directory-files-recursively config-directory "\\.el$")
         do (load file))
;; Load vendor files.
(cl-loop for file in (directory-files-recursively vendor-directory "\\.el$")
         do (load file))

;; Save customized variables in a separate file.
(setq custom-file (no-littering-expand-etc-file-name "custom.el"))
(when (file-exists-p custom-file) (load custom-file))

(provide 'init)
