;;; init-python-mode.el --- Python mode.

;;; Commentary:
;;;   Initialize Jedi for autocompletion.

;;; Code:
(require 'require-package)
(require-package 'jedi)

(add-hook 'python-mode-hook 'jedi:setup)

(provide 'init-python-mode)
;;; init-python-mode.el ends here
