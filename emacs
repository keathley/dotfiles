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
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(fci-rule-color "#073642")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (evil-leader color-theme-sanityinc-solarized rainbow-mode tabbar racer elixir-mode go-mode company-distel erlang evil-surround writegood-mode ace-jump-mode helm-ag helm-projectile helm dockerfile-mode cargo flycheck-flow flycheck-haskell flycheck-rust rust-mode toml-mode solarized-theme terraform-mode fish-mode js2-mode web-mode ob-elixir graphviz-dot-mode evil-paredit spacemacs-theme eyebrowse info+ powerline-evil spaceline all-the-icons neotree yaml-mode markdown-mode haskell-mode flycheck-elm flycheck elixir-yasnippets elm-mode elm-yasnippets yasnippet exec-path-from-shell magit ag company emmet-mode grizzl tagedit rainbow-delimiters paredit org evil-escape ample-theme color-theme-sanityinc-tomorrow cyberpunk-theme projectile alchemist evil)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(tabbar-separator (quote (0.5)))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#ffff7fff0000")
     (60 . "#ffffbfff0000")
     (80 . "#b58900")
     (100 . "#ffffffff0000")
     (120 . "#ffffffff0000")
     (140 . "#ffffffff0000")
     (160 . "#ffffffff0000")
     (180 . "#859900")
     (200 . "#aaaaffff5555")
     (220 . "#7fffffff7fff")
     (240 . "#5555ffffaaaa")
     (260 . "#2aaaffffd554")
     (280 . "#2aa198")
     (300 . "#0000ffffffff")
     (320 . "#0000ffffffff")
     (340 . "#0000ffffffff")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))

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
(require 'evil-leader)

;; Set evil leader first
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key "f" 'projectile-find-file)

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
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

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
			       (shell . t)
			       (R . t)
			       (ruby . t)))

(add-hook 'text-mode-hook '(lambda()
                             (turn-on-auto-fill)
                             (set-fill-column 80)))

;; Spaceline config
;; (require 'spaceline-config)
;; (setq ns-use-srgb-colorspace nil)
;; (setq powerline-default-separator 'wave)
;; (setq powerline-height '20)
;; (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
;; (setq spaceline-window-numbers-unicode t)
;; (spaceline-spacemacs-theme)
;; (spaceline-toggle-workspace-number-on)
;; (spaceline-toggle-remote-host-off)
;; (spaceline-toggle-minor-modes-off)
;; (spaceline-toggle-remote-host-off)
;; (spaceline-toggle-version-control-on)
;; (spaceline-toggle-battery-off)
;; (spaceline-toggle-buffer-size-off)
;; (spaceline-toggle-buffer-position-off)
;; (spaceline-toggle-hud-off)

;; Keyboard configurations.
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-;") 'toggle-comment-on-line)
;; (global-set-key (kbd "s-p") 'projectile-find-file)
;; (global-set-key (kbd "s-t") 'projectile-find-file)
;; (global-set-key (kbd "s-r") 'projectile-find-tag)
;; (global-set-key (kbd "s-S-F") 'projectile-ag)
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
(global-set-key (kbd "s-{") 'tabbar-backward-tab)
(global-set-key (kbd "s-}") 'tabbar-forward-tab)
(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)


;;; Tabbar mode
;; Tabbar
;; (require 'tabbar)
;; (setq tabbar-background-color "#001f27")
;; ;; Tabbar settings
;; (set-face-attribute
;;  'tabbar-default nil
;;  :background "#001f27"
;;  :foreground "#001f27")
;; (set-face-attribute
;;  'tabbar-unselected nil
;;  :background "#001f27"
;;  :foreground "#gray69")
;; (set-face-attribute
;;  'tabbar-selected nil
;;  :background "#002b36"
;;  :foreground "gray100")
;; (set-face-attribute
;;  'tabbar-highlight nil
;;  :background "white"
;;  :foreground "black"
;;  :underline nil)
;; (set-face-attribute
;;  'tabbar-button nil)
;; (set-face-attribute
;;  'tabbar-separator nil
;;  :background "gray20"
;;  :height 0.8)

;; ;; Change padding of the tabs
;; ;; we also need to set separator to avoid overlapping tabs by highlighted tabs

;; ;; adding spaces
;; (defun tabbar-buffer-tab-label (tab)
;;   "Return a label for TAB.
;; That is, a string used to represent it on the tab bar."
;;   (let ((label  (if tabbar--buffer-show-groups
;;                     (format "[%s]  " (tabbar-tab-tabset tab))
;;                   (format "%s  " (tabbar-tab-value tab)))))
;;     ;; Unless the tab bar auto scrolls to keep the selected tab
;;     ;; visible, shorten the tab label to keep as many tabs as possible
;;     ;; in the visible area of the tab bar.
;;     (if tabbar-auto-scroll-flag
;;         label
;;       (tabbar-shorten
;;        label (max 1 (/ (window-width)
;;                        (length (tabbar-view
;;                                 (tabbar-current-tabset)))))))))

;; (tabbar-mode 1)

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
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

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
(require 'color-theme)
(require 'color-theme-solarized)
(color-theme-initialize)
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;; (add-to-list 'load-path "~/.emacs.d/themes")
;; (load-theme 'tomorrow-night-bright t)
;; (require 'color-theme-sanityinc-tomorrow)
(load-theme 'spacemacs-dark)

;; Solarized theme for when I'm feeling weird
;; (require 'solarized-theme)
;; (require 'color-theme-solarized)
;; (setq solarized-scale-org-headlines nil)
;; (setq solarized-height-minus-1 1.0)
;; (setq solarized-height-plus-1 1.0)
;; (setq solarized-height-plus-2 1.0)
;; (setq solarized-height-plus-3 1.0)
;; (setq solarized-height-plus-4 1.0)
;; (setq solarized-use-variable-pitch nil)
;; (load-theme 'solarized-dark t)
;; (load-theme 'solarized-light)
;; (load-theme 'solarized-dark t)

(setq inhibit-splash-screen t)

; (global-linum-mode t)
(menu-bar-mode -1)
(tool-bar-mode -1)
;; (scroll-bar-mode -1)

(add-to-list 'default-frame-alist '(font . "Monaco-14" ))
(set-face-attribute 'default t :font "Monaco-14" )

(provide '.emacs)
;;; .emacs ends here
