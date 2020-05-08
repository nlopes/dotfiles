(use-package monokai-theme
  :ensure t
  :config
  (load-theme 'monokai t)
)

(use-package which-key
  :ensure t
  :config
  (which-key-mode)
)

(use-package treemacs
  :ensure t
  :config
  (use-package treemacs-projectile
    :after projectile
    :ensure t)
  (use-package treemacs-icons-dired
    :after dired
    :ensure t
    :config (treemacs-icons-dired-mode))
  (use-package treemacs-magit
    :after magit
    :ensure t)
)

(use-package smart-mode-line
  :ensure t
  :config
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'respectful)
  (sml/setup)
)

(use-package hl-todo
  :ensure t
  :config
  (global-hl-todo-mode 1)
)

;; Change cursor style
(add-to-list 'default-frame-alist '(cursor-type . bar))
;; vertical border
(let ((display-table (or standard-display-table (make-display-table))))
  (set-display-table-slot display-table 'vertical-border (make-glyph-code ?│)) ; or ┃ │
  (setq standard-display-table display-table))
;;(set-face-background 'vertical-border "#0e0f1b")
(set-face-foreground 'vertical-border (face-background 'vertical-border))

