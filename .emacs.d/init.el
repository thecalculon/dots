(package-initialize)
(server-start)
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
(add-to-list 'load-path "/usr/share/emacs/site-lisp")
(add-to-list 'custom-theme-load-path "/home/vikash/.emacs.d/themes")


(setq user-full-name "vikash"
      user-mail-address "vikash@vesper")

;; add the package sources to the whatever
(unless (assoc-default "melpa" package-archives)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))
(unless (assoc-default "org" package-archives)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-verbose t)
(setq-default fill-column 90)
(setq use-package-always-ensure t)
(require 'use-package)
(use-package auto-compile
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)
; want emacs to start scratch instead of manual
(setq inhibit-startup-screen t)
;; set the path for the backup files and stuffs
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

(tool-bar-mode -1)
(menu-bar-mode -1)
(display-time-mode 1)

(setq blink-matching-paren nil)
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)
(abbrev-mode t)
(setq ring-bell-function 'ignore)
(setq visible-bell t)
; frame title
(setq frame-title-format
      '(buffer-file-name "%b - %f" ; File buffer
        (dired-directory dired-directory ; Dired buffer
         (revert-buffer-function "%b" ; Buffer Menu
          ("%b - Dir: " default-directory))))) ; Plain buffer
(scroll-bar-mode 1)

(setq browse-url-browser-function 'browse-url-generic)

;; setting up the cursors and cool stuffs
(use-package multiple-cursors)
(global-set-key (kbd "C-c m c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "<C-return>") (lambda ()
                   (interactive)
                   (end-of-line)
                   (newline-and-indent)))

(global-set-key (kbd "<C-S-return>") (lambda ()
                       (interactive)
                       (beginning-of-line)
                       (newline-and-indent)
                       (previous-line)))

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)


(use-package yasnippet)
(yas-global-mode 1)

(use-package ayu-theme )
(load-theme 'ayu-dark t)

(use-package fira-code-mode
  :config (global-fira-code-mode))

(add-to-list 'default-frame-alist '(font . "Fira Code Medium-13" ))
(set-face-attribute 'default t :font "Fira Code Medium-13" )
; (set-default-font "Fira Code Medium-13")


(setq column-number-mode 1)
(add-hook 'prog-mode-hook 'highlight-numbers-mode)

(setq tab-width 4)
(setq tab-always-indent t)
(evil-mode 1)
(evil-mc-mode 1)
(ido-mode 1)
										; these are all the default keys I have defined to do the dirty stuffs
(global-set-key (kbd "\eo") 'other-window)
;(global-set-key [ return ] 'newline)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-x C-i") 'string-insert-rectangle)
(define-key global-map "\ef" 'find-file) 
(global-set-key (read-kbd-macro "\eb") 'ido-switch-buffer)
(define-key global-map "\eg" 'goto-line)
(define-key global-map "\ek" 'kill-buffer)
(define-key global-map "\es" 'save-buffer)
(define-key global-map "\eu" 'undo)
(define-key global-map "\eg" 'goto-line)
(define-key global-map "\en" 'next-error)
(define-key global-map "\eN" 'previous-error)
(define-key global-map [M-right] 'forward-word)
(define-key global-map [M-left] 'backward-word)
(define-key global-map [C-right] 'forward-sentence)
(define-key global-map [C-left] 'backward-sentence)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master t)
(add-hook 'LaTeX-mode-hook
          '(lambda ()
             (use-package lsp-latex)
             (use-package latex-math-preview )
             (use-package latex-extra)
             (use-package ac-math)
             (use-package latex-math-preview)
	     (setq TeX-PDF-mode t)
             (flyspell-mode)
             (flycheck-mode)
             (outline-minor-mode t)
             (abbrev-mode)
             (auto-fill-mode)
	     (add-to-list 'TeX-view-program-list
			  '("Zathura"
			    ("zathura %o"
			     (mode-io-correlate " --synctex-forward %n:0:%b -x \"emacsclient --socket-name=%sn --no-wait +%{line} %{input}\""))
			    "zathura"))
	     ))

(quietly-read-abbrev-file "~/.emacs.d/emacs_abbrevs")

(setq fortran-continuation-string "&")
(setq fortran-do-indent 4)
(setq fortran-if-indent 4)
(setq fortran-structure-indent 4)

;; Fortran 90 settings
(setq f90-do-indent 4)
(setq f90-if-indent 4)
(setq f90-type-indent 2)
(setq f90-program-indent 2)
(setq f90-continuation-indent 4)
(setq f90-smart-end 'blink)

;; Set Fortran and Fortran 90 mode for appropriate extensions
(setq auto-mode-alist
      (cons '("\\.F90$" . f90-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.pf$" . f90-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.fpp$" . f90-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.f95$" . f90-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.F$" . fortran-mode) auto-mode-alist))




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ac-math rainbow-delimiters multiple-cursors auto-compile yasnippet use-package tree-sitter-langs lsp-latex latex-math-preview latex-extra highlight-numbers git-gutter fortpy fira-code-mode fiplr evil-mc evil-god-state dad-joke bibretrieve biblio ayu-theme auto-complete-c-headers academic-phrases)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
