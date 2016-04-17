;;; init-cc.el --- C/C++ mode.

;;; Commentary:
;;;   Initialize C/C++ preferences.

;;; Code:

; Style preferences:
(add-hook 'c-mode-common-hook '(lambda()
  (c-set-style "ellemtel")         ; C++ coding standard.
  (setq c-basic-offset 4)          ; Indent with 4 spaces.
  (c-set-offset 'innamespace 0)    ; Don't indent namespaces.
  (c-set-offset 'access-label '/)  ; Half-indent access labels.

  ; Don't aggressive indent before finishing writing the instruction:
  (add-to-list 'aggressive-indent-dont-indent-if
               '(null (string-match "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
                                    (thing-at-point 'line))))))

(provide 'init-cc)
;;; init-cc.el ends here
