(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#454545" "#cd5542" "#6aaf50" "#baba36" "#5180b3" "#ab75c3" "#68a5e9" "#bdbdb3"])
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(package-selected-packages
   (quote
    (yaml-mode markdown-mode haskell-mode flycheck-elm flycheck elixir-yasnippets elm-mode elm-yasnippets yasnippet exec-path-from-shell magit ag company emmet-mode grizzl tagedit rainbow-delimiters paredit org evil-escape ample-theme color-theme-sanityinc-tomorrow cyberpunk-theme projectile alchemist evil))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Exec path from shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Projectile
(projectile-mode)
(setq projectile-completion-system 'grizzl)

;; Evil mode

(require 'evil)
(setq-default evil-escape-key-sequence "kj")
(evil-mode 1)
(evil-escape-mode 1)

(delete 'term-mode evil-insert-state-modes)
(add-to-list 'evil-emacs-state-modes 'term-mode)
(delete 'alchemist-iex-mode evil-insert-state-modes)
(add-to-list 'evil-emacs-state-modes 'alchemist-iex-mode)

;; Elixir setup

(require 'elixir-mode)
(require 'alchemist)

;; Elm setup
(require 'elm-mode)

;; Flycheck setup
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-elm-setup))

;; Yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; Custom keys
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

(defun smart-comment ()
  "comment things the way that I like"
  (interactive)
  (if (use-region-p)
      (comment-dwim nil)
    (toggle-comment-on-line)))

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-;") 'toggle-comment-on-line)
(global-set-key (kbd "s-p") 'projectile-find-file)
(global-set-key (kbd "s-t") 'projectile-find-file)
(global-set-key (kbd "s-r") 'projectile-find-tag)
(global-set-key (kbd "s-S-F") 'projectile-ag)
(global-set-key (kbd "s-\/") 'smart-comment)
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;; org-mode config
(require 'org)

;; Company-mode
(add-hook 'after-init-hook 'global-company-mode)

;; Editing in general

(show-paren-mode 1)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'rainbow-delimiters)

(add-hook 'elixir-mode-hook 'rainbow-delimiters-mode)

;; Elisp mode stuffs

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)


;; Make things look kinda nice

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
(load-theme 'tomorrow-night-bright t)

(setq inhibit-splash-screen t)

(global-linum-mode t)

(require 'color-theme-sanityinc-tomorrow)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(add-to-list 'default-frame-alist '(font . "Fira Code Light-12" ))
(set-face-attribute 'default t :font "Fira Code Light-12" )
