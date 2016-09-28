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

(setq ivy-initial-inputs-alist nil)  ; No initial inputs in regex.
(setq ivy-use-virtual-buffers t)     ; Virtual buffers and recentf.
; Ignore order of words while searching:
(setq ivy-re-builders-alist '((t . ivy--regex-ignore-order)))

; Abbrievate /home/<user> with ~:
(ivy-set-display-transformer 'ivy-recentf 'abbreviate-file-name)
(ivy-set-display-transformer 'ivy-recentf-other-window 'abbreviate-file-name)
(ivy-set-display-transformer 'counsel-locate 'abbreviate-file-name)

; Use Smex to sort commands:
(require-package 'smex)
(defvar smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
(smex-initialize)

; Use Dash to browse documentation:
(require-package 'counsel-dash)
(require 'counsel-dash)
(setq counsel-dash-docsets-path
      (expand-file-name "docsets" user-emacs-directory))

(bind-keys*
 ; Ivy for standard Emacs commands:
 ("C-s"     . swiper-use-region)
 ("C-x f"   . ivy-recentf)
 ("C-x 4 f" . ivy-recentf-other-window)
 ; Ivy for shell and system tools:
 ("C-c g"   . counsel-git)
 ("C-c k"   . counsel-git-grep-use-region)
 ("C-c C-k" . counsel-ag-use-region)
 ("C-c l"   . counsel-locate)
 ; Resume last Ivy completion:
 ("C-c C-r" . ivy-resume)
 ; Save window layouts:
 ("C-c v"   . ivy-push-view)
 ("C-c V"   . ivy-pop-view)
 ; Extra stuff:
 ("C-c i"   . counsel-imenu)             ; Semantic tags.
 ("C-c d"   . counsel-dash-use-region))  ; Dash docs.

; Define custom Ivy functions:
(require 'recentf)
(defun ivy-recentf-other-window ()
  "Find a file on `recentf-list' in another window."
  (interactive)
  (ivy-read "Recentf: " recentf-list
            :action 'find-file-other-window
            :caller 'ivy-recentf-other-window))

(defmacro defun-use-region (command &rest args)
  "Define a variant of COMMAND that accepts the region as input.

Additional arguments preceding the selection are specified in ARGS."
  `(defun ,(intern (concat (symbol-name command) "-use-region")) ()
     (interactive)
     (if (region-active-p)
         (let ((selection (buffer-substring-no-properties
                           (region-beginning) (region-end))))
           (deactivate-mark)
           (,command ,@args selection))
       (,command ,@args))))

(defun-use-region swiper)
(defun-use-region counsel-git-grep nil)
(defun-use-region counsel-ag)
(defun-use-region counsel-dash)

(provide 'init-ivy)
;;; init-ivy.el ends here
