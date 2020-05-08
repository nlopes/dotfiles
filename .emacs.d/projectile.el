(use-package projectile
  :ensure t
  :init
  (projectile-global-mode)
  (setq projectile-completion-system 'helm)
  ;;(setq projectile-switch-project-action 'treemacs-projectile-action)
  (defun smart-switch-buffer ()
    "Call `counsel-projectile-switch-to-buffer` if `projectile-project-p`, otherwise
     fallback to `helm-mini`."
    (interactive)
    (helm-mini))
  :bind
  ("C-x b" . smart-switch-buffer)
  ("C-c p" . projectile-command-map)
  :config
  (setq projectile-globally-ignored-directories (append projectile-globally-ignored-directories '("target/" ".elixir_ls/")))
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
