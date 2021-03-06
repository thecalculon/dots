(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(setq TeX-PDF-mode t)

;; Automatically activate folding mode in auctex, use C-c C-o C-b to fold.
(add-hook 'TeX-mode-hook
      (lambda () (TeX-fold-mode 1))); Automatically activate TeX-fold-mode.

;; Load german inspell if babel is german
;(add-hook 'TeX-language-de-hook
;      (lambda () (ispell-change-dictionary "german")))

(provide 'my_auctex)
