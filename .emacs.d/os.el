(use-package exec-path-from-shell
  :ensure t
  :custom
  (exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-variables '("PATH"))
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(when (equal system-type 'darwin)
  (setq mac-option-modifier 'super)
  (setq mac-command-modifier 'meta)
  (setq ns-auto-hide-menu-bar t)
  (setq ns-use-proxy-icon nil)
  (setq initial-frame-alist
     (append
      '((ns-transparent-titlebar . t)
        (ns-appearance . dark)
        (vertical-scroll-bars . nil)
        (internal-border-width . 0)))))
;; pbcopy
(use-package pbcopy
  :ensure t
  :if (eq system-type 'darwin)
  :hook (dashboard-mode . (turn-on-pbcopy)))
