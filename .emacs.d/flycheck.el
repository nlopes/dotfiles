(use-package flycheck
  :ensure t
  :init
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

(use-package flycheck-rust
  :ensure t
  :defer t
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
  )
