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
(defvar default-font-size 130)
(defvar default-variable-font-size 130)

;; Make frame transparency overridable
(defvar frame-transparency '(90 . 90))

(use-package spacegray-theme :defer t)
(use-package doom-themes :defer t)
(load-theme 'doom-city-lights t)
(doom-themes-visual-bell-config)

;; (load-theme 'gruvbox-dark-soft t)
;; (doom-themes-visual-bell-config)

;; You must run (all-the-icons-install-fonts) one time after
;; installing this package!
(use-package all-the-icons)

(use-package doom-modeline
  :init (doom-modeline-mode 1))
  ;;:custom ((doom-modeline-height 15))
(setq doom-modeline-height 3)
(use-package minions
  :hook (doom-modeline-mode . minions-mode))
(setq display-time-24hr-format t)

(set-face-attribute 'default nil :font "Fira Code Retina" :height 135 :weight 'Semibold)
;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "Fira Code Retina" :height 135 :weight 'Semibold)


;; (set-face-attribute 'default nil :font "Source Code Pro Semibold" :height default-font-size)
;; Set the fixed pitch face
;; (set-face-attribute 'fixed-pitch nil :font "Source Code Pro Semibold" :height default-font-size)

                                        ;          (set-face-attribute 'default nil :font "Fira Code Medium" :height default-font-size)
;; Set the fixed pitch face
                                        ;          (set-face-attribute 'fixed-pitch nil :font "Fira Code Medium" :height default-font-size)
;; Set the variable pitch face

;; (set-face-attribute 'default nil :font "IBM Plex Serif" :height 145)
(set-face-attribute 'variable-pitch nil :font "Fira Code Retina" :height 145 :weight 'Semibold)

                                        ;      (use-package fira-code-mode
                                        ;      :config (global-fira-code-mode))

;; (use-package rainbow-delimiters
;; :hook (prog-mode . rainbow-delimiters-mode))

(add-hook 'prog-mode-hook 'highlight-numbers-mode)

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
(electric-pair-mode)
(display-time-mode 1)

(setq blink-matching-paren nil)
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)
(abbrev-mode t)
(setq ring-bell-function 'ignore)
(setq visible-bell t)

;I guess will use the yas mode everywhere
     (yas-global-mode 1)
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

(global-set-key (kbd "<f6>") 'elfeed)
(global-set-key (kbd "<f7>") 'mu4e)
(defun mp-add-elfeed-keys ()
  (local-set-key (kbd "C-a") 'elfeed-update))

(add-hook 'elfeed-search-mode-hook 'mp-add-elfeed-keys)

(global-set-key (kbd "\eo") 'other-window)
(global-set-key (kbd "RET") 'newline-and-indent)
(define-key global-map "\ef" 'counsel-find-file) 
(global-set-key (read-kbd-macro "\eb") 'ivy-switch-buffer)
(define-key global-map "\eg" 'goto-line)
(define-key global-map "\en" 'next-error)
(define-key global-map "\eN" 'previous-error)

(global-set-key (kbd "C-s") 'swiper-isearch)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "<f2> j") 'counsel-set-variable)
(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view)

(global-set-key (kbd "C-c c") 'counsel-compile)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c L") 'counsel-git-log)
(global-set-key (kbd "C-c k") 'counsel-rg)
(global-set-key (kbd "C-c m") 'counsel-linux-app)
(global-set-key (kbd "C-c n") 'counsel-fzf)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-c J") 'counsel-file-jump)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(global-set-key (kbd "C-c w") 'counsel-wmctrl)

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

(package-install-file "/home/vikash/.emacs.d/pkgs/julia-vterm.el/julia-vterm.el")
(org-babel-do-load-languages
  'org-babel-load-languages
  '((emacs-lisp . t)
    (python . t)
    (julia-vterm . t)
    (ipython . t)
    (shell . t)
    (latex . t)
    (ditaa . t)
    (dot . t)
    (gnuplot . t)))

(add-hook 'julia-mode-hook #'julia-vterm-mode)
(setq org-ditaa-jar-path "/usr/share/java/ditaa/ditaa-0.11.jar")
(push '("conf-unix" . conf-unix) org-src-lang-modes)
(setq org-confirm-babel-evaluate nil)
;; Syntax highlight in #+BEGIN_SRC blocks
(setq org-src-fontify-natively t)

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(use-package org-tempo)
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))
(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("tex" . "src latex"))

(defun org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.3)
                  (org-level-2 . 1.25)
                  (org-level-3 . 1.15)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "Fira Code Retina" :weight 'Semibold :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)
  )

(defun org-mode-visual-fill ()
  (setq visual-fill-column-width 110
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . org-mode-visual-fill))

(use-package which-key)

    (defun efs/lsp-mode-setup ()
      (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
      (lsp-headerline-breadcrumb-mode))

    (use-package lsp-mode
      :commands (lsp lsp-deferred)
      :hook (lsp-mode . efs/lsp-mode-setup)
      :init
      (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
      :config
      (lsp-enable-which-key-integration t))
(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))

(use-package company
    :after lsp-mode
    :hook (lsp-mode . company-mode)
    :bind (:map company-active-map
	   ("<tab>" . company-complete-selection))
	  (:map lsp-mode-map
	   ("<tab>" . company-indent-or-complete-common))
    :custom
    (company-minimum-prefix-length 1)
    (company-idle-delay 0.0))

  (use-package lsp-treemacs
      :after lsp)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master t)
;; lets try lsp


(add-hook 'LaTeX-mode-hook
          '(lambda ()
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

(use-package reftex
  ;; :defer 3
  :commands turn-on-reftex
  :hook ((latex-mode LaTeX-mode) . turn-on-reftex)
  :config
  (setq reftex-plug-into-AUCTeX t))

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

(use-package cdlatex
  :ensure t
  ;; :defer 2
  ;; :commands turn-on-cdlatex
  :hook (LaTeX-mode . turn-on-cdlatex)
  :config
  (progn
    (setq cdlatex-command-alist
          '(("vc" "Insert \\vect{}" "\\vect{?}"
             cdlatex-position-cursor nil nil t)
            ("smat" "Insert smallmatrix env"
             "\\left( \\begin{smallmatrix} ? \\end{smallmatrix} \\right)"
             cdlatex-position-cursor nil nil t)
            ("bmat" "Insert bmatrix env"
             "\\begin{bmatrix} ? \\end{bmatrix}"
             cdlatex-position-cursor nil nil t)
            ("pmat" "Insert pmatrix env"
             "\\begin{pmatrix} ? \\end{pmatrix}"
             cdlatex-position-cursor nil nil t)
            ("equ*" "Insert equation* env"
             "\\begin{equation*}\n?\n\\end{equation*}"
             cdlatex-position-cursor nil t nil)
            ("sn*" "Insert section* env"
             "\\section*{?}"
             cdlatex-position-cursor nil t nil)
            ("ss*" "Insert subsection* env"
             "\\subsection*{?}"
             cdlatex-position-cursor nil t nil)
            ("sss*" "Insert subsubsection* env"
             "\\subsubsection*{?}"
             cdlatex-position-cursor nil t nil)))

    (setq cdlatex-math-symbol-alist '((?F ("\\Phi"))
                                      (?o ("\\omega" "\\mho" "\\mathcal{O}"))
                                      (?6 ("\\partial"))
                                      (?v ("\\vee" "\\forall"))))
    (setq cdlatex-math-modify-alist '((?b "\\mathbb" "\\textbf" t nil nil)
                                      (?B "\\mathbf" "\\textbf" t nil nil)))
    (setq cdlatex-paired-parens "$[{("))
  )

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

(add-hook 'fortran-mode-hook 'lsp)
;; (add-to-list 'lsp-language-id-configuration '(fortran-mode . "fortran"))

(add-hook 'python-mode-hook 'lsp)
;; (add-to-list 'lsp-language-id-configuration '(python-mode . "python"))

(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

  ;; (use-package evil-magit
  ;; :after magit)

;; NOTE: Make sure to configure a GitHub token before using this package!
;; - https://magit.vc/manual/forge/Token-Creation.html#Token-Creation
;; - https://magit.vc/manual/ghub/Getting-Started.html#Getting-Started
(use-package forge)

(defun org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))

(use-package org
  :hook (org-mode . org-mode-setup)
  :config
  (setq org-ellipsis " ▾")

  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)

  (setq org-agenda-files
        '("~/Documents/OrgFiles/Tasks.org"
          "~/Documents/OrgFiles/Habits.org"
          "~/Documents/OrgFiles/Birthdays.org"))

  (require 'org-habit)
  (add-to-list 'org-modules 'org-habit)
  (setq org-habit-graph-column 60)

  (setq org-todo-keywords
    '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
      (sequence "BACKLOG(b)" "PLAN(p)" "READY(r)" "ACTIVE(a)" "REVIEW(v)" "WAIT(w@/!)" "HOLD(h)" "|" "COMPLETED(c)" "CANC(k@)")))

  (setq org-refile-targets
    '(("Archive.org" :maxlevel . 1)
      ("Tasks.org" :maxlevel . 1)))

  ;; Save Org buffers after refiling!
  (advice-add 'org-refile :after 'org-save-all-org-buffers)

  (setq org-tag-alist
    '((:startgroup)
       ; Put mutually exclusive tags here
       (:endgroup)
       ("@errand" . ?E)
       ("@home" . ?H)
       ("@work" . ?W)
       ("agenda" . ?a)
       ("planning" . ?p)
       ("publish" . ?P)
       ("batch" . ?b)
       ("note" . ?n)
       ("idea" . ?i)))

  ;; Configure custom agenda views
  (setq org-agenda-custom-commands
   '(("d" "Dashboard"
     ((agenda "" ((org-deadline-warning-days 7)))
      (todo "NEXT"
        ((org-agenda-overriding-header "Next Tasks")))
      (tags-todo "agenda/ACTIVE" ((org-agenda-overriding-header "Active Projects")))))

    ("n" "Next Tasks"
     ((todo "NEXT"
        ((org-agenda-overriding-header "Next Tasks")))))

    ("W" "Work Tasks" tags-todo "+work-email")

    ;; Low-effort next actions
    ("e" tags-todo "+TODO=\"NEXT\"+Effort<15&+Effort>0"
     ((org-agenda-overriding-header "Low Effort Tasks")
      (org-agenda-max-todos 20)
      (org-agenda-files org-agenda-files)))

    ("w" "Workflow Status"
     ((todo "WAIT"
            ((org-agenda-overriding-header "Waiting on External")
             (org-agenda-files org-agenda-files)))
      (todo "REVIEW"
            ((org-agenda-overriding-header "In Review")
             (org-agenda-files org-agenda-files)))
      (todo "PLAN"
            ((org-agenda-overriding-header "In Planning")
             (org-agenda-todo-list-sublevels nil)
             (org-agenda-files org-agenda-files)))
      (todo "BACKLOG"
            ((org-agenda-overriding-header "Project Backlog")
             (org-agenda-todo-list-sublevels nil)
             (org-agenda-files org-agenda-files)))
      (todo "READY"
            ((org-agenda-overriding-header "Ready for Work")
             (org-agenda-files org-agenda-files)))
      (todo "ACTIVE"
            ((org-agenda-overriding-header "Active Projects")
             (org-agenda-files org-agenda-files)))
      (todo "COMPLETED"
            ((org-agenda-overriding-header "Completed Projects")
             (org-agenda-files org-agenda-files)))
      (todo "CANC"
            ((org-agenda-overriding-header "Cancelled Projects")
             (org-agenda-files org-agenda-files)))))))

  (setq org-capture-templates
    `(("t" "Tasks / Projects")
      ("tt" "Task" entry (file+olp "~/Documents/OrgFiles/Tasks.org" "Inbox")
           "* TODO %?\n  %U\n  %a\n  %i" :empty-lines 1)

      ("j" "Journal Entries")
      ("jj" "Journal" entry
           (file+olp+datetree "~/Documents/OrgFiles/Journal.org")
           "\n* %<%I:%M %p> - Journal :journal:\n\n%?\n\n"
           ;; ,(dw/read-file-as-string "~/Notes/Templates/Daily.org")
           :clock-in :clock-resume
           :empty-lines 1)
      ("jm" "Meeting" entry
           (file+olp+datetree "~/Documents/OrgFiles/Journal.org")
           "* %<%I:%M %p> - %a :meetings:\n\n%?\n\n"
           :clock-in :clock-resume
           :empty-lines 1)

      ("w" "Workflows")
      ("we" "Checking Email" entry (file+olp+datetree "~/Documents/OrgFiles/Journal.org")
           "* Checking Email :email:\n\n%?" :clock-in :clock-resume :empty-lines 1)

      ("m" "Metrics Capture")
      ("mw" "Weight" table-line (file+headline "~/Documents/OrgFiles/Metrics.org" "Weight")
       "| %U | %^{Weight} | %^{Notes} |" :kill-buffer t)))

  (define-key global-map (kbd "C-c j")
    (lambda () (interactive) (org-capture nil "jj")))

  (org-font-setup))

(require 'org-mime)

  (add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e/")
  (require 'mu4e)

  (setq mu4e-maildir (expand-file-name "~/.Maildir"))

  ; get mail
  (setq mu4e-get-mail-command "mbsync -c ~/.emacs.d/mu4e/.mbsyncrc -a"
    ;; mu4e-html2text-command "w3m -T text/html" ;;using the default mu4e-shr2text
    mu4e-view-prefer-html t
    mu4e-update-interval 1200
    mu4e-headers-auto-update t
    mu4e-compose-signature-auto-include nil
    mu4e-compose-format-flowed t)

  ;; to view selected message in the browser, no signin, just html mail
  (add-to-list 'mu4e-view-actions
    '("ViewInBrowser" . mu4e-action-view-in-browser) t)

  ;; enable inline images
  (setq mu4e-view-show-images t)
  ;; use imagemagick, if available
  (when (fboundp 'imagemagick-register-types)
    (imagemagick-register-types))

  ;; every new email composition gets its own frame!
  (setq mu4e-compose-in-new-frame t)

  ;; don't save message to Sent Messages, IMAP takes care of this
  (setq mu4e-sent-messages-behavior 'delete)

  (add-hook 'mu4e-view-mode-hook #'visual-line-mode)

  ;; <tab> to navigate to links, <RET> to open them in browser
  (add-hook 'mu4e-view-mode-hook
    (lambda()
  ;; try to emulate some of the eww key-bindings
  (local-set-key (kbd "<RET>") 'mu4e~view-browse-url-from-binding)
  (local-set-key (kbd "<tab>") 'shr-next-link)
  (local-set-key (kbd "<backtab>") 'shr-previous-link)))

  ;; from https://www.reddit.com/r/emacs/comments/bfsck6/mu4e_for_dummies/elgoumx
  (add-hook 'mu4e-headers-mode-hook
        (defun my/mu4e-change-headers ()
          (interactive)
          (setq mu4e-headers-fields
                `((:human-date . 25) ;; alternatively, use :date
                  (:flags . 6)
                  (:from . 22)
                  (:thread-subject . ,(- (window-body-width) 70)) ;; alternatively, use :subject
                  (:size . 7)))))

  ;; if you use date instead of human-date in the above, use this setting
  ;; give me ISO(ish) format date-time stamps in the header list
  ;(setq mu4e-headers-date-format "%Y-%m-%d %H:%M")

  ;; spell check

(setq mail-user-agent 'mu4e-user-agent)
(use-package org-msg
  :config
  (setq org-msg-options "html-postamble:nil H:5 num:nil ^:{} toc:nil tex:dvipng")
  (setq org-msg-startup "hidestars indent inlineimages")
  (setq org-msg-greeting-fmt "\n%s,\n\n")
  (setq org-msg-greeting-fmt-mailto t)
  (setq org-msg-signature "
            #+begin_signature
            -- *Vikash Pandey* \\\\
                Research Scholar \\\\
                TIFR-Hyderabad \\\\
            #+end_signature")
  (org-msg-mode))

  ;; (add-hook 'mu4e-compose-mode-hook
  ;;     (defun my-do-compose-stuff ()
  ;;        "My settings for message composition."
  ;;        (visual-line-mode)
  ;;        (org-mu4e-compose-org-mode)
  ;;            (use-hard-newlines -1)
  ;;        (flyspell-mode)))

  (setq org-mime-export-options '(:section-numbers nil
                                  :with-author nil
                                  :with-toc nil))
  (require 'smtpmail)

  ;;rename files when moving
  ;;NEEDED FOR MBSYNC
  (setq mu4e-change-filenames-when-moving t)

  ;;set up queue for offline email
  ;;use mu mkdir  ~/Maildir/acc/queue to set up first
  (setq smtpmail-queue-mail nil)  ;; start in normal mode

  ;;from the info manual
  (setq mu4e-attachment-dir  "~/Downloads")

  (setq message-kill-buffer-on-exit t)
  (setq mu4e-compose-dont-reply-to-self t)

  (require 'org-mu4e)

  ;; convert org mode to HTML automatically
  (setq org-mu4e-convert-to-html t)

  ;;from vxlabs config
  ;; show full addresses in view message (instead of just names)
  ;; toggle per name with M-RET
  (setq mu4e-view-show-addresses 't)

  ;; don't ask when quitting
  (setq mu4e-confirm-quit nil)

  ;; mu4e-context
  (setq mu4e-context-policy 'pick-first)
  (setq mu4e-compose-context-policy 'always-ask)
  (setq mu4e-contexts
    (list
     (make-mu4e-context
      :name "work" ;;for acc1-gmail
      :enter-func (lambda () (mu4e-message "Entering context work"))
      :leave-func (lambda () (mu4e-message "Leaving context work"))
      :match-func (lambda (msg)
                    (when msg
                  (mu4e-message-contact-field-matches
                   msg '(:from :to :cc :bcc) "vikashpandey.phy@gmail.com")))
      :vars '((user-mail-address . "vikashpandey.phy@gmail.com")
              (user-full-name . "Vikash Pandey")
              (mu4e-sent-folder . "/vikashpandey.phy-gmail/[vikashpandey.phy].Sent Mail")
              (mu4e-drafts-folder . "/vikashpandey.phy-gmail/[vikashpandey.phy].drafts")
              (mu4e-trash-folder . "/vikashpandey.phy-gmail/[vikashpandey.phy].Trash")
              (mu4e-compose-signature . (concat "Formal Signature\n" "Emacs 25, org-mode 9, mu4e 1.0\n"))
              (mu4e-compose-format-flowed . t)
              (smtpmail-queue-dir . "~/.Maildir/vikashpandey.phy-gmail/queue/cur")
              (message-send-mail-function . smtpmail-send-it)
              (smtpmail-smtp-user . "vikashpandey.phy")
              (smtpmail-starttls-credentials . (("smtp.gmail.com" 587 nil nil)))
              (smtpmail-auth-credentials . (expand-file-name "~/.authinfo.gpg"))
              (smtpmail-default-smtp-server . "smtp.gmail.com")
              (smtpmail-smtp-server . "smtp.gmail.com")
              (smtpmail-smtp-service . 587)
              (smtpmail-debug-info . t)
              (smtpmail-debug-verbose . t)
              (mu4e-maildir-shortcuts . ( ("/vikashpandey.phy-gmail/INBOX"            . ?i)
                                          ("/vikashpandey.phy-gmail/[vikashpandey.phy].Sent Mail" . ?s)
                                          ("/vikashpandey.phy-gmail/[vikashpandey.phy].Trash"       . ?t)
                                          ("/vikashpandey.phy-gmail/[vikashpandey.phy].All Mail"  . ?a)
                                          ("/vikashpandey.phy-gmail/[vikashpandey.phy].Starred"   . ?r)
                                          ("/vikashpandey.phy-gmail/[vikashpandey.phy].drafts"    . ?d)
                                          ))))
     (make-mu4e-context
      :name "personal" ;;for acc2-gmail
      :enter-func (lambda () (mu4e-message "Entering context personal"))
      :leave-func (lambda () (mu4e-message "Leaving context personal"))
      :match-func (lambda (msg)
                    (when msg
                  (mu4e-message-contact-field-matches
                   msg '(:from :to :cc :bcc) "vikashp@tifrh.res.in")))
      :vars '((user-mail-address . "vikashp@tifrh.res.in")
              (user-full-name . "Vikash Pandey")
              (mu4e-sent-folder . "/vikashp-gmail/[vikashp].Sent Mail")
              (mu4e-drafts-folder . "/vikashp-gmail/[vikashp].drafts")
              (mu4e-trash-folder . "/vikashp-gmail/[vikashp].Trash")
              (mu4e-compose-signature . (concat "Vikash Pandey\n" "Emacs is awesome!\n"))
              (mu4e-compose-format-flowed . t)
              (smtpmail-queue-dir . "~/.Maildir/vikashp-gmail/queue/cur")
              (message-send-mail-function . smtpmail-send-it)
              (smtpmail-smtp-user . "vikashp@tifrh.res.in")
              (smtpmail-starttls-credentials . (("smtp.gmail.com" 587 nil nil)))
              (smtpmail-auth-credentials . (expand-file-name "~/.authinfo.gpg"))
              (smtpmail-default-smtp-server . "smtp.gmail.com")
              (smtpmail-smtp-server . "smtp.gmail.com")
              (smtpmail-smtp-service . 587)
              (smtpmail-debug-info . t)
              (smtpmail-debug-verbose . t)
              (mu4e-maildir-shortcuts . ( ("/vikashp-gmail/INBOX"            . ?i)
                                          ("/vikashp-gmail/[vikashp].Sent Mail" . ?s)
                                          ("/vikashp-gmail/[vikashp].Trash"     . ?t)
                                          ("/vikashp-gmail/[vikashp].All Mail"  . ?a)
                                          ("/vikashp-gmail/[vikashp].Starred"   . ?r)
                                          ("/vikashp-gmail/[vikashp].drafts"    . ?d)
                                          ))))))

;; need to figure out how to push relevant article to some file 
(require 'elfeed)
;; (require 'elfeed-org)
;; (elfeed-org)
;; (setq rmh-elfeed-org-files (list "~/.emacs.d/elfeed.org"))
(setq elfeed-feeds
      '(("https://www.archlinux.org/feeds/news/" archlinux)
      ("http://www.smbc-comics.com/rss.php" smbc comic)
      ("https://www.xkcd.com/rss.xml" xkcd comic)
;;       ; ("http://emacsrocks.com/atom.xml" emacsrocks emacs)
      ("https://phys.org/rss-feed/breaking/space-news/space-exploration/" space-sci)
       ("http://export.arxiv.org/api/query?search_query=physics.ed-ph&start=0&max_results=10&sortBy=submittedDate&sortOrder=descending" phy-ed)
       ("http://export.arxiv.org/api/query?search_query=cond-mat.stat-mech&start=0&max_results=10&sortBy=submittedDate&sortOrder=descending" cond-mat)
       ("http://export.arxiv.org/api/query?search_query=physics.hist-ph&start=0&max_results=10&sortBy=submittedDate&sortOrder=descending" hist-ph)
       ("http://export.arxiv.org/api/query?search_query=physics.flu-dyn&start=0&max_results=30&sortBy=submittedDate&sortOrder=descending" fluid-dyn)
       ;; ("https://arxiv.org/list/physics.ao-ph/recent" arxiv atmosphere and oceanic)
;      ("http://export.arxiv.org/rss/physics.hist-ph" arxiv hist and philosophy physics)
      ; ("http://export.arxiv.org/rss/physics.ed-ph" arxiv physics education)
      ; ("http://export.arxiv.org/rss/cond-mat.stat-mech" arxiv condensed matter)
       ))

(defun concatenate-authors (authors-list)
  "Given AUTHORS-LIST, list of plists; return string of all authors
concatenated."
  (mapconcat
   (lambda (author) (plist-get author :name))
   authors-list ", "))


(defun my-search-print-fn (entry)
  "Print ENTRY to the buffer."
  (let* ((date (elfeed-search-format-date (elfeed-entry-date entry)))
         (title (or (elfeed-meta entry :title)
                    (elfeed-entry-title entry) ""))
         (title-faces (elfeed-search--faces (elfeed-entry-tags entry)))
         (feed (elfeed-entry-feed entry))
         (feed-title
          (when feed
            (or (elfeed-meta feed :title) (elfeed-feed-title feed))))
         (entry-authors (concatenate-authors
                         (elfeed-meta entry :authors)))
         (tags (mapcar #'symbol-name (elfeed-entry-tags entry)))
         (tags-str (mapconcat
                    (lambda (s) (propertize s 'face
                                            'elfeed-search-tag-face))
                    tags ","))
         (title-width (- (window-width) 10
                         elfeed-search-trailing-width))
         (title-column (elfeed-format-column
                        title (elfeed-clamp
                               elfeed-search-title-min-width
                               title-width
                               100)
                        :left))
         (authors-width 50)
         (authors-column (elfeed-format-column
                        entry-authors (elfeed-clamp
                               elfeed-search-title-min-width
                               authors-width
                               50)
                        :left)))

    (insert (propertize date 'face 'elfeed-search-date-face) " ")

    (insert (propertize title-column
                        'face title-faces 'kbd-help title) " ")

    (insert (propertize authors-column
                        'face 'elfeed-search-date-face
                        'kbd-help entry-authors) " ")

    ;; (when feed-title
    ;;   (insert (propertize entry-authors
    ;; 'face 'elfeed-search-feed-face) " "))

;    (when entry-authors
 ;     (insert (propertize feed-title
;			  'face 'elfeed-search-feed-face) " "))

    ;; (when tags
    ;;   (insert "(" tags-str ")"))

    )
  )
(setq elfeed-search-print-entry-function #'my-search-print-fn)

(require 'elfeed-score)
(elfeed-score-enable)
(define-key elfeed-search-mode-map "=" elfeed-score-map) ; need to see if this works
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(julia-vterm ztree zmq yasnippet-snippets yasnippet-classic-snippets xml+ which-key websocket visual-fill-column visual-fill use-package treemacs-icons-dired tree-sitter-langs smtpmail-multi simple-httpd request rainbow-identifiers rainbow-delimiters pyvenv polymode ox-pandoc ox-gfm org-sidebar org-msg org-mime org-bullets ob-julia-vterm ob-ipython multiple-cursors minions lsp-ui lsp-treemacs lsp-latex lsp-intellij latex-math-preview latex-extra julia-mode ivy-rich highlight-numbers helm-bibtex gruvbox-theme gnuplot git-gutter frame-local fortpy format-all forge flycheck fira-code-mode fiplr evil-nerd-commenter evil-mc evil-god-state evil-commentary evil-collection elfeed-score elfeed-org doom-themes doom-modeline dad-joke counsel company-math company-lsp company-bibtex company-auctex cdlatex bibretrieve ayu-theme auto-complete-c-headers auto-compile anaphora academic-phrases ac-math)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
