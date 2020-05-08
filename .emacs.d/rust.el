(use-package rust-mode
  :ensure t
  :defer t
  :init
  (global-company-mode)
  ;;:hook
  ;;(rust-mode lambda () (setq indent-tabs-mode nil))
  :config
  (setq rust-format-on-save t)
  :bind
  (("C-c C-c" . rust-compile)
   ("C-c C-t" . rust-test)
   ("C-c C-r" . rust-run)
  )
)
