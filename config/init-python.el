;; -*- lexical-binding: t -*-

;; Automatically enable the project's virtualenv (as early as possible).
(require-package 'auto-virtualenvwrapper)
(add-hook 'python-mode-hook 'auto-virtualenvwrapper-activate -99)

;; Enable Microsoft Python Language Server.
(add-hook 'python-mode-hook 'lsp)
(require-package 'lsp-python-ms)
(after 'lsp-python-ms
  (setq lsp-python-ms-executable "~/bin/Microsoft.Python.LanguageServer"))

;; Enable Black for automatic formatting after saving.
(require-package 'blacken)
(add-hook 'python-mode-hook 'blacken-mode)
(after 'blacken
  (setq blacken-fast-unsafe t))
;; Enable isort for automatic import sorting after save.
(require-package 'py-isort)

;; Enable Flycheck syntax checking for Python.
(add-hook 'python-mode-hook
          #'(lambda ()
              (add-hook 'before-save-hook 'py-isort-before-save t t)
              (flycheck-select-checker 'python-flake8)
              (flycheck-add-next-checker 'python-flake8 'python-pycompile))
          98)

;; Enable Python 3 documentation through Dash.
(after 'init-docs
  (add-hook 'python-mode-hook
            #'(lambda () (setq-local counsel-dash-docsets '("Python 3")))))

;; Show Python test coverage through Flycheck.
(after 'init-vendor
  (require-package 'xml+)
  (ensure-lib-from-url
   'python-coverage
   (concat
    "https://raw.githubusercontent.com/AndreaOrru/emacs-python-coverage/"
    "master/python-coverage.el"))
  (add-hook 'python-mode-hook
            #'(lambda ()
                (define-key lsp-command-map (kbd "c") 'python-coverage-mode))
            99))

(provide 'init-python)
