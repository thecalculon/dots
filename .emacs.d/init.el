(server-start)

;username
  (setq user-full-name "Vikash"
        user-mail-address "vkpnbeta@gmail.com")

(add-to-list 'exec-path "/home/vikash/opt/anaconda3/bin")
(add-to-list 'exec-path "/home/vikash/opt/julia-1.10.0/bin")
; julia path
(setenv "PATH" (concat (getenv "PATH") ":" (expand-file-name "/home/vikash/opt/julia-1.10.0/bin")))
(setenv "PATH" (concat (expand-file-name "/home/vikash/opt/anaconda3/bin") ":" (getenv "PATH")))

;set the font
(set-face-attribute 'default nil :font "Iosevka Custom" :height 150 :weight 'Semibold)
(set-face-attribute 'fixed-pitch nil :font "Iosevka Custom" :height 150 :weight 'Semibold)
;; (set-face-attribute 'variable-pitch nil :font "SourceSans3VF" :height 155 :weight 'Regular)
(set-face-attribute 'variable-pitch nil :font "CMU Typewriter Text" :height 170 :weight 'Regular)
;;(set-face-attribute 'variable-pitch nil :font "Iosevka Etoile" :height 145 :weight 'Regular)
;; (set-face-attribute 'variable-pitch nil :font "CMU Concrete" :height 135 :weight 'SemiBold)

(setq make-backup-files nil
      auto-save-default nil) ; to prevent emacs from creating files with ~ in the end. 
(setq inhibit-startup-message t) ; Disable startup message
(switch-to-buffer "*scratch*")   ; Switch to *scratch* buffer on startup
(setq initial-scratch-message "
; #+PROPERTY: header-args:jupyter-julia  :session ~/.kernel/emacs-julia-1.10-kernel.json
; #+PROPERTY: header-args:jupyter-julia  :session /ssh:vikash<hostname>:~/.kernel/emacs-julia-1.10-kernel.json
"); Although these are set in yasnippet I want it in here so that it can be pasted quickly in the org-mode
(setq use-dialog-box nil) 
(defalias 'yes-or-no-p 'y-or-n-p) ; no need to type yes and no in emacs
(display-time) ; display time in the modebar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode 1)
(electric-pair-mode t) ; always make two brackets or quotes 
(save-place-mode t)
(savehist-mode t)
(recentf-mode t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
;; (setq indent-line-function 'insert-tab)
(setq ring-bell-function 'ignore)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
;; These are for the transparancy
(set-frame-parameter nil 'alpha-background 100) ; For current frame
(add-to-list 'default-frame-alist '(alpha-background . 100))

(defvar bootstrap-version)
(let ((bootstrap-file
      (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
        "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
        'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(use-package org
  :straight t
  :ensure t)

(use-package highlight-numbers
  :straight t
  :ensure t)

(add-hook 'prog-mode-hook #'highlight-numbers-mode)

(use-package unicode-fonts
  :straight t
  :config 
  (unicode-fonts-setup))

(use-package nerd-icons
  :straight t
  ;; :custom
  ;; "Symbols Nerd Font Mono" is the default and is recommended but you can use any other Nerd Font if you want
  ;; (nerd-icons-font-family "Symbols Nerd Font Mono")
  )

(use-package dired-sidebar
  ;; This gives the option to have a nice sidebar with all the dired options.
  :ensure t
  :straight t
  :commands (dired-sidebar-toggle-sidebar))

 (setq dired-sidebar-subtree-line-prefix "__")
 (setq dired-sidebar-use-term-integration t)

(use-package nerd-icons-dired
  :straight t
  :hook
  (dired-mode . nerd-icons-dired-mode))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-numbers-number ((t (:aquamarineforeground "BlueViolet"))))  
 '(org-block ((t (:background "#F8F8FF" :extend t)))) ;; These are for light theme
 '(org-block-begin-line ((t (:foreground "gray1" :background "#EDEADE" :extend t)))) ; light theme
 '(org-block-end-line ((t (:foreground "gray1" :background "#EDEADE" :extend t)))) ; light theme
;  '(org-block ((t (:background "gray10" :extend t)))) ;For dark theme
 ;; '(org-block-begin-line ((t (:foreground "gray60" :background "#595959" :extend t)))) ;For dark  theme
 ;; '(org-block-end-line ((t (:foreground "gray60" :background "#595959" :extend t)))) ; for dark theme
 '(org-level-1 ((t (:foreground "DarkRed" :extend t)))) ; use VoiletRed1 in modus-vivendi
 '(org-level-2 ((t (:foreground "DarkRed" :extend t))))
 '(org-level-3 ((t (:foreground "DarkRed" :extend t))))
 '(org-level-4 ((t (:foreground "DarkRed" :extend t))))
 '(org-level-5 ((t (:foreground "DarkRed" :extend t))))
)

  (use-package evil
      :straight t
    :ensure t
    :init
    (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
    (setq evil-want-keybinding nil)
    :config
    (evil-mode 1))
 
    (use-package evil-collection
      :straight t
      :ensure t
      :after evil
      :config
     ; (evil-want-keybinding nil)
      (evil-collection-init))

    (use-package evil-escape
      :straight t
      :ensure t
      :config
      (evil-escape-mode 1)
      (setq-default evil-escape-key-sequence "fd"))

    (use-package evil-surround
      :straight t
      :ensure t
      :config
      (global-evil-surround-mode 1))

    (use-package evil-commentary
      :straight t
      :ensure t
      :config
      (evil-commentary-mode))

  (use-package evil-org
      :straight t
      :ensure t
      :config
      (add-hook 'org-mode-hook 'evil-org-mode))

;(define-key evil-normal-state-map (kbd "gj") 'evil-next-visual-line)
;;(define-key evil-insert-state-map (kbd "<tab>") 'tab-to-tab-stop)

(define-key evil-motion-state-map [remap evil-next-line] #'evil-next-visual-line)
(define-key evil-motion-state-map [remap evil-previous-line] #'evil-previous-visual-line)

(use-package doom-themes
  :straight t
  )
(use-package spacemacs-theme
  :straight t
  )

(load-theme 'modus-operandi t) 
;; (load-theme 'modus-vivendi t) 
;; (load-theme 'doom-gruvbox-light t) 
;;(load-theme 'spacemacs-light t)
(use-package doom-modeline
  :ensure t
  :straight t
  :hook (after-init . doom-modeline-mode))
(setq doom-modeline-height 20)
;; this is not a theme but colors the braces for better visibility
(use-package rainbow-delimiters
  :straight t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package flx
      :straight t
      :ensure t)

  (use-package ivy
    :straight t
    :config
      (setq ivy-use-virtual-buffers t
          ivy-count-format "(%d/%d) "
         ;; ivy-initial-inputs-alist nil
         ))

  (use-package counsel
    :straight t
    :ensure t
    :config
    (ivy-mode 1)
    (setq ivy-height 20)
    (setq ivy-re-builders-alist
      '((ivy-switch-buffer . ivy--regex-plus)
        (t . ivy--regex-fuzzy))))



  ;; (setf (alist-get 'counsel-ag ivy-re-builders-alist)
  ;;       #'ivy--regex-fuzzy)

;(global-set-key (kbd "TAB") (lambda () (interactive) (insert-char 32 4)))

(global-set-key (kbd "C-s") 'swiper-isearch)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "<f2> j") 'counsel-set-variable)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view)
  ;This sets ivy--regex-fuzzy as the fuzzy matching strategy for all Ivy completion.
  ;Optionally, you can also enable ivy-mode globally for all buffers. Add the following line to your configuration:

  (use-package ibuffer
    :straight t
     :config
    (evil-set-initial-state 'ibuffer-mode 'normal))

(use-package nerd-icons-ibuffer
  :ensure t
  :straight t
  :hook (ibuffer-mode . nerd-icons-ibuffer-mode))

  (use-package general
    :straight t
    :config
    (general-define-key
      :states '(normal visual insert emacs)
      :prefix "SPC"
      :non-normal-prefix "M-SPC"
      "b i" 'ibuffer
      "f f" 'counsel-find-file
      "m t" 'org-todo
       "n t" 'org-todo-list
  ))


(use-package yasnippet
  :straight t
  :config
  (yas-global-mode))
(define-key yas-minor-mode-map (kbd "TAB") 'yas-expand)
(define-key yas-minor-mode-map (kbd "<tab>") 'yas-expand)


(use-package yasnippet-snippets
  :straight t)

(setq yas-snippet-dirs (append yas-snippet-dirs
                               '("/home/vikash/.emacs.d/snippets")))
(use-package which-key
  :straight t
  :init
  (setq
   which-key-show-early-on-C-h t
   which-key-idle-delay 10000
   which-key-idle-secondary-delay 0.05
  which-key-popup-type 'minibuffer
  which-key-side-window-max-height 0.25)
  :config
  (which-key-mode) 
  )

;; ibuffer-sidebar seems to not work well
(use-package ibuffer-sidebar
  :straight t
  :commands (ibuffer-sidebar-toggle-sidebar)
  )

(defun +sidebar-toggle ()
  "Toggle both `dired-sidebar' and `ibuffer-sidebar'."
  (interactive)
  (dired-sidebar-toggle-sidebar)
  (ibuffer-sidebar-toggle-sidebar))

(use-package ivy-rich
  :straight t
  :init 
 (ivy-rich-mode 1))

(use-package nerd-icons-ivy-rich
  :straight t
  :ensure t
  :init
  (nerd-icons-ivy-rich-mode 1)
  )

  (use-package company
    :straight t
    :ensure t)

  ;; (add-hook 'org-mode-hook
  ;;           (lambda ()
  ;;             (setq-local company-backends
  ;;                         (cons 'company-capf company-backends))))

  (add-to-list 'company-backends 'company-dabbrev-code) 
  (add-to-list 'company-backends 'company-yasnippet)
  (add-to-list 'company-backends 'company-files)

  ;; somehow corfu doesnot work
  (use-package corfu
    :straight t
    :config
    (global-corfu-mode)
    (setq corfu-cycle t
          corfu-auto t
          corfu-commit-predicate nil
          corfu-quit-at-boundary t
          corfu-quit-no-match 'separator
          corfu-echo-documentation nil))

  (use-package orderless
    :straight t
    :config
    (setq completion-styles '(orderless)
          orderless-component-separator #'orderless-escapable-split-on-space))

  (global-set-key [remap completion-at-point] #'corfu-completion-at-point)
  (global-set-key [remap completion] #'corfu-completion)

  (with-eval-after-load 'corfu
    (setq corfu-auto-delay 0.2
          corfu-auto-prefix-style 'partial
          corfu-commit-delay 0.1
          corfu-echo-documentation nil
          corfu-quit-delay 0.2
          corfu-quick-help-delay 1.0
          corfu-quick-help-height 30))


  ;; Use Dabbrev with Corfu!
  (use-package dabbrev
    :straight t
    ;; Swap M-/ and C-M-/
    :bind (("M-/" . dabbrev-expand)
           ("C-M-/" . dabbrev-completion))
    :config
    (add-to-list 'dabbrev-ignored-buffer-regexps "\\` ")
    ;; Since 29.1, use `dabbrev-ignored-buffer-regexps' on older.
    (add-to-list 'dabbrev-ignored-buffer-modes 'doc-view-mode)
    (add-to-list 'dabbrev-ignored-buffer-modes 'pdf-view-mode))

  ;; Add extensions
  (use-package cape
    :straight t
    ;; Bind dedicated completion commands
    ;; Alternative prefix keys: C-c p, M-p, M-+, ...
    :bind (("C-c p p" . completion-at-point) ;; capf
           ("C-c p t" . complete-tag)        ;; etags
           ("C-c p d" . cape-dabbrev)        ;; or dabbrev-completion
           ("C-c p h" . cape-history)
           ("C-c p f" . cape-file)
           ("C-c p k" . cape-keyword)
           ("C-c p s" . cape-elisp-symbol)
           ("C-c p e" . cape-elisp-block)
           ("C-c p a" . cape-abbrev)
           ("C-c p l" . cape-line)
           ("C-c p w" . cape-dict)
           ("C-c p \\" . cape-tex)
           ("C-c p _" . cape-tex)
           ("C-c p ^" . cape-tex))
    :init
    ;; Add to the global default value of `completion-at-point-functions' which is
    ;; used by `completion-at-point'.  The order of the functions matters, the
    ;; first function returning a result wins.  Note that the list of buffer-local
    ;; completion functions takes precedence over the global list.
    (add-to-list 'completion-at-point-functions #'cape-dabbrev)
    (add-to-list 'completion-at-point-functions #'cape-file)
    (add-to-list 'completion-at-point-functions #'cape-elisp-block)
    ;;(add-to-list 'completion-at-point-functions #'cape-history)
    ;;(add-to-list 'completion-at-point-functions #'cape-keyword)
    ;;(add-to-list 'completion-at-point-functions #'cape-tex)
    ;;(add-to-list 'completion-at-point-functions #'cape-sgml)
    ;;(add-to-list 'completion-at-point-functions #'cape-rfc1345)
    ;;(add-to-list 'completion-at-point-functions #'cape-abbrev)
    ;;(add-to-list 'completion-at-point-functions #'cape-dict)
    ;;(add-to-list 'completion-at-point-functions #'cape-elisp-symbol)
    ;;(add-to-list 'completion-at-point-functions #'cape-line)
  )


(use-package yasnippet-capf
  :straight t
  :after cape
  :config
  (add-to-list 'completion-at-point-functions #'yasnippet-capf))
;; It expands automoatically which is annoying
(setopt corfu-on-exact-match 'show)
;; (require 'company-yasnippet)
;; (add-to-list 'completion-at-point-functions
;;                      (cape-company-to-capf #'company-yasnippet))


  (use-package emacs
    :straight t
    :init
    ;; TAB cycle if there are only few candidates
    (setq completion-cycle-threshold 3)
    ;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
    ;; Corfu commands are hidden, since they are not supposed to be used via M-x.
    ;; (setq read-extended-command-predicate
    ;;       #'command-completion-default-include-p)
    ;; Enable indentation+completion using the TAB key.
    ;; `completion-at-point' is often bound to M-TAB.
    (setq tab-always-indent 'complete))

  (use-package nerd-icons-corfu
    :straight t
    )
(add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter)

  ;; (add-hook 'org-mode-hook 'corfu-mode)

  ;; src block indentation / editing / syntax highlighting
  (setq org-src-fontify-natively t
        org-src-window-setup 'current-window ;; edit in current window
        org-src-strip-leading-and-trailing-blank-lines t
 ;       org-src-tab-acts-natively t
        org-latex-create-formula-image-program 'dvisvgm
        org-src-preserve-indentation t) ;; do not put two spaces on the left

(defun my/org-src-tab-width ()
  "Set tab width to 4 spaces in Org source blocks."
  (setq-local tab-width 4)
  (setq-local indent-tabs-mode nil))

;; Disable line number mode in several buffers;
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


;(add-hook 'org-mode-hook
;          (lambda ()
;            (add-hook 'org-src-mode-hook 'my/org-src-tab-width)))

(defun my/org-src-tab-insert ()
  "Insert 4 spaces instead of a tab in Org source blocks."
  (interactive)
  (if (org-in-src-block-p)
      (insert "   ")
    (call-interactively 'indent-for-tab-command)))

; (define-key org-src-mode-map (kbd "TAB") 'my/org-src-tab-insert)

(setq org-ellipsis " ····")

(use-package visual-fill-column
  :ensure t
  :commands visual-fill-column-mode)

(setq visual-fill-column-width 140
      visual-fill-column-center-text t)

(defun org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))

(add-hook 'org-mode-hook 'visual-fill-column-mode)
(add-hook 'ibuffer-mode-hook 'visual-fill-column-mode)
(add-hook 'org-mode-hook 'org-mode-setup)

    ;; (custom-set-faces
    ;; '(variable-pitch ((t (:family "CMU Sans Serif" :height 150)))))
(add-hook 'org-mode-hook 'variable-pitch-mode) 

  (defun org-font-setup ()
    ;; Replace list hyphen with dot
   (font-lock-add-keywords 'org-mode
                            '(("^ *\\([-]\\) "
                               (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

    ;; Set faces for heading levels
    (dolist (face '((org-level-1 . 1.40)
                    (org-level-2 . 1.30)
                    (org-level-3 . 1.2)
                    (org-level-4 . 1.1)
                    (org-level-5 . 1.05)
                    (org-level-6 . 1.05)
                    (org-level-7 . 1.05)
                    (org-level-8 . 1.05)))
      (set-face-attribute (car face) nil :font "CMU Typewriter Text" :weight 'Bold :height (cdr face)))

    ;; Ensure that anything that should be fixed-pitch in Org files appears that way
    (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
    (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
    (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
    (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
    (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
    (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
    (set-face-attribute 'org-document-info-keyword nil :inherit 'fixed-pitch)
    (set-face-attribute 'org-property-value nil :inherit 'fixed-pitch)
    (set-face-attribute 'org-tag nil :inherit 'fixed-pitch)
    (set-face-attribute 'org-block-begin-line nil :inherit 'fixed-pitch)
    (set-face-attribute 'org-block-end-line nil :inherit 'fixed-pitch)
    )
(org-font-setup)

(use-package org-bullets
  :straight t
  :ensure t
  :after org
  :hook (org-mode . org-bullets-mode)
  :config
  (setq org-bullets-bullet-list '("➜" "⤷" "⤷" "⤷" "⤷")))

;➀➁➂➃➄➅➆➇➈➉
;➜	
;✰✱✲✳✴✵✶✷✸✹✺	
;➥	
;⟾	
;⤿
;⟹🢂

(with-eval-after-load 'org
  ;; This is needed as of Org 9.2
  (require 'org-tempo)

  (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("py" . "src python"))
  (add-to-list 'org-structure-template-alist '("jp" . "src jupyter-python"))
  (add-to-list 'org-structure-template-alist '("jj" . "src jupyter-julia"))
)

(use-package gnuplot
  :straight t
  )

;; (use-package ob-async
;;   :straight t)

;; (use-package ob-ipython
;;   :straight t
;;   )

(use-package jupyter
  :straight t
  )


(use-package ess
:straight t
)

(use-package julia-mode
:straight t
)

(use-package julia-vterm
:straight t
)

  ; to prevent the funny indentation.

    (org-babel-do-load-languages
     'org-babel-load-languages
     '((emacs-lisp . t)
       (python . t)
       (jupyter . t)
       (shell . t)
       (latex . t)
       (dot . t)
       (gnuplot . t)
       (julia . t)
       )
     )

 (with-eval-after-load 'jupyter 
    (define-key jupyter-repl-mode-map (kbd "C-l") #'jupyter-repl-clear-cells)
    (define-key jupyter-repl-mode-map (kbd "TAB") #'company-complete-common-or-cycle)
   ; (define-key jupyter-org-interaction-mode-map (kbd "TAB") #'company-complete-common-or-cycle)
    (define-key jupyter-repl-interaction-mode-map (kbd "C-c C-r") #'jupyter-eval-line-or-region)
    (define-key jupyter-repl-interaction-mode-map (kbd "C-c M-r") #'jupyter-repl-restart-kernel)
    (define-key jupyter-repl-interaction-mode-map (kbd "C-c M-k") #'jupyter-shutdown-kernel)
   ; (add-hook 'jupyter-org-interaction-mode-hook (lambda ()  (company-mode)
   ;						   (setq company-backends '((company-capf))))) 
  ;  (add-hook 'jupyter-repl-mode-hook (lambda () (company-mode)
				;        :config (set-face-attribute
					;         'jupyter-repl-input-prompt nil :foreground "dim gray")
				       ; :config (set-face-attribute
					;         'jupyter-repl-input-prompt nil :background "lightblue")
				        ;; :config (set-face-attribute 'comment
				        ;; 			    nil :foreground "dim gray")
				        ;:config (set-face-attribute
					;         'jupyter-repl-output-prompt nil :foreground "black")
;				        (setq company-backends '((company-capf)))))
    ;; (add-hook 'jupyter-repl-mode-hook #'smartparens-mode)
    ;; (setq jupyter-repl-prompt-margin-width 4)
    )


(add-to-list 'org-src-lang-modes '("jupyter-julia" . julia))
(add-to-list 'org-src-lang-modes '("jupyter-python" . python))

(defalias 'org-babel-variable-assignments:jupyter-julia 'org-babel-variable-assignments:julia)
(add-hook 'julia-mode-hook #'julia-vterm-mode)
;; (setq org-ditaa-jar-path "/usr/share/java/ditaa/ditaa-0.11.jar")
(push '("conf-unix" . conf-unix) org-src-lang-modes)
(setq org-confirm-babel-evaluate nil)
;; Syntax highlight in #+BEGIN_SRC blocks
(setq org-src-fontify-natively t)

(add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)
;(add-hook org-babel-after-execute-hook 'org-display-inline-images 'append)

(global-set-key (kbd "<f7>") 'org-agenda)

(eval-after-load 'org-agenda
  '(progn
     (define-key org-agenda-mode-map "j" nil)
     (define-key org-agenda-mode-map "k" nil)))                                       ;

 (setq     org-agenda-start-with-log-mode t
      org-log-done 'time
      org-log-into-drawer t
      org-agenda-span 8
      org-agenda-start-on-weekday nil
      org-agenda-start-day "-3d"
      org-agenda-files
      '("~/Documents/OrgFiles/Tasksandmeetings.org"  ;; Tasksandmeeting.org
        "~/Documents/OrgFiles/Planning.org" ;; Planning.org
        "~/Documents/OrgFiles/Birthdays.org") ;; Birthdays.org
      org-todo-keywords
      '((sequence "TODO(t)" "STARTED" "|" "DONE(d)" "CANC(c)")
       (sequence "PLAN(p)" "REMINDER(r)" "WAIT(w@/!)" "|" "COMPLETED(c)" "CANCELLED(k@)" ))
      )


(setq org-refile-targets
      '(("~/Documents/Orgfiles/Archive.org" :maxlevel . 1)))

;; Save Org buffers after refiling!
(advice-add 'org-refile :after 'org-save-all-org-buffers)

(setq org-agenda-custom-commands
      '(("d" "Dashboard"
         ((agenda "" ((org-deadline-warning-days 7)))
          (todo "PLAN"
                ((org-agenda-overriding-header "planning")))
           (todo "TODO"
                ((org-agenda-overriding-header "todos")))
          (todo "REMINDER"
                ((org-agenda-overriding-header "Reminders")))))))

(setq org-capture-templates
      `(("t" "Tasks / Projects")
        ("tt" "Task" entry (file+olp "~/Documents/OrgFiles/Tasksandmeetings.org" "Meetings")
         "** TODO %?\n  %U\n  %a\n  %i" :empty-lines 1)
        ("p" "plan / Reminder")
        ("pp" "Plan" entry (file+olp "~/Documents/OrgFiles/Planning.org" "Future Plans")
         "** PLAN %?\n  %U\n  %a\n  %i" :empty-lines 1)
        ("j" "Journal Entries")
        ("jj" "Journal" entry
         (file+olp+datetree "~/Documents/OrgFiles/Journal.org")
         "\n* %<%I:%M %p> - Journal :journal:\n\n%?\n\n"
         :clock-in :clock-resume
         :empty-lines 1)
        ))

(define-key global-map (kbd "C-c j")
  (lambda () (interactive) (org-capture nil "jj")))

(define-key global-map (kbd "C-c p")
  (lambda () (interactive) (org-capture nil "pp")))

(define-key global-map (kbd "C-c t")
  (lambda () (interactive) (org-capture nil "tt")))

(use-package org-roam
  :ensure t
  :straight t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/Documents/my_notes/RoamNotes")
  (org-roam-completion-everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         :map org-mode-map
         ("C-M-i"    . completion-at-point))
  :config
  (org-roam-setup))

  (use-package citar-org-roam
  :straight t
  :after (citar org-roam)
  :config (citar-org-roam-mode))

 (use-package project :straight t) ;; Somehow the project is removed 

  (use-package eglot
    :straight t
;    :hook
     ;; (c-mode-hook . eglot-ensure)
     ;; (f90-mode-hook . eglot-ensure)
    )

(with-eval-after-load 'eglot
   (setq completion-category-defaults nil))

(advice-add 'eglot-completion-at-point :around #'cape-wrap-buster)

    (use-package tree-sitter
      :straight t
      :init
       (global-tree-sitter-mode))

    (use-package tree-sitter-langs
      :straight t
    )
  ;; (add-hook 'python-mode-hook #'tree-sitter-mode)

(setq treesit-language-source-alist
      '(
     (bash "https://github.com/tree-sitter/tree-sitter-bash")
     (cmake "https://github.com/uyha/tree-sitter-cmake")
     (elisp "https://github.com/Wilfred/tree-sitter-elisp")
     (json "https://github.com/tree-sitter/tree-sitter-json")
     (make "https://github.com/alemuller/tree-sitter-make")
     (markdown "https://github.com/ikatyang/tree-sitter-markdown")
     (python "https://github.com/tree-sitter/tree-sitter-python")
     (yaml "https://github.com/ikatyang/tree-sitter-yaml")
     (fortran  "https://github.com/stadelmanma/tree-sitter-fortran")
     (c "https://github.com/tree-sitter/tree-sitter-c")
     (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
     (cuda "https://github.com/theHamsta/tree-sitter-cuda")
     (julia "https://github.com/tree-sitter/tree-sitter-julia")
     (latex "https://github.com/latex-lsp/tree-sitter-latex")
     (org"https://github.com/milisims/tree-sitter-org")
   ))

 (defun my/set-latex-font ()
  "Set a different font for LaTeX files."
  (face-remap-add-relative 'default :family "CMU Typewriter Text" :height 170))

(add-hook 'LaTeX-mode-hook 'my/set-latex-font)

;; latex config 
;; this is for reading pdf in emacs;
(use-package pdf-tools
  :straight t)
(pdf-tools-install)

(defun my/hooks_pdf_tools ()
  "Disable line numbers in the current buffer."
  (display-line-numbers-mode -1)
  (auto-revert-mode 1)
)

(add-hook 'pdf-view-mode-hook 'my/hooks_pdf_tools)

(use-package auctex
  :straight t
  )

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master 'nil)

(use-package xenops
  :straight t )
;;   ;:config
;; (add-hook LaTeX-mode-hook xenops-mode)
;; (add-hook LaTeX-mode-hook #'xenops-mode))

;; Add this to .emacs.d/init.el:
(with-eval-after-load "tex"
  ;; enable synctex support for latex-mode
  (add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
  ;; add a new view program
  (add-to-list 'TeX-view-program-list
        '("Zathura"
          ("zathura" " %o"
           (mode-io-correlate " --synctex-forward %n:0:%b"))))
  (setcdr (assq 'output-pdf TeX-view-program-selection) '("Zathura")))



(setq xenops-reveal-on-entry t
      xenops-image-directory (expand-file-name "xenops/image" user-emacs-directory)
      xenops-math-latex-process 'dvisvgm
      xenops-math-image-scale-factor 0.7
      )

(defun xenops-math-reveal (element)
  "Remove image overlay for ELEMENT.
If a prefix argument is in effect, also delete its cache file."
  (xenops-element-overlays-delete element)
  (if current-prefix-arg
      (delete-file (xenops-math-get-cache-file element)))
  ;; TODO: is :begin-content for block math off by one?
  (let ((element-type (plist-get element :type))
        (begin-content (plist-get element :begin-content)))
    )
  (xenops-math-render-below-maybe element))

(use-package cdlatex
:straight t
)
(defun my/latex-hooks ()
 (turn-on-cdlatex)
 (visual-line-mode t)
 (visual-fill-column-mode t)
)

(add-hook 'LaTeX-mode-hook 'my/latex-hooks)
(add-hook 'latex-mode-hook 'my/latex-hooks)

(add-hook 'pdf-view-mode 'pdf-view-themed-minor-mode)   ; normal emacs latex mode
(set-default 'preview-scale-function 1.1)

(defvar pdf-minimal-width 72
  "Minimal width of a window displaying a pdf.
If an integer, number of columns.  If a float, fraction of the
original window.")

(defvar pdf-split-width-threshold 120
  "Minimum width a window should have to split it horizontally
for displaying a pdf in the right.")

(use-package citar
  :straight t
  :hook
  (LaTeX-mode . citar-capf-setup)
  (org-mode . citar-capf-setup)
  :custom
  (citar-bibliography '("/home/vikash/Documents/my_notes/bib/references.bib")))

(add-to-list 'completion-at-point-functions #'citar-capf)
(setq citar-search-function #'citar-ivy-filter)

(use-package bibtex
  :straight t
  :custom
  (bibtex-dialect 'BibTeX)
  (bibtex-user-optional-fields
   '(("keywords" "Keywords to describe the entry" "")
     ("file" "Link to a document file." "" )))
  (bibtex-align-at-equal-sign t))

(use-package citar-embark
  :straight t
  :after citar embark
  :no-require
  :config (citar-embark-mode))

(use-package biblio
  :straight t)

; Seems like flyspell is already installed in emacs; just set it up
  (dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))

;; (global-set-key (kbd "<f8>") 'ispell-word)
;; to note vim key-binding z= also works for ispell=word checking
(global-set-key (kbd "C-S-<f8>") 'flyspell-mode)
(global-set-key (kbd "C-M-<f8>") 'flyspell-buffer)
(global-set-key (kbd "C-<f8>") 'flyspell-check-previous-highlighted-word)
(defun flyspell-check-next-highlighted-word ()
  "Custom function to spell check next highlighted word"
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word)
  )
(global-set-key (kbd "M-<f8>") 'flyspell-check-next-highlighted-word)

(use-package langtool
  :straight t)
(setq langtool-java-classpath
      "/usr/share/languagetool:/usr/share/java/languagetool/*")

 (use-package magit
  :straight t
  :commands magit-status
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; NOTE: Make sure to configure a GitHub token before using this package!
;; - https://magit.vc/manual/forge/Token-Creation.html#Token-Creation
;; - https://magit.vc/manual/ghub/Getting-Started.html#Getting-Started
(use-package forge
  :straight t
  :after magit)

(use-package ellama
  :straight t
  :ensure t
  :bind ("C-c e" . ellama-transient-main-menu)
  ;; send last message in chat buffer with C-c C-c
  :hook (org-ctrl-c-ctrl-c-final . ellama-chat-send-last-message)
  :init (setopt ellama-auto-scroll t)
  :config
  ;; show ellama context in header line in all buffers
  (ellama-context-header-line-global-mode +1))

  (use-package markdown-mode
  :ensure t
  :straight t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
         ("C-c C-e" . markdown-do)))
(use-package yaml-mode
:ensure t
:straight t)

  (use-package emms
    :straight t
    :init
    (require 'emms-setup)
    (require 'emms-mpris)
    (emms-all)
    (emms-default-players)
    (emms-mpris-enable)
    :hook
    (emms-browser-mode . visual-fill-column-mode)
    :custom
    (emms-source-file-default-directory "~/Music")
    (emms-browser-covers #'emms-browser-cache-thumbnail-async)
    :bind
    (("<f5>"   . emms-browser)
     ("M-<f5>" . emms)
     ("M-p" . emms-previous)
     ("M-n" . emms-next)
     ("M-s" . emms-pause)))

(emms-all)
(setq emms-player-list '(emms-player-mpv)
      emms-info-functions '(emms-info-native))

(add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-application-framework/")
;; (require 'eaf)
;; (require 'eaf-browser)
;; (require 'eaf-pdf-viewer)

(use-package windresize
  :straight t)

(global-set-key (kbd "<f2>") 'windresize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-selection
   '(((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "Zathura")
     (output-dvi "Zathura")
     (output-pdf "Zathura")
     (output-html "xdg-open")))
 '(display-time-24hr-format t)
 '(f90-comment-region "!!")
 '(org-agenda-window-setup 'only-window)
 '(org-highlight-latex-and-related '(native))
 '(tex-fontify-script nil)
'(org-startup-folded t))
