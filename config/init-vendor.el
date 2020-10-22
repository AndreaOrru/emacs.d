;; -*- lexical-binding: t -*-

;; Taken from Purcell's site-lisp configuration.

;; Utility functions.
(defun vendor-dir-for (name)
  (expand-file-name (symbol-name name) vendor-directory))

(defun vendor-library-el-path (name)
  (expand-file-name (format "%s.el" name) (vendor-dir-for name)))

(defun vendor-library-loadable-p (name)
  (file-exists-p (vendor-library-el-path name)))

(defun download-vendor-module (name url)
  (let ((dir (vendor-dir-for name)))
    (message "Downloading %s from %s" name url)
    (unless (file-directory-p dir)
      (make-directory dir t))
    (let ((el-file (vendor-library-el-path name)))
      (url-copy-file url el-file t nil)
      el-file)))

(defun ensure-lib-from-url (name url)
  (unless (vendor-library-loadable-p name)
    (byte-compile-file (download-vendor-module name url))))

(provide 'init-vendor)
