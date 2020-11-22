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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yaml-mode web-mode treemacs swift-mode powerline org-plus-contrib org-gcal ob-swift ob-kotlin ob-go multiple-cursors multi-term minimap markdown-mode magit-popup magit kotlin-mode helm-projectile helm-ls-git helm-ag gradle-mode ghub fzf flycheck-clojure exec-path-from-shell emmet-mode doom-themes company auto-complete ac-js2))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
