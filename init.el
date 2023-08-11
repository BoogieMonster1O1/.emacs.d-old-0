(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(tool-bar-mode -1)
(require 'elcord)
(elcord-mode)

(jdecomp-mode 1)
(customize-set-variable 'jdecomp-decompiler-type 'cfr)
(customize-set-variable 'jdecomp-decompiler-paths
                        '((cfr . "~/.emacs.d/cfr.jar")
                          (fernflower . "~")
                          (procyon . "~")))

(custom-set-faces
 '(default ((t (:family "SF Mono" :foundry "font-foundry" :slant normal :weight normal :height 100 :width normal)))))

(use-package lsp-sourcekit
  :after lsp-mode
  :config
  (setq lsp-sourcekit-executable "/usr/bin/sourcekit-lsp"))

(use-package timu-macos-theme
  :ensure t
  :config
  (load-theme 'timu-macos t))

(use-package treemacs
  :ensure t
  :defer t
  :config
  (progn
    (setq treemacs-follow-after-init t
          treemacs-width 35
          treemacs-indentation 2
          treemacs-collapse-dirs 3
          treemacs-silent-refresh t
          treemacs-change-root-without-asking t
          treemacs-sorting 'alphabetic-desc
          treemacs-show-hidden-files t
          treemacs-never-persist nil
          treemacs-is-never-other-window nil
          treemacs-goto-tag-strategy 'refetch-index)
    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-load-theme "all-the-icons")
    (pcase (cons (not (null (executable-find "git")))
                 (not (null (executable-find "python3"))))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(require 'treemacs-all-the-icons)
(use-package all-the-icons
  :if (display-graphic-p))

(require 'gradle-mode)
(add-hook 'java-mode-hook '(lambda() (gradle-mode 1)))

(setq inhibit-startup-screen t)

(use-package company)

(use-package lsp-ui
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-sideline-enable t
        lsp-ui-sideline-show-diagnostics t
        lsp-ui-sideline-show-hover t
        lsp-ui-sideline-show-code-actions t
        lsp-ui-sideline-update-mode 'line))

(add-to-list 'auto-mode-alist '("\\.tsx?$" . web-mode))
(lsp-treemacs-sync-mode 1)
(add-hook 'swift-mode-hook #'lsp)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(git-modes elcord atom-dark-theme atom-one-dark-theme jdecomp swift3-mode lsp-sourcekit flycheck-swift chess meson-mode swift-mode timu-macos-theme company lsp-ui lsp-java gradle-mode lsp-treemacs flycheck web-mode treemacs dired-sidebar lsp-mode typescript-mode ## clojure-mode csharp-mode go-mode javaimp json-mode kotlin-mode windresize yaml-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
