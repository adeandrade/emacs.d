;; path to where plugins are kept
(setq plugin-path "~/.emacs.d/elpa/")

;; add local binary folder to paths
(add-to-list 'exec-path "/usr/local/bin")
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))

;; custom functions
(defun make-plugin-path (plugin)
  (expand-file-name
   (concat plugin-path plugin)))

(defun include-plugin (plugin)
  (add-to-list 'load-path (make-plugin-path plugin)))

;; disable backup
(setq backup-inhibited t)

;; disable autosave
(setq auto-save-default nil)

;; disable menu bar
(menu-bar-mode -1)

;; disable tool bar
(tool-bar-mode -1)

;; disable welcome buffer
(setq inhibit-startup-message t)

;; add melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; custom variables
(custom-set-variables
 ;; maximize window
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 ;; choose solarized theme
 '(frame-background-mode 'dark))

;; load theme
(add-to-list 'custom-theme-load-path (make-plugin-path "color-theme-solarized"))
(load-theme 'solarized 1)

;; ido: interactively do things
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)

;; show function documentation
(require 'eldoc)

;; paredit
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook                  #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook                        #'enable-paredit-mode)
(add-hook 'lisp-mode-hook                        #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook            #'enable-paredit-mode)
(add-hook 'scheme-mode-hook                      #'enable-paredit-mode)
(add-hook 'clojure-mode-hook                     #'enable-paredit-mode)

;; add paredit commands to eldoc
(eldoc-add-command
 'paredit-backward-delete
 'paredit-close-round)

;; show parenthesis
(show-paren-mode 1)

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

;; display line numbers
(global-linum-mode t)
(setq linum-format "%4d")

;; show the current column number in the stats bar
(column-number-mode t)

;; disable truncation
(setq-default truncate-lines t)

;; highlight current line
(require 'highlight-current-line)
(global-hl-line-mode t)

;; tab width
(setq-default tab-width 2)
;;(setq-default tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80))
;;(setq-default indent-tabs-mode nil)

;; interactive statistical programming
(require 'ess-site)

; python-mode
(require 'python-mode)

;; ipython
(setq py-shell-name "ipython")
