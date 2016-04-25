;;; init-web-mode.el --- Web template editing.

;;; Commentary:
;;;   Associate web mode to HTML/CSS/JS and Blade templates.

;;; Code:
(require 'require-package)
(require-package 'web-mode)

; File extension associations:
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.s?css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'"  . web-mode))
(add-to-list 'auto-mode-alist '("\\.blade\\." . web-mode))

; Define content types associations:
(defvar web-mode-engines-alist '(("blade" . "\\.blade\\.")))
(defvar web-mode-content-types-alist '(("jsx" . "\\.jsx?\\'")))

; Mode preferences:
(add-hook 'web-mode-hook '(lambda()
  ; Fast switch to js2-jsx-mode:
  (local-set-key (kbd "C-c m") 'js2-jsx-mode)
  ; Indentation offsets:
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  ; Highlight current HTML tag with a red-ish color:
  (setq web-mode-enable-current-element-highlight t)
  (set-face-background 'web-mode-current-element-highlight-face nil)
  (set-face-foreground 'web-mode-current-element-highlight-face "#cc6666")))

; Disable aggressive indent for web mode:
(require 'aggressive-indent)
(add-to-list 'aggressive-indent-excluded-modes 'web-mode)

(provide 'init-web-mode)
;;; init-web-mode ends here
