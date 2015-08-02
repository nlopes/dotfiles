(use-package rust-mode
  :ensure t
  :defer t
  :init
  (require 'rust-mode)
  (global-company-mode)
  (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
  :config
  (setq compile-command "cargo run")
  (use-package company-racer)
  (use-package flycheck-rust)
  (use-package racer)
  :bind (("C-c C-c" . compile))
  )

(use-package racer
  :ensure t
  :defer t
  :init
  (setq racer-rust-src-path "/Users/nlopes/Repos/External/rustc-1.1.0/src/")
  (setq racer-cmd "/Users/nlopes/Repos/External/racer/target/release/racer")
  :config
  (define-key rust-mode-map (kbd "M-\"") #'racer-find-definition)
  )
