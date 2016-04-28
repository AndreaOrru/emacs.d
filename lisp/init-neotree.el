;;; init-neotree.el --- File tree plugin.

;;; Commentary:
;;;   Initialize Neotree with VC integration.

;;; Code:
(require 'require-package)
(require-package 'neotree)

(add-hook 'neotree-mode-hook '(lambda()
  (setq neo-theme 'arrow)                   ; Simple style.
  (setq neo-smart-open t)                   ; Open around current file.
  (setq neo-vc-integration '(face char))))  ; Git integration.

(global-set-key (kbd "C-c \\") 'neotree-toggle)

(provide 'init-neotree)
;;; init-neotree.el ends here
