;;; init-ivy.el --- Ivy, Counsel and Swiper mode.

;;; Commentary:
;;;   Initialize Ivy, Counsel and Swiper mode for completion/search/everything.

;;; Code:
(require 'require-package)
(require-package 'swiper)
(require-package 'counsel)

; Enable Ivy mode (almost everywhere):
(require 'ivy)
(ivy-mode 1)
(counsel-mode 1)
(diminish 'ivy-mode)
(diminish 'counsel-mode)

; Ivy for standard Emacs commands:
(global-set-key (kbd "C-s") 'swiper-use-region)
(global-set-key (kbd "C-x f") 'ivy-recentf)
(global-set-key (kbd "C-x 4 f") 'ivy-recentf-other-window)
; Ivy for shell and system tools:
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-c l") 'counsel-locate)
; Resume last Ivy completion:
(global-set-key (kbd "C-c C-r") 'ivy-resume)
; Save window layouts:
(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view)

(setq ivy-initial-inputs-alist nil)  ; No initial inputs in regex.
(setq ivy-use-virtual-buffers t)     ; Virtual buffers and recentf.

; Abbrievate /home/<user> with ~:
(ivy-set-display-transformer 'ivy-recentf 'abbreviate-file-name)
(ivy-set-display-transformer 'ivy-recentf-other-window 'abbreviate-file-name)
(ivy-set-display-transformer 'counsel-locate 'abbreviate-file-name)

; Use Smex to sort commands:
(require-package 'smex)
(defvar smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
(smex-initialize)

; Custom Ivy functions:
(require 'recentf)
(defun ivy-recentf-other-window ()
  "Find a file on `recentf-list' in another window."
  (interactive)
  (ivy-read "Recentf: " recentf-list
            :action 'find-file-other-window
            :caller 'ivy-recentf-other-window))

(defun swiper-use-region ()
  "Search for active region or input."
  (interactive)
  (if (region-active-p)
      (let ((selection (buffer-substring-no-properties
                        (region-beginning) (region-end))))
        (deactivate-mark)
        (swiper selection))
    (call-interactively 'swiper)))

(provide 'init-ivy)
;;; init-ivy.el ends here