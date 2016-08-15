;;; init-python.el --- Python mode.

;;; Commentary:
;;;   SCons support, and Jedi for autocompletion.

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

(require 'require-package)
(require-package 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

(require 'company)
(require-package 'company-anaconda)
(add-to-list 'company-backends 'company-anaconda)

; Install Jedi:
;(require-package 'jedi)
;(add-hook 'python-mode-hook 'jedi:setup)

; Install Jedi Server if not present:
;(require 'python-environment)
;(when (not (file-exists-p (expand-file-name "bin/jediepcserver"
;                          (expand-file-name python-environment-default-root-name
;                                            python-environment-directory))))
;  (jedi:install-server))

(provide 'init-python)
;;; init-python.el ends here
