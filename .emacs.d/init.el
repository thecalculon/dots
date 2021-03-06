; (setq dw/is-termux
      ; (string-suffix-p "Android" (string-trim (shell-command-to-string "uname -a"))))

(package-initialize)
(server-start)
(unless (assoc-default "melpa" package-archives)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))
(unless (assoc-default "org" package-archives)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
(add-to-list 'load-path "/usr/share/emacs/site-lisp")
(add-to-list 'custom-theme-load-path "/home/vikash/.emacs.d/themes")

(setq user-full-name "Vikash"
      user-mail-address "vikashpandey.phy@gmail.com")

(setq tramp-default-method "ssh")

;; NOTE: init.el is now generated from Emacs.org.  Please edit that file
;;       in Emacs and init.el will be generated automatically!

;; You will most likely need to adjust this font size for your system!
(defvar efs/default-font-size 140)
(defvar efs/default-variable-font-size 140)

;; Make frame transparency overridable
(defvar efs/frame-transparency '(90 . 90))

(use-package spacegray-theme :defer t)
(use-package doom-themes :defer t)
(load-theme 'doom-palenight t)
(doom-themes-visual-bell-config)

;; You must run (all-the-icons-install-fonts) one time after
;; installing this package!
(use-package all-the-icons)

(use-package doom-modeline
  :init (doom-modeline-mode 1))
  ;;:custom ((doom-modeline-height 15))
(setq doom-modeline-height 3)
(use-package minions
  :hook (doom-modeline-mode . minions-mode))

(set-face-attribute 'default nil :font "Fira Code Retina" :height efs/default-font-size)
;; Set the fixed pitch face
 (set-face-attribute 'fixed-pitch nil :font "Fira Code Retina" :height efs/default-font-size)
 ;; Set the variable pitch face
 (set-face-attribute 'variable-pitch nil :font "Cantarell" :height efs/default-font-size :weight 'regular)

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-commentary
:after evil
:config 
  (evil-commentary-mode t))

(setq load-prefer-newer t)
(fset 'yes-or-no-p 'y-or-n-p)
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

(use-package company
	   :ensure t
	   :init 
	   (add-hook 'after-init-hook 'global-company-mode))

(use-package company-auctex
	   :ensure t
	   :init
	  (add-hook 'LaTeX-mode-hook 'company-auctex-init))

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind (("C-M-j" . 'counsel-switch-buffer)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :config
  (counsel-mode 1))

(global-set-key (kbd "\eo") 'other-window)
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

(defun dw/dont-arrow-me-bro ()
  (interactive)
  (message "Arrow keys are bad, you know?"))
  
  ; (unless dw/is-termux
    ;; Disable arrow keys in normal and visual modes
    (define-key evil-normal-state-map (kbd "<left>") 'dw/dont-arrow-me-bro)
    (define-key evil-normal-state-map (kbd "<right>") 'dw/dont-arrow-me-bro)
    (define-key evil-normal-state-map (kbd "<down>") 'dw/dont-arrow-me-bro)
    (define-key evil-normal-state-map (kbd "<up>") 'dw/dont-arrow-me-bro)
    (evil-global-set-key 'motion (kbd "<left>") 'dw/dont-arrow-me-bro)
    (evil-global-set-key 'motion (kbd "<right>") 'dw/dont-arrow-me-bro)
    (evil-global-set-key 'motion (kbd "<down>") 'dw/dont-arrow-me-bro)
    (evil-global-set-key 'motion (kbd "<up>") 'dw/dont-arrow-me-bro)
;)

    (evil-set-initial-state 'messages-buffer-mode 'normal)
    (evil-set-initial-state 'dashboard-mode 'normal)
;)

(org-babel-do-load-languages
  'org-babel-load-languages
  '((emacs-lisp . t)
    (python . t)
    (shell . t)
    (latex . t)))

(push '("conf-unix" . conf-unix) org-src-lang-modes)
(setq org-confirm-babel-evaluate nil)

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("???" "???" "???" "???" "???" "???" "???")))

(use-package org-tempo)
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))
(add-to-list 'org-structure-template-alist '("tex" . "src latex"))

(defun efs/org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "???"))))))

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "Cantarell" :weight 'regular :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master t)
;; lets try lsp
(use-package lsp-mode
  :ensure t
  :demand t
  :config
  (setq-default lsp-highlight-symbol-at-point nil)
  )

;; (use-package lsp-imenu
  ;; :after lsp-mode
  ;; :hook (lsp-after-open . lsp-enable-imenu))


(use-package lsp-ui
  :ensure t
  :config
  (setq lsp-ui-sideline-show-hover nil
        lsp-ui-sideline-ignore-duplicate t
        ;; TODO: wtf is going on with the sideline?
        lsp-ui-sideline-enable nil)
  (set-face-attribute 'lsp-ui-doc-background  nil :background "#f9f2d9")
  (add-hook 'lsp-ui-doc-frame-hook
          (lambda (frame _w)
            (set-face-attribute 'default frame :font "Overpass Mono 11")))
  (set-face-attribute 'lsp-ui-sideline-global nil
                      :inherit 'shadow
                      :background "#f9f2d9")
  :hook (lsp-mode . lsp-ui-mode))

(use-package company-lsp
  :ensure t
  :config
  (setq company-lsp-enable-snippet t
		company-lsp-cache-candidates t)
  (push 'company-lsp company-backends)
  )

(add-hook 'LaTeX-mode-hook
          '(lambda ()
             (use-package lsp-latex)
             (use-package latex-math-preview )
             (use-package latex-extra)
             (use-package ac-math)
             (use-package latex-math-preview)
             (setq TeX-PDF-mode t)
             (company-mode)
             (flyspell-mode)
             (flycheck-mode)
             (outline-minor-mode t)
             (abbrev-mode)
             (auto-fill-mode)
	     ))

(with-eval-after-load "tex"
  ;; enable synctex support for latex-mode
  (add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
  ;; add a new view program
  (add-to-list 'TeX-view-program-list
        '(;; arbitrary name for this view program
          "Zathura"
          (;; zathura command (may need an absolute path)
           "zathura"
           ;; %o expands to the name of the output file
           " %o"
           ;; insert page number if TeX-source-correlate-mode
           ;; is enabled
           (mode-io-correlate " --synctex-forward %n:0:%b"))))
  ;; use the view command named "Zathura" for pdf output
  (setcdr (assq 'output-pdf TeX-view-program-selection) '("Zathura")))

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
