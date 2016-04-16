;;; init-swiper.el --- Swiper and Ivy mode.
;;; Commentary:
;;;   Initialize Swiper and Ivy mode for completion/search.

;;; Code:
(require 'require-package)
(require-package 'swiper)

(require 'ivy)
(ivy-mode 1)  ; Enable Ivy mode (almost everywhere).

; Ivy for standard commands:
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
; Ivy for shell and system tools:
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-c l") 'counsel-locate)
; Resume last Ivy completion:
(global-set-key (kbd "C-c C-r") 'ivy-resume)

; No initial inputs in regex:
(setq ivy-initial-inputs-alist ())

; Use Smex to sort commands:
(require-package 'smex)
(defvar smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
(smex-initialize)

(provide 'init-swiper)
;;; init-swiper.el ends here
