;; -*- lexical-binding: t -*-

;; Performance fixes.
(setq gc-cons-threshold (* 128 1024 1024))      ;; GC threshold = 128 MB.
(setq read-process-output-max (* 4 1024 1024))  ;; Process output = 4 MB.

;; Setup MELPA repository and load packages.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Core macros from bling/dotemacs.
(defun require-package (package)
  "Ensures that PACKAGE is installed."
  (unless (or (package-installed-p package)
              (require package nil 'noerror))
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

(defmacro after (feature &rest body)
  "Executes BODY after FEATURE has been loaded.

FEATURE may be any one of:
    'evil            => (with-eval-after-load 'evil BODY)
    \"evil-autoloads\" => (with-eval-after-load \"evil-autolaods\" BODY)
    [evil cider]     => (with-eval-after-load 'evil
                          (with-eval-after-load 'cider
                            BODY))
"
  (declare (indent 1))
  (cond
   ((vectorp feature)
    (let ((prog (macroexp-progn body)))
      (cl-loop for f across feature
               do
               (progn
                 (setq prog (append `(',f) `(,prog)))
                 (setq prog (append '(with-eval-after-load) prog))))
      prog))
   (t
    `(with-eval-after-load ,feature ,@body))))

;; Keep the ~/.emacs.d directory clean.
(require-package 'no-littering)
(require 'no-littering)

(provide 'core)
