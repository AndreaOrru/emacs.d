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

; Enable Company almost everywhere:
(setq company-global-modes '(not org-mode term-mode))
(global-company-mode 1)
(diminish 'company-mode)

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

(bind-keys :map company-mode-map
           ([tab]   . company-indent-or-complete-common)
           ("TAB"   . company-indent-or-complete-common)
           ("M-TAB" . company-try-hard)
           ("C-c /" . company-files))

(bind-keys :map company-active-map
           ([tab] . company-select-next-if-tooltip-visible-or-complete-selection)
           ("TAB" . company-select-next-if-tooltip-visible-or-complete-selection)
           ("M-h" . company-quickhelp-mode))

(provide 'init-company)
;;; init-company.el ends here
