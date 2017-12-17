(use-package doom-themes
  :ensure t
  :init
  (load-theme 'doom-one t)
  :config
  (doom-themes-neotree-config)

  (setq
      doom-themes-enable-bold t
      doom-themes-enable-italic t
      doom-one-brighter-comments t
      doom-neotree-file-icons t))
