;; remove annoying message
(setq inhibit-startup-message t)

;; disable toolbar
(tool-bar-mode -1)

;; favorite colors (sue me)
(set-background-color "wheat")
(set-foreground-color "black")
(set-cursor-color "black")

;;highlight my fonts
(global-font-lock-mode t)

;; match parenthesis (I like it)
(show-paren-mode t)

;; highlight the region when marking is active
(transient-mark-mode 't)

;; I like to have the column number
(setq column-number-mode 't)

;; y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; wrap at 80
(set-default 'fill-column 80)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default py-indent-offset 4)
(c-set-offset 'innamespace 0)

;; have all files in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/file-backups")))

;; remove trailing whitespace
;; got it from: http://how-i-work.com/workbenches/30-working-with-os-x-and-emacs
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))
(setq truncate-lines t)
(setq truncate-partial-width-windows nil)

;; I want to break the lines automatically in text mode
(add-hook 'text-mode-hook (lambda() (auto-fill-mode)))

(setq c-mode-hook (function (lambda ()
                              (setq indent-tabs-mode nil)
                              (setq c-indent-level 4))))
(setq c++-mode-hook (function (lambda ()
                                (setq indent-tabs-mode nil)
                                (setq c-indent-level 4))))
(setq objc-mode-hook (function (lambda ()
                                 (setq indent-tabs-mode nil)
                                 (setq c-indent-level 4))))

;; Python
;; enable electric pairs
;; got it from: http://jesselegg.com/archives/2010/02/25/emacs-python-programmers-part-1
(add-hook 'python-mode-hook
          (lambda ()
            (define-key python-mode-map "\"" 'electric-pair)
            (define-key python-mode-map "\'" 'electric-pair)
            (define-key python-mode-map "(" 'electric-pair)
            (define-key python-mode-map "[" 'electric-pair)
            (define-key python-mode-map "{" 'electric-pair)))

(defun electric-pair ()
  "Insert character pair without surrounding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))

;; Javascript
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(global-set-key (kbd "M-/") 'hippie-expand)

;; auctex
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
;; pdf mode by default
(setq TeX-PDF-mode t)
;; math mode
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(setq-default TeX-master nil)
;; I prefer to use open instead of a static one (I'm looking at you, evince)
(defun tex-view ()
  (interactive)
  (tex-send-command "open" (tex-append tex-print-file ".pdf")))

;; load path with my modules
(add-to-list 'load-path "~/.emacs.d/my-modules")

;; apache mode
(autoload 'apache-mode "apache-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.htaccess\\'"   . apache-mode))
(add-to-list 'auto-mode-alist '("httpd\\.conf\\'"  . apache-mode))
(add-to-list 'auto-mode-alist '("srm\\.conf\\'"    . apache-mode))
(add-to-list 'auto-mode-alist '("access\\.conf\\'" . apache-mode))
(add-to-list 'auto-mode-alist '("sites-\\(available\\|enabled\\)/" . apache-mode))

;; default font
(set-face-attribute 'default nil
		    :family "Anonymous Pro"
		    :height 120)
(set-face-attribute 'font-lock-comment-face nil
		    :family "Anonymous Pro"
		    :height 120
		    :slant 'italic
		    :background "#ddddee"
		    :foreground "#000000")

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
)
(custom-set-faces
 ;; stuff should go here
 )
