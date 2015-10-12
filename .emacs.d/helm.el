(use-package helm-config
  :config
  (progn
    (helm-mode 1)
    (helm-adaptive-mode 1)
    (helm-push-mark-mode 1)))

(use-package helm
  :ensure t
  :defer t
  :bind (("C-c h" . helm-mini)
         ("M-x" . helm-M-x)
         ("M-y" . helm-show-kill-ring)
         ("C-c f" . helm-recentf)
         ("C-x C-f" . helm-find-files)
         ("C-c <SPC>" . helm-all-mark-rings)
         ("C-s" . helm-occur)
         ("C-h C-f" . helm-apropos)
         ("C-c w" . helm-man-woman)
         ("M-g a" . helm-do-grep-ag)
         )
  :config
  (setq helm-display-header-line nil)
  (set-face-attribute 'helm-source-header nil :height 0.1)
  (setq helm-split-window-in-side-p t)
  (require 'helm-config)
  (helm-mode 1)
  (helm-autoresize-mode 1)
)

(use-package helm-ag
  :ensure t)
;;(use-package helm-dash
;;  :ensure t)
(use-package helm-go-package
  :ensure t)
(use-package helm-pydoc
  :ensure t)
