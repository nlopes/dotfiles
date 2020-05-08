;; required for dap-mode and dap-ui-mode
(use-package posframe
  :ensure t)

(use-package dap-mode
  :after (lsp-mode)
  :ensure t
  :config
  (require 'dap-elixir)
  (require 'dap-hydra)

  (dap-mode 1)
  (dap-ui-mode 1)
  ;; enables mouse hover support
  (dap-tooltip-mode 1)
  ;; use tooltips for mouse hover
  ;; if it is not enabled `dap-mode' will use the minibuffer.
  (tooltip-mode 1)
  ;; displays floating panel with debug buttons
  ;; requies emacs 26+
  (dap-ui-controls-mode 1)
)

