(use-package neotree
  :ensure t
  :bind ("C-c t" . neotree-toggle))

(use-package projectile
  :ensure t
  :init
  (projectile-global-mode)
  :config
  (setq projectile-completion-system 'helm)
  (use-package helm-projectile
    :ensure t
    :init
    )
  (setq projectile-indexing-method 'native)
  ;; index when idle
  (setq projectile-enable-idle-timer t)
  (setq projectile-enable-caching t)
  (helm-projectile-on)
  )
