(use-package guru-mode
  :ensure t
  :init
  (guru-global-mode +1)
  :config
  (add-hook 'prog-mode-hook 'guru-mode)
)
