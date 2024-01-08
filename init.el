(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Berkeley Mono" :foundry "UKWN" :slant normal :weight normal :height 120 :width normal)))))

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(global-display-line-numbers-mode 1)
(global-prettify-symbols-mode 1)

(put 'dired-find-alternate-file 'disabled nil)
(setq make-backup-files nil)
(global-set-key (kbd "C-z") nil)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (setq doom-themes-treemacs-theme "doom-atom")
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

(use-package company
  :ensure t
  :hook (after-init . global-company-mode))

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))

(use-package haskell-mode
  :ensure t)

(use-package racket-mode
  :ensure t)

(use-package geiser
  :ensure t
  :config
  (setq geiser-active-implementations '(mit)))

(use-package geiser-mit
  :ensure t
  :config
  (setq geiser-mit-binary "/usr/bin/scheme"))

(use-package sly
  :ensure t
  :config
  (setq inferior-lisp-program "/usr/bin/sbcl"))

(use-package paredit
  :ensure t
  :hook ((emacs-lisp-mode .         enable-paredit-mode)
	 (lisp-mode .               enable-paredit-mode)
	 (lisp-interaction-mode .   enable-paredit-mode)
	 (scheme-mode .             enable-paredit-mode)
	 (racket-mode .             enable-paredit-mode)))

(use-package rainbow-delimiters
  :ensure t
  :hook ((emacs-lisp-mode .         rainbow-delimiters-mode)
	 (lisp-mode .               rainbow-delimiters-mode)
	 (lisp-interaction-mode .   rainbow-delimiters-mode)
	 (slime-repl-mode .         rainbow-delimiters-mode)
	 (scheme-mode .             rainbow-delimiters-mode)
	 (geiser-repl-mode .        rainbow-delimiters-mode)
	 (racket-mode .             rainbow-delimiters-mode)
	 (racket-repl-mode .        rainbow-delimiters-mode)))

(use-package pyvenv
  :ensure t
  :config
  (pyvenv-mode t)
  (setq pyvenv-post-activate-hooks
        (list (lambda ()
                (setq python-shell-interpreter (concat pyvenv-virtual-env "bin/python3")))))
  (setq pyvenv-post-deactivate-hooks
        (list (lambda ()
                (setq python-shell-interpreter "python3")))))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t
  :config
  (setq yas-snippet-dirs (list (concat user-emacs-directory "snippets"))))
