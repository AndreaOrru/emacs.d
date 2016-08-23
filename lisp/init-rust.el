;;; init-rust.el --- Rust mode.

;;; Commentary:
;;;   Support for the Rust programming language.

;;; Code:
(require 'require-package)
(require-package 'rust-mode)
(require-package 'racer)
(require-package 'cargo)

; Autocompletion:
(add-hook 'rust-mode-hook 'racer-mode)
; Cargo support:
(require 'cargo)
(add-hook 'rust-mode-hook 'cargo-minor-mode)
(diminish 'cargo-minor-mode)

; Better Flycheck support:
(require-package 'flycheck-rust)
(add-hook 'flycheck-mode-hook 'flycheck-rust-setup)

; Dash documentation:
(add-hook 'python-mode-hook '(lambda()
  (setq-local counsel-dash-docsets '("Rust"))))

(provide 'init-rust)
;;; init-rust.el ends here
