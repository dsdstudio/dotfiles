(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

(setq dsdstudio/packages '(clojure-mode
               monokai-theme
               cider
               magit
               auto-complete
               company
               emmet-mode
               neotree
               helm
               helm-ls-git
               helm-ag
               ac-js2
               js2-mode
               web-mode
               flycheck
               markdown-mode))

(dolist (pkg dsdstudio/packages)
  (when (not (package-installed-p pkg))
    (package-install pkg)))

; 초기 설정
(add-hook 'after-init-hook
          (lambda () (load-theme 'monokai t) (global-linum-mode 1)))
(add-hook 'js2-mode-hook 'ac-js2-mode)
(add-hook 'js-mode-hook 'js2-minor-mode)

; 명령 모드일때 helm 자동완성의 지원을 받을수 있도록
(global-set-key (kbd "M-x") 'helm-M-x)

; git repository에서 fuzzy search 되도록 
(global-set-key (kbd "C-x f") 'helm-ls-git-ls)
; 버퍼 찾기시 helm의 buffer 찾기를 사용하도록
(global-set-key (kbd "C-x b") 'helm-buffers-list)

; tab size space 4
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

; web-mode 관련 설정
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ht[ml]\\'" . web-mode))

(setq web-mode-style-padding 0)
(setq web-mode-script-padding 0)

(setq helm-ff-transformer-show-only-basename nil
            helm-ls-git-show-abs-or-relative 'relative)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("561ba4316ba42fe75bc07a907647caa55fc883749ee4f8f280a29516525fc9e8" default)))
 '(helm-ag-base-command "/usr/local/bin/ag --nocolor --nogroup --ignore-case")
 '(helm-ag-command-option "--all-text")
 '(helm-ag-insert-at-point (quote symbol))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
