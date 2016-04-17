;;; init-term.el --- Configure terminal emulation.

;;; Commentary:
;;;   Set up sane defaults for terminal emulation inside Emacs.

;;; Code:
(defadvice ansi-term (before my/ansi-term activate)
  "Force default shell in terminal."
  (interactive (list shell-file-name)))

(defadvice term-sentinel (around my/term-sentinel (proc msg) activate)
  "Close buffers that contain exited terminals."
  (if (memq (process-status proc) '(signal exit))
      (let ((buffer (process-buffer proc)))
        ad-do-it
        (kill-buffer buffer))
    ad-do-it))

; Keybinding to start a terminal:
(global-set-key (kbd "C-c RET") 'ansi-term)

(provide 'init-term)
;;; init-term.el ends here
