(require 'package)

; Add MELPA repository to the package sources:
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
; Initialize Package but don't load packages by default:
(setq package-enable-at-startup nil)
(package-initialize)

; On-demand installation of packages:
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (if (boundp 'package-selected-packages)
            ;; Record this as a package the user installed explicitly
            (package-install package nil)
          (package-install package))
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(provide 'init-elpa)