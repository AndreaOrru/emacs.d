;;; init-python.el --- Python mode.

;;; Commentary:
;;;   SCons support and company completion through Anaconda.

;;; Code:

; Use Python 3 by default:
(require 'python)
(setq python-shell-interpreter "python3")
(setq python-shell-completion-native-enable nil)

; SCons files are Python:
(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
                ("SConscript\\'" . python-mode))
              auto-mode-alist))

; Enable Anaconda mode:
(require 'require-package)
(require-package 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

; Enable autocompletion through company and Anaconda:
(require 'company)
(require-package 'company-anaconda)
(add-to-list 'company-backends 'company-anaconda)
; Align company annotations to the right:
(add-hook 'python-mode-hook (lambda()
  (set (make-local-variable 'company-tooltip-align-annotations) t)))

(provide 'init-python)
;;; init-python.el ends here
