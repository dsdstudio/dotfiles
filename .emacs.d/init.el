(require 'package)
(unless (assoc-default "melpa" package-archives)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t))
(unless (assoc-default "org" package-archives)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t))
(package-initialize)

(setq user-full-name "Bohyung Kim"
      user-mail-address "bohyungkim@me.com")

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
		swift-mode
        markdown-mode
        exec-path-from-shell
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
;; 환경변수 PATH같은것.. emacs에서 인식할수 있도록. 이설정을 해야 외부프로그램을 인식할수 있다.
;; 예) fzf, the silver sercher(ag)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
;; org-babel 설정
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (kotlin . t)
   (C . t)
   (clojure . t)
   (shell . t)))
(setq org-todo-keywords
  '((sequence "할일" "진행중" "완료")))

;; clojure cider 관련 설정
(global-company-mode)
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)


(global-set-key (kbd "M-TAB") #'company-complete)

;; 퍼지 자동완성 설정
(add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
(add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)

;; 명령 모드일때 helm 자동완성의 지원을 받을수 있도록
(global-set-key (kbd "M-x") 'helm-M-x)

;; git repository에서 fuzzy search 되도록 
(global-set-key (kbd "C-x f") 'fzf-git)
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
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-extra-snippets
      '(("erb" . (("errender" . "<%= | %>")))))

;; emmet-mode 설정. webmode가 켜지면 emmet-mode도 같이 적용되도록 ..
(require 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)

(setq web-mode-style-padding 0)
(setq web-mode-script-padding 0)

(setq helm-ff-transformer-show-only-basename nil
            helm-ls-git-show-abs-or-relative 'relative)
(setq helm-ag-base-command "/usr/local/bin/ag --nocolor --nogroup --ignore-case")

(require 'org)
(setq org-log-done t)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

(put 'upcase-region 'disabled nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#1B2229" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#DFDFDF"])
 '(cider-boot-parameters "repl -s -H :: wait")
 '(custom-safe-themes
   (quote
    ("90bd0eb20a1cb155b5a076f698b3c72cfe775aa7ea93b7bfbc171eb250db5e20" "2af26301bded15f5f9111d3a161b6bfb3f4b93ec34ffa95e42815396da9cb560" "0a3a41085c19d8121ed0ad3eb658a475ccb948a70a83604641ee7d4c3575a4d5" "a7e7804313dbf827a441c86a8109ef5b64b03011383322cbdbf646eb02692f76" "10e3d04d524c42b71496e6c2e770c8e18b153fcfcc838947094dad8e5aa02cef" "9f569b5e066dd6ca90b3578ff46659bc09a8764e81adf6265626d7dc0fac2a64" default)))
 '(fci-rule-color "#5B6268")
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#98be65"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#3f444a"))
 '(org-fontify-done-headline t)
 '(org-fontify-quote-and-verse-blocks t)
 '(org-fontify-whole-heading-line t)
 '(package-selected-packages
   (quote
    (vue-html-mode vue-mode yasnippet-snippets ob-browser flycheck-kotlin kotlin-mode ob-kotlin exec-path-from-shell parinfer inf-clojure typescript-mode swift-mode actionscript-mode ag yaml-mode xwidgete websocket web-server web-mode uuidgen solaire-mode sass-mode powerline org-plus-contrib org-blog ob-go ob-diagrams neotree multiple-cursors minimap markdown-mode magit jsx-mode indent-guide helm-projectile helm-ls-git helm-ag gradle-mode fzf flycheck face-remap+ emmet-mode doom-themes dockerfile-mode company color-theme-monokai cider auto-complete all-the-icons-dired ac-js2)))
 '(vc-annotate-background "#282c34")
 '(vc-annotate-color-map
   (list
    (cons 20 "#98be65")
    (cons 40 "#afaf6c")
    (cons 60 "#d7af79")
    (cons 80 "#ECBE7B")
    (cons 100 "#f1a179")
    (cons 120 "#e4946c")
    (cons 140 "#da8548")
    (cons 160 "#d78787")
    (cons 180 "#d787af")
    (cons 200 "#c678dd")
    (cons 220 "#e479af")
    (cons 240 "#f16c87")
    (cons 260 "#ff6c6b")
    (cons 280 "#bf5f5f")
    (cons 300 "#7f5f5f")
    (cons 320 "#3f5f5f")
    (cons 340 "#5B6268")
    (cons 360 "#5B6268")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
