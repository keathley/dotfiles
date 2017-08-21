;;; package --- Summary
;;;
;;; Commentary:
;;;
;;; These are all of my configurations for Emacs.

(require 'package)

;;; Code:
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   (vector "#c5c8c6" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#b294bb" "#8abeb7" "#373b41"))
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(package-selected-packages
   (quote
    (elixir-mode color-theme-sanityinc-solarized go-mode company-distel erlang evil-surround writegood-mode ace-jump-mode helm-ag helm-projectile helm dockerfile-mode cargo flycheck-flow flycheck-haskell flycheck-rust rust-mode toml-mode solarized-theme terraform-mode fish-mode js2-mode web-mode ob-elixir graphviz-dot-mode evil-paredit spacemacs-theme eyebrowse info+ powerline-evil spaceline all-the-icons neotree yaml-mode markdown-mode haskell-mode flycheck-elm flycheck elixir-yasnippets elm-mode elm-yasnippets yasnippet exec-path-from-shell magit ag company emmet-mode grizzl tagedit rainbow-delimiters paredit org evil-escape ample-theme color-theme-sanityinc-tomorrow cyberpunk-theme projectile alchemist evil))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq backup-directory-alist
                `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
                `((".*" ,temporary-file-directory t)))

;; Icons
(require 'all-the-icons)

;; Neotree
(require 'neotree)
(global-set-key (kbd "s-\\") 'neotree-toggle)
;; (setq neo-smart-open t)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; Exec path from shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Projectile
(require 'projectile)
(projectile-mode)
(setq projectile-completion-system 'grizzl)

;; Helm
(require 'helm-config)
(require 'helm-projectile)
(helm-projectile-on)

;; Evil mode
(require 'evil)
(require 'evil-surround)
(require 'evil-escape)
(setq-default evil-escape-key-sequence "kj")
(evil-mode 1)
(evil-escape-mode 1)
(global-evil-surround-mode 1)

(evil-set-initial-state 'term-mode 'emacs)
(add-to-list 'evil-escape-excluded-major-modes 'term-mode)
;; (delete 'term-mode evil-insert-state-modes)
;; (add-to-list 'evil-emacs-state-modes 'term-mode)
(delete 'alchemist-iex-mode evil-insert-state-modes)
(add-to-list 'evil-emacs-state-modes 'alchemist-iex-mode)
(delete 'alchemist-help-minor-mode evil-insert-state-modes)
(add-to-list 'evil-emacs-state-modes 'alchemist-help-minor-mode)

(delete 'elm-interactive-mode evil-insert-state-modes)
(add-to-list 'evil-emacs-state-modes 'elm-interactive-mode)


;;
;; Ace-Jump Mode
;;
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)
(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)

;; Eyebrowse
(require 'eyebrowse)
(eyebrowse-mode t)
(eyebrowse-setup-opinionated-keys)
(setq eyebrowse-wrap-around t)

;; Elixir setup
(require 'elixir-mode)
(require 'alchemist)

;; Elm setup
(require 'elm-mode)

;; Flycheck setup
(require 'flycheck)

(flycheck-define-checker proselint
  "A linter for prose."
  :command ("proselint" source-inplace)
  :error-patterns
  ((warning line-start (file-name) ":" line ":" column ": "
            (id (one-or-more (not (any " "))))
            (message (one-or-more not-newline)
                     (zero-or-more "\n" (any " ") (one-or-more not-newline)))
            line-end))
  :modes (text-mode markdown-mode gfm-mode org-mode))

(add-to-list 'flycheck-checkers 'proselint)

(add-hook 'after-init-hook #'global-flycheck-mode)

;; Web Mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(setq web-mode-content-types-alist
      '(("jsx" . "\\.js[x]?\\'")))
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(require 'emmet-mode)

;; Yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; Custom keys
(defun toggle-comment-on-line ()
  "Comment or uncomment current line."
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

(defun smart-comment ()
  "Comment things the way that I like."
  (interactive)
  (if (use-region-p)
      (comment-dwim nil)
    (toggle-comment-on-line)))

(defun backward-kill-line (arg)
  "Kill ARG lines backwards."
  (interactive "p")
  (kill-line (- 1 arg)))

;; org-mode config
(require 'org)
(setq org-directory "~/Desktop/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-preview-latex-default-process 'imagemagick)
(setq org-log-done t)
(setq org-export-backends '(ascii html icalendar latex md))
(setq org-capture-templates
      '(("j" "Journal" entry (file+datetree "~/Desktop/org/journal.org")
             "* %?\nEntered on %U\n  %i\n  %a")))

(add-to-list 'org-structure-template-alist
             '("dot"
               "#+BEGIN_SRC dot :file image.png :cmdline -Kdot -Tpng ? \n\n#+END_SRC"
               "<src lang=\"?\">\n\n</src>"))

(org-babel-do-load-languages 'org-babel-load-languages
			     '((dot . t)
			       (haskell . t)
			       (elixir . t)
			       (python . t)
			       (sh . t)
			       (R . t)
			       (ruby . t)))

(add-hook 'text-mode-hook '(lambda()
                             (turn-on-auto-fill)
                             (set-fill-column 80)))

;; Spaceline config
(require 'spaceline-config)
(setq ns-use-srgb-colorspace nil)
;; (setq powerline-default-separator 'wave)
(setq powerline-height '20)
(setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
(setq spaceline-window-numbers-unicode t)
(spaceline-spacemacs-theme)
(spaceline-toggle-workspace-number-on)
(spaceline-toggle-remote-host-off)
(spaceline-toggle-minor-modes-off)
(spaceline-toggle-remote-host-off)
(spaceline-toggle-version-control-on)
(spaceline-toggle-battery-off)
(spaceline-toggle-buffer-size-off)
(spaceline-toggle-buffer-position-off)
(spaceline-toggle-hud-off)

;; Keyboard configurations.
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-;") 'toggle-comment-on-line)
(global-set-key (kbd "s-p") 'projectile-find-file)
(global-set-key (kbd "s-t") 'projectile-find-file)
(global-set-key (kbd "s-r") 'projectile-find-tag)
(global-set-key (kbd "s-S-F") 'projectile-ag)
(global-set-key (kbd "C-x a") 'align-regexp)
(global-set-key (kbd "s-\/") 'smart-comment)
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key (kbd "C-c o")
		(lambda () (interactive) (find-file "~/Desktop/org/journal.org")))
(global-set-key [s-backspace] 'backward-kill-line)
(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)

;;; Company-mode
(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-elm)

;; Editing in general
(show-paren-mode 1)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default indent-tabs-mode nil)
(setq tab-width 2)

(require 'rainbow-delimiters)

(add-hook 'elixir-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

;;; Rust stuff
(require 'toml-mode)

;;; Writing and stuff
(require 'writegood-mode)
(global-set-key "\C-cg" 'writegood-mode)

;; Elisp mode stuffs

(add-hook 'emacs-lisp-mode-hook       'evil-paredit-mode)
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
(load-theme 'solarized t)
;; (load-theme 'tomorrow-night-bright t)
;; (require 'color-theme-sanityinc-tomorrow)
;; (load-theme 'spacemacs-dark)

;; Solarized theme for when I'm feeling weird
;; (require 'solarized-theme)
;; (setq solarized-scale-org-headlines nil)
;; (setq solarized-height-minus-1 1.0)
;; (setq solarized-height-plus-1 1.0)
;; (setq solarized-height-plus-2 1.0)
;; (setq solarized-height-plus-3 1.0)
;; (setq solarized-height-plus-4 1.0)
;; (setq solarized-use-variable-pitch nil)
;; (load-theme 'solarized-light)

(setq inhibit-splash-screen t)

(global-linum-mode t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(add-to-list 'default-frame-alist '(font . "Fira Code Light-14" ))
(set-face-attribute 'default t :font "Fira Code Light-14" )

(provide '.emacs)
;;; .emacs ends here
