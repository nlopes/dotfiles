(use-package company
  :ensure t
  :defer t
  :config
  (setq company-tooltip-limit 10)
  (setq company-show-numbers t)
  (setq company-idle-delay .0)
  (setq company-echo-delay 0)
  (setq company-minimum-prefix-length 1)
  (setq company-begin-commands '(self-insert-command))
  (setq company-tooltip-align-annotations t)
  (setq company-tooltip-flip-when-above t)
  (global-company-mode 1)
)

