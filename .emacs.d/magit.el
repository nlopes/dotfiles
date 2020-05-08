(use-package git-gutter
    :ensure t
    :config
    (global-git-gutter-mode +1)
    :custom
    (git-gutter:modified-sign "~")
    :custom-face
    (git-gutter:modified ((t (:foreground "#f1fa8c" :background "#f1fa8c"))))
)

(use-package magit-filenotify
  :ensure t)

(use-package magit
  :ensure t
  :init
  (custom-add-option 'magit-status-mode-hook #'magit-filenotify-mode)
  :bind ("C-c m" . magit-status)
  )
