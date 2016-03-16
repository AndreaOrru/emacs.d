;;; init-cc.el --- C/C++ mode.

;;; Commentary:
;;;   Initialize C/C++ preferences and keybindings.

;;; Code:

; Style preferences:
(add-hook 'c-mode-common-hook '(lambda()
  (c-set-style "ellemtel")           ; C++ coding standard.
  (setq c-basic-offset 4)            ; Indent with 4 spaces.
  (c-set-offset 'innamespace 0)      ; Don't indent namespaces.
  (c-set-offset 'access-label '/)))  ; Half-indent access labels.

(provide 'init-cc)
;;; init-cc.el ends here
