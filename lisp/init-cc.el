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
  (abbrev-mode -1)                 ; Disable Abbrev mode.
  (c-set-style "ellemtel")         ; C++ coding standard.
  (setq c-basic-offset 4)          ; Indent with 4 spaces.
  (c-set-offset 'innamespace 0)    ; Don't indent namespaces.
  (c-set-offset 'access-label '/)  ; Half-indent access labels.
  ; Enable Irony only for supported modes:
  (when (memq major-mode irony-supported-major-modes)
    (irony-mode 1))))

; Autoload compilation options:
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

; Company autocompletion through Irony:
(require 'company)
(require-package 'company-irony)
(require-package 'company-irony-c-headers)
(add-to-list 'company-backends '(company-irony-c-headers company-irony))

; Syntax checking through Irony:
(require 'flycheck)
(require-package 'flycheck-irony)
(add-hook 'flycheck-mode-hook 'flycheck-irony-setup)
; Chain cppcheck:
(require 'flycheck-irony)
(flycheck-add-next-checker 'irony '(warning . c/c++-cppcheck))
; Disable clang/gcc checkers:
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(c/c++-clang c/c++-gcc)))

(provide 'init-cc)
;;; init-cc.el ends here
