(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(setq dsdstudio/packages '(clojure-mode
			   monokai-theme
			   cider
			   magit
			   auto-complete
			   company
			   emmet-mode
			   neotree
			   markdown-mode))

(dolist (pkg dsdstudio/packages)
  (when (not (package-installed-p pkg))
    (package-install pkg)))

(add-hook 'after-init-hook
	  (lambda () (load-theme 'monokai t) (global-linum-mode 1)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("561ba4316ba42fe75bc07a907647caa55fc883749ee4f8f280a29516525fc9e8" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
