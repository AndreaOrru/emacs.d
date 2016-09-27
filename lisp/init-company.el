;;; init-company.el --- Auto completion.

;;; Commentary:
;;;   Enable auto completion through Company mode.

;;; Code:
(require 'require-package)
(require-package 'company)
(require-package 'company-quickhelp)
(require-package 'company-try-hard)
(require 'company)
(require 'company-dabbrev)

(setq company-global-modes '(not org-mode))
(global-company-mode 1)
(diminish 'company-mode)

(define-key company-mode-map [tab] 'company-indent-or-complete-common)
(define-key company-mode-map (kbd "TAB") 'company-indent-or-complete-common)
(define-key company-mode-map (kbd "M-TAB") 'company-try-hard)
(define-key company-mode-map (kbd "C-c /") 'company-files)

(define-key company-active-map [tab] 'company-select-next-if-tooltip-visible-or-complete-selection)
(define-key company-active-map (kbd "TAB") 'company-select-next-if-tooltip-visible-or-complete-selection)
(define-key company-active-map (kbd "M-h") 'company-quickhelp-mode)

; Search through candidates more flexibly:
(setq company-search-regexp-function 'company-search-words-in-any-order-regexp)
(setq company-show-numbers t)              ; Show numbers for fast selection.
(setq company-idle-delay 0.3)              ; Faster autocompletion.
(setq company-selection-wrap-around t)     ; Cycle candidates.
(setq-default company-search-filtering t)  ; Filter when searching.
; No duplicate entries:
(setq company-dabbrev-downcase nil)
(setq company-dabbrev-ignore-case nil)

; Sort by frequence:
(require-package 'company-statistics)
(company-statistics-mode 1)

; Highlight annotation when selected:
(set-face-background 'company-tooltip-annotation-selection
                     (face-background 'company-tooltip-selection))
; Adjust search face when selected:
(set-face-foreground 'company-tooltip-search-selection
                     (face-foreground 'company-tooltip-search))

(provide 'init-company)
;;; init-company.el ends here
