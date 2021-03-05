(package-initialize)
;; set the load paths and all first two are the site lisp packages third is the
;; theme directory

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
(add-to-list 'load-path "/usr/share/emacs/site-lisp")
(add-to-list 'custom-theme-load-path "/home/vikash/.emacs.d/themes")

;; lets for the sake of generality set the personal information

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
; don't know what dash does but its okay will learn later
(use-package dash)
;; set the path for the backup files and stuffs
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

					; the display properties
(add-to-list 'load-path "/home/vikash/.emacs.d/lib")
(autoload 'cuda-mode "cuda-mode.el")
(add-to-list 'auto-mode-alist '("\\.cu\\'" . cuda-mode))
(tool-bar-mode -1)
(menu-bar-mode -1)
(display-time-mode 1)
(setq display-time-string-forms
      '((propertize (format-time-string "%d-%m  %H:%M" now) 'face 'bold)))

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
(setq browse-url-generic-program "firefox")

(dolist (k '([mouse-1] [down-mouse-1] [drag-mouse-1] [double-mouse-1] [triple-mouse-1]  
             [mouse-2] [down-mouse-2] [drag-mouse-2] [double-mouse-2] [triple-mouse-2]
             [mouse-3] [down-mouse-3] [drag-mouse-3] [double-mouse-3] [triple-mouse-3]))
(global-unset-key k))
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
;; Insert new line above current line
;; and move cursor to previous line (newly inserted line)
;; it will also indent newline
;; TODO: right now I am unable to goto previous line, FIXIT
(global-set-key (kbd "<C-S-return>") (lambda ()
                       (interactive)
                       (beginning-of-line)
                       (newline-and-indent)
                       (previous-line)))

					;set the themes and hilight line and the font for the ;
										; I like the jonadabian slate theme written by someone I dont know

					;(load-theme 'jonadabian-slate t)
										;  lets work on the theme part for a while and try solarized dark suggested by sacha chua and others and see if it works
;; the theme part I like cycling througn many hence <F12> will do the trick
;(use-package color-theme)
                                        ;(use-package color-theme-solarized)

(defun setup-color-theme ()
  (interactive)
  (color-theme-solarized-dark)
  (set-face-foreground 'secondary-selection "darkblue")
  (set-face-background 'secondary-selection "lightblue")
  (set-face-foreground 'org-todo "green"))
(with-eval-after-load 'ox-latex
	(add-to-list 'org-latex-classes
             '("\\documentclass{article}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{graphicx}
\\usepackage{longtable}
\\usepackage{hyperref}
\\usepackage{natbib}
\\usepackage{amssymb}
\\usepackage{amsmath}
\\usepackage{geometry}
\\geometry{a4paper,left=2.5cm,top=2cm,right=2.5cm,bottom=2cm,marginparsep=7pt, marginparwidth=.6in}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(setq my-themes (list 'material 'immaterial 'monokai ))

(defun my-theme-cycle ()
    (interactive)
    (disable-theme (car curr-theme)) ;;Nee flickeringded to stop even worse
    (setq curr-theme (cdr curr-theme))
    (if (null curr-theme) (setq curr-theme my-themes))
    (load-theme (car curr-theme) t)
;	(set-face-background 'hl-line "ffffff")
    (message "%s" (car curr-theme))
	)

(global-set-key (kbd "C-c dct") '(lambda () (interactive) (disab-current-theme)))
(global-set-key [f12] 'my-theme-cycle)
(setq curr-theme my-themes)
(load-theme (car curr-theme) t) 

;(eval-after-load 'color-theme (setup-color-theme))
;(set-default-font "Source Code Pro Bold 13")
;(global-hl-line-mode nil)
;(set-face-attribute hl-line-face nil :underline t)
;(set-face-attribute 'hl-line nil                                            
;                    :inherit nil
;					:background (face-background 'highlight))
;(set-face-background 'hl-line "#336666")
;(set-face-background 'hl-line "#003333")
;(set-face-background 'hl-line "#003333")
; to change the yes to y and no to n
(fset 'yes-or-no-p 'y-or-n-p)

					; set the linum mode in emacs
(global-linum-mode 1)
(setq column-number-mode 1)
(setq linum-format "%3d")

					; the coloring the numbers and stuffs
(add-hook 'prog-mode-hook 'highlight-numbers-mode)
;(add-hook 'prog-mode-hook (lambda ()
;			    (font-lock-add-keywords nil '(
;							  ("\\b0x[[:xdigit:]]+[uUlL]*\\b" . font-lock-string-face)
;							  ("\\b0x\\(\\w\\|\\.\\)+\\b" . font-lock-warning-face)
;							  ("\\(\\b[0-9]+\\|\\)\\(\\.\\)\\([0-9]+\\(e[-]?[0-9]+\\)?\\([lL]?\\|[dD]?[fF]?\\)\\)\\b" (1     font-lock-string-face) (3 font-lock-string-face))
;					; Valid for the fortran
;							  ("\\(\\b[0-9]+\\|\\)\\(\\.\\)\\([0-9]+\\(d[-]?[0-9]+\\)?\\([lL]?\\|[dD]?[fF]?\\)\\)\\b" (1     font-lock-string-face) (3 font-lock-string-face))
;							  ("\\b[0-9].*?\\..+?\\b" . font-lock-warning-face)
;							  
;							  ("\\b\\(\\(0\\|[1-9][0-9]*\\)[uUlL]*\\)\\b" 1 font-lock-string-face)
;							  
;							  ("\\b0[0-7]+[uUlL]*\\b" . font-lock-string-face)
;							  
;							  ("\\b\\([0-9]+\\)\\." (1 font-lock-string-face))
;							  
;							  ("\\b[0-9]\\(\\w\\|\\.\\)+?\\b" . font-lock-warning-face)
;							  ))  
;			    ))  

					; set the tab settings
(setq tab-width 4)
(setq tab-always-indent t)
; c mode indentation -- default is 2 spaces which is annoying
;(setq-default indent-tabs-mode nil)i
(setq-default c-basic-offset 4)
(setq indent-line-function 'insert-tab)
										; need to set the ido mode and all
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

										; to navigate in the code
(defun previous-blank-line ()
  "Moves to the previous line containing nothing but whitespace."
  (interactive)
  (search-backward-regexp "^[ \t]*\n")
  )

(defun next-blank-line ()
  "Moves to the next line containing nothing but whitespace."
  (interactive)
  (forward-line)
  (search-forward-regexp "^[ \t]*\n")
  (forward-line -1)
  )
(define-key global-map [M-up] 'previous-blank-line)
(define-key global-map [M-down] 'next-blank-line)

; the latex mode configurations
(setq auto-mode-alist
      (append
       '(("\\.tex$"    . LaTeX-mode)
	 ) auto-mode-alist))
;; to open the async shell command in background
(add-to-list 'display-buffer-alist
  (cons "\\*Async Shell Command\\*.*" (cons #'display-buffer-no-window nil)))

(use-package auctex
  :defer t
  :ensure t)
(use-package xkcd)

(add-hook 'LaTeX-mode-hook
		  '(lambda ()
		  (use-package ac-math)
		  (use-package latex-math-preview)
			(flyspell-mode)
			(flycheck-mode)
			(outline-minor-mode t)
			(abbrev-mode)
            (auto-fill-mode)
		  ))
(quietly-read-abbrev-file "~/.emacs_abbrevs")

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
(setq TeX-PDF-mode t)
(add-hook 'latex-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-auctex t)

(setq outline-minor-mode-prefix "\C-c \C-o")
									; need to bind the auto completion to some key to function properly
;;;; flymake mode disabled for a while because of some error. read the documentation and do it later.

;(defun flymake-get-tex-args (file-name)
;(list "pdflatex"
;(list "-file-line-error" "-draftmode" "-interaction=nonstopmode" file-name)))
;(add-hook 'prog-mode-hook 'flymake-mode)
(global-set-key (kbd "C-'") 'TeX-complete-symbol)
;(add-to-list
 ;   'flymake-err-line-patterns
;    '("Runaway argument?" nil nil nil)) 

(use-package yasnippet)
(yas-global-mode 1)
(use-package auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-modes 'latex-mode)
(eval-after-load "latex"
  '(when (featurep 'auto-complete)
     ;; See https://github.com/vspinu/ac-math
     (require 'ac-math)
     (defun ac-latex-mode-setup ()       ; add ac-sources to default ac-sources
       (setq ac-sources
         (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
             ac-sources)))
     (add-hook 'LaTeX-mode-hook 'ac-latex-mode-setup)))
;; auto-complete setup, sequence is important
;;(ac-flyspell-workaround) 
; fixes a known bug of delay due to flyspell (if it is there)

;; This ends the latex-mode customization. now what remains is the fortran mode
;; configuration for the fortran configuration
;; Fortran settings
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

;; Swap Return and C-j in Fortran 90 mode
(add-hook 'f90-mode-hook
	  '(lambda ()
	     (define-key f90-mode-map [return] 'f90-indent-new-line)
	     (define-key f90-mode-map "\C-j" 'newline)
	     (setq fill-column 100)
         (abbrev-mode)
         (setq-default indent-tabs-mode nil)
         (setq whitespace-line-column 100)
         (setq whitespace-style '(face tabs lines-tail empty))
         (whitespace-mode)		 
;;         (add-to-list 'write-file-functions 'delete-trailing-whitespace)
	     )
	  )

(defun newline-without-break-of-line ()
  "1. move to end of the line.
  2. insert newline with index"

  (interactive)
  (let ((oldpos (point)))
    (end-of-line)
    (newline-and-indent)))

(global-set-key (kbd "<C-return>") 'newline-without-break-of-line)
;this will check the syntax on every program 
(add-hook 'prog-mode-hook 'flycheck-mode)
;; maybe this will do the trick for the fortran mode
;; these are the setting for the org mode ;; hopefully it works

(use-package org-bullets)
;; make available "org-bullet-face" such that I can control the font size individually
(setq org-bullets-face-name (quote org-bullet-face))
(add-hook 'org-mode-hook (lambda () 
	(org-bullets-mode 1)
	(abbrev-mode)
	(auto-complete-mode)
	))
;(setq org-bullets-bullet-list '("✙" "♱" "♰" "☥" "✞" "✟" "✝" "†" "✠" "✚" "✜" "✛" "✢" "✣" "✤" "✥"))

;(setq org-ellipsis "⚡⚡⚡")
(use-package magit)

(require 'ob-python)
(require 'ob-gnuplot)
(require 'ob-org)
(require 'ob-latex)
;(require 'ob-sh)
(require 'ob-awk)
(require 'ob-octave)
(require 'ob-sed)
(require 'ob-ipython)
(org-babel-do-load-languages
 'org-babel-load-languages
 '( (perl . t)
    (gnuplot . t)
    (org . t)
    (latex . t)
    (python . t)
    (emacs-lisp . t)
    (awk . t)
	(ipython . t)
    (octave . t)
    (sed . t)
    ))


										;python editing emacs
(add-hook 'python-mode-hook
		  (lambda ()
		    (setq-default indent-tabs-mode t)
		    (setq-default tab-width 4)
		    (setq-default py-indent-tabs-mode t)
			(add-to-(list ) 'write-file-functions 'delete-trailing-whitespace)))
(add-hook 'python-mode-hook 'guess-style-guess-tabs-mode)
(add-hook 'python-mode-hook (lambda ()
							  (guess-style-guess-tab-width)))
(eval-after-load 'autoinsert
'(define-auto-insert '("\\.org\\'" . "ORG skeleton")
   '(
	nil
	"#+LaTeX_CLASS: article" \n
	"#+TITLE:  " \n 
	"#+AUTHOR: " \n
	"#+OPTIONS: html-link-use-abs-url:nil html-postamble:auto"\n
	"#+OPTIONS: html-preamble:t html-scripts:t html-style:t"\n
	"#+OPTIONS: html5-fancy:nil tex:t"\n
	"#+HTML_DOCTYPE: xhtml-strict"\n
	"#+HTML_CONTAINER: div"\n
	"#+DESCRIPTION:"\n
	"#+KEYWORDS:"\n
	"#+HTML_LINK_HOME:"\n
	"#+HTML_LINK_UP:"\n
	"#+HTML_MATHJAX:"\n
     )))
;; this is the end and hence is put in the end 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#ffffff" "#f36c60" "#8bc34a" "#fff59d" "#4dd0e1" "#b39ddb" "#81d4fa" "#263238"))
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("b6440ff441a31c8c7f6f2903f5959d9e2b0bd874e6839a73cb893d655f39dc34" "837f2d1e6038d05f29bbcc0dc39dbbc51e5c9a079e8ecd3b6ef09fc0b149ceb1" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "30cf4f20cb6a88b20b718d0997aabde24e28139d09e84c57dd6f06c7f0ed9c92" "6c0d748fb584ec4c8a0a1c05ce1ae8cde46faff5587e6de1cc59d3fc6618e164" "31772cd378fd8267d6427cec2d02d599eee14a1b60e9b2b894dd5487bd30978e" "8e7044bfad5a2e70dfc4671337a4f772ee1b41c5677b8318f17f046faa42b16b" "cb39485fd94dabefc5f2b729b963cbd0bac9461000c57eae454131ed4954a8ac" "57d7e8b7b7e0a22dc07357f0c30d18b33ffcbb7bcd9013ab2c9f70748cfa4838" "d9e811d5a12dec79289c5bacaecd8ae393d168e9a92a659542c2a9bab6102041" "b4fd44f653c69fb95d3f34f071b223ae705bb691fb9abaf2ffca3351e92aa374" "5eb4b22e97ddb2db9ecce7d983fa45eb8367447f151c7e1b033af27820f43760" "b8c5adfc0230bd8e8d73450c2cd4044ad7ba1d24458e37b6dec65607fc392980" default)))
 '(fci-rule-color "#37474f")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(hl-sexp-background-color "#1c1f26")
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (highlight-numbers parent-mode rainbow-delimiters let-alist ace-window multiple-cursors multiple-cursor ob-ipython magit git fortpy-install-server fortpy-setup org-bullets auto-complete-config yasnippet xkcd use-package tabbar-ruler tab-group org-edna multishell latex-math-preview image-archive fortpy flycheck f90-interface-browser evil elscreen-mew disable-mouse color-theme-solarized auto-compile auctex ac-math)))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;  (add-hook 'after-make-frame-functions
      
;(set-default-font "IBM Plex Mono SemiBold 14"))



(put 'downcase-region 'disabled nil)
