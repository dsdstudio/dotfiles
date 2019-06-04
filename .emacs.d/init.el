(require 'package)
(package-initialize)

(require 'org)
(find-file (concat user-emacs-directory "init.org"))
;; tangle it
(org-babel-tangle)
;; load it
(load-file (concat user-emacs-directory "init-main.el"))
;; finally byte-compile it
(byte-compile-file (concat user-emacs-directory "init-main.el"))
(kill-buffer)
