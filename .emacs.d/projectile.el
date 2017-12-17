(use-package neotree
  :ensure t
  :bind ("C-c t" . neotree-toggle)
  :config
  (setq neo-theme (if window-system 'icons 'arrows)))

(use-package projectile
  :ensure t
  :init
  (setq projectile-completion-system 'helm)
  (setq projectile-switch-project-action 'neotree-projectile-action)
  (defun smart-switch-buffer ()
    "Call `counsel-projectile-switch-to-buffer` if `projectile-project-p`, otherwise
     fallback to `helm-mini`."
    (interactive)
    (helm-mini))
  :bind
  ("C-x b" . smart-switch-buffer)
  :config
  (projectile-global-mode)
  (use-package helm-projectile
    :ensure t
    :init
    )
  (use-package helm-ag
    :ensure t
    :init
    :config
    (setq helm-ag-fuzzy-match t)
    )
  (setq projectile-indexing-method 'native)
  ;; index when idle
  (setq projectile-enable-idle-timer t)
  (setq projectile-enable-caching t)
  (helm-projectile-on)
  )

(use-package projectile-rails
  :ensure t
  :init
  (projectile-rails-global-mode)
)
