;; auctex
;; (load "auctex.el" nil t t)
;; (load "preview-latex.el" nil t t)
;; (setq TeX-auto-save t)
;; (setq TeX-parse-self t)
;; ;; pdf mode by default
;; (setq TeX-PDF-mode t)
;; ;; math mode
;; (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;; (setq-default TeX-master nil)
;; ;; I prefer to use open instead of a static one (I'm looking at you, evince)
;; (defun tex-view ()
;;   (interactive)
;;   (tex-send-command "open" (tex-append tex-print-file ".pdf")))
