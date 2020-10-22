;; -*- lexical-binding: t -*-

(require-package 'rustic)
(after 'rustic
  (setq rustic-lsp-server 'rust-analyzer)
  (setq rustic-format-display-method 'ignore)
  (setq rustic-format-on-save t)
  (setq lsp-rust-analyzer-cargo-watch-command "clippy"))

(after 'init-docs
  (add-hook 'rustic-mode-hook
            #'(lambda () (setq-local counsel-dash-docsets '("Rust")))))

(provide 'init-rust)
