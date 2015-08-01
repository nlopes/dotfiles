(use-package neotree
  :ensure t
  :bind ("C-c t" . neotree-toggle))

(use-package projectile
  :ensure t
  :init
  (projectile-global-mode)
  :config
  (setq projectile-indexing-method 'native)
  (setq projectile-enable-caching t))
