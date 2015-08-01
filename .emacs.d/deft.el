(use-package deft
  :ensure t
  :init
  :config
  (setq deft-extensions '("txt" "tex" "org"))
  (setq deft-directory "~/Documents/notes/")
  (setq deft-recursive t)
  (setq deft-use-filename-as-title t)
  :bind ("C-c d" . deft))
