(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) 
(package-initialize)
(package-refresh-contents)

(setq dsdstudio/packages
      '(org
        org-plus-contrib
        clojure-mode
        cider
        magit
        doom-themes
        auto-complete
        company
        emmet-mode
        neotree
        helm
        helm-projectile
        helm-ls-git
        helm-ag
        ac-js2
        js2-mode
        web-mode
        gradle-mode
        flycheck
        ob-go
        markdown-mode
        minimap))

(dolist (pkg dsdstudio/packages)
  (when (not (package-installed-p pkg))
    (package-install pkg)))

(require 'doom-themes)

(setq doom-enable-bold t    ; if nil, bolding are universally disabled
      doom-enable-italic t)  ; if nil, italics are universally disabled

(doom-themes-visual-bell-config)
(doom-themes-neotree-config)
;; 초기 설정
(add-hook 'after-init-hook
          (lambda () (load-theme 'doom-one t) (global-linum-mode 1)))
(add-hook 'js2-mode-hook 'ac-js2-mode)
(add-hook 'js-mode-hook 'js2-minor-mode)

;; org-babel 설정
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (C . t)
   (clojure . t)
   (shell . t)))
(setq org-todo-keywords
  '((sequence "할일" "진행중" "완료")))


;; 명령 모드일때 helm 자동완성의 지원을 받을수 있도록
(global-set-key (kbd "M-x") 'helm-M-x)

;; git repository에서 fuzzy search 되도록 
(global-set-key (kbd "C-x f") 'helm-ls-git-ls)
;; 버퍼 찾기시 helm의 buffer 찾기를 사용하도록
(global-set-key (kbd "C-x b") 'helm-buffers-list)

(require 'multiple-cursors)
;; multiple 커서 단축키 등록
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;; tab size space 4
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; web-mode 관련 설정
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ht[ml]\\'" . web-mode))

(setq web-mode-style-padding 0)
(setq web-mode-script-padding 0)

(setq helm-ff-transformer-show-only-basename nil
            helm-ls-git-show-abs-or-relative 'relative)
(setq helm-ag-base-command "/usr/local/bin/ag --nocolor --nogroup --ignore-case")
(put 'upcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yaml-mode xwidgete websocket web-server web-mode uuidgen solaire-mode sass-mode powerline org-plus-contrib org-blog ob-go ob-diagrams neotree multiple-cursors minimap markdown-mode magit jsx-mode indent-guide helm-projectile helm-ls-git helm-ag gradle-mode fzf flycheck face-remap+ emmet-mode doom-themes dockerfile-mode company color-theme-monokai cider auto-complete all-the-icons-dired ac-js2))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
