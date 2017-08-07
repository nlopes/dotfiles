(use-package rust-mode
  :ensure t
  :defer t
  :init
  (require 'rust-mode)
  (global-company-mode)
  (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

  :config
  (use-package company-racer)
  (use-package flycheck-rust)
  (use-package racer
    :ensure t
    :defer t
    :init
    (setq racer-rust-src-path (concat (getenv "HOME")
                                      "/Repos/External/rustc-1.5.0/src/"))
    (setq racer-cmd (concat (getenv "HOME")
                            "/Repos/External/racer/target/release/racer"))
    :config
    (define-key rust-mode-map (kbd "M-\"") #'racer-find-definition)
    (add-hook 'racer-mode-hook #'eldoc-mode)
    (add-hook 'racer-mode-hook #'company-mode)
    (local-set-key (kbd "TAB") #'company-indent-or-complete-common)
    (setq company-tooltip-align-annotations t)
    )
  (defun my-rust-mode-hook()
    (set (make-local-variable 'compile-command "cargo run"))
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
    ;;(set (make-local-variable 'company-backends) '(company-racer))
    ;;(local-set-key (kbd "TAB") #'racer-complete-or-indent)
    )
  (add-hook 'rust-mode-hook 'my-rust-mode-hook)
  (add-hook 'rust-mode-hook #'racer-mode)
  )
