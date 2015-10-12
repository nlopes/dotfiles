(use-package rust-mode
  :ensure t
  :defer t
  :init
  (require 'rust-mode)
  (global-company-mode)
  (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
  :config
  (defun my-rust-mode-hook()
    (setq compile-command "cargo run")
    )
  (use-package company-racer)
  (use-package flycheck-rust)
  (use-package racer
    :ensure t
    :defer t
    :init
    (setq racer-rust-src-path (concat (getenv "HOME")
                                      "/Repos/External/rustc-1.3.0/src/"))
    (setq racer-cmd (concat (getenv "HOME")
                            "/Repos/External/racer/target/release/racer"))
    :config
    (define-key rust-mode-map (kbd "M-\"") #'racer-find-definition)
    )
  (add-hook 'rust-mode-hook 'my-rust-mode-hook)
  :bind (("C-c C-c" . compile))
  )
