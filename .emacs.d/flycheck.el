(use-package flycheck
  :ensure t
  :init
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

(use-package flycheck-rust
  :after rust-mode
  :ensure t
  :defer t
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
  )
