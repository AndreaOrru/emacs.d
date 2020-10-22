;; -*- lexical-binding: t -*-

(defun switch-to-alternate-buffer ()
  "Switch between the two most recently used buffers."
  (interactive)
  (switch-to-buffer (other-buffer)))

;; Key bindings.
(after 'init-evil
  (evil-leader/set-key "TAB" 'switch-to-alternate-buffer)

  (which-key/describe-prefix "b" "buffers")
  (evil-leader/set-key "bb" 'ivy-switch-buffer)
  (evil-leader/set-key "bd" 'kill-this-buffer)
  (evil-leader/set-key "bk" 'kill-this-buffer))

(provide 'init-buffers)
