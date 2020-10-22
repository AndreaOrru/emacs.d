;; -*- lexical-binding: t -*-

(defun delete-this-file ()
  "Delete the current file, and kill the buffer."
  (interactive)
  (unless (buffer-file-name)
    (error "No file is currently being edited"))
  (when (yes-or-no-p (format "Really delete '%s'?"
                             (file-name-nondirectory buffer-file-name)))
    (delete-file (buffer-file-name))
    (kill-this-buffer)))

(defun rename-this-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (unless filename
      (error "Buffer '%s' is not visiting a file!" name))
    (progn
      (when (file-exists-p filename)
        (rename-file filename new-name 1))
      (set-visited-file-name new-name)
      (rename-buffer new-name))))

;; Enable recentf mode.
(require 'recentf)
(add-hook 'after-init-hook 'recentf-mode)
(setq-default recentf-max-saved-items 1000)
;; Abbreviate recent filenames (i.e. $HOME -> ~).
(add-to-list 'recentf-filename-handlers 'abbreviate-file-name)

;; Key bindings.
(after 'init-evil
  (which-key/describe-prefix "f" "files/focus")
  (evil-leader/set-key "fe" 'find-file)
  (evil-leader/set-key "fr" 'counsel-recentf)
  (evil-leader/set-key "fD" 'delete-this-file)
  (evil-leader/set-key "fR" 'rename-this-file-and-buffer))

(provide 'init-files)
