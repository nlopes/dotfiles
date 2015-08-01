(use-package helm
  :ensure t
  :init
  (require 'helm-config)
  (helm-mode 1)
  (helm-autoresize-mode 1)
  :config
  (setq helm-display-header-line nil)
  (set-face-attribute 'helm-source-header nil :height 0.1)
  (setq helm-split-window-in-side-p t)
  :bind (("C-c h" . helm-mini)
         ("M-x" . helm-M-x)))

(use-package helm-ag
  :ensure t)
(use-package helm-dash
  :ensure t)
(use-package helm-go-package
  :ensure t)
(use-package helm-pydoc
  :ensure t)
