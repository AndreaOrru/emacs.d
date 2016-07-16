;;; init-python.el --- Python mode.

;;; Commentary:
;;;   Initialize Jedi for autocompletion.

;;; Code:
(require 'require-package)

; SCons files are Python:
(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
                ("SConscript\\'" . python-mode))
              auto-mode-alist))

; Install Jedi:
(require-package 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)

; Install Jedi Server if not present:
(require 'python-environment)
(when (not (file-exists-p (expand-file-name "bin/jediepcserver"
                          (expand-file-name python-environment-default-root-name
                                            python-environment-directory))))
  (jedi:install-server))

(provide 'init-python)
;;; init-python.el ends here
