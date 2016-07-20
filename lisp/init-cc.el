;;; init-cc.el --- C/C++ mode.

;;; Commentary:
;;;   Initialize C/C++ preferences and Irony mode.

;;; Code:
(require 'require-package)
(require-package 'irony)
(require 'irony)

; Compile Irony server if needed:
(unless (irony--locate-server-executable)
  (call-interactively 'irony-install-server))

; Common preferences:
(add-hook 'c-mode-common-hook '(lambda()
  ; Enable Irony only for supported modes:
  (when (memq major-mode irony-supported-major-modes)
    (irony-mode 1))
  (abbrev-mode -1)                   ; Disable Abbrev mode.
  (c-set-style "ellemtel")           ; C++ coding standard.
  (setq c-basic-offset 4)            ; Indent with 4 spaces.
  (c-set-offset 'innamespace 0)      ; Don't indent namespaces.
  (c-set-offset 'access-label '/)))  ; Half-indent access labels.

(diminish 'irony-mode)

(provide 'init-cc)
;;; init-cc.el ends here
