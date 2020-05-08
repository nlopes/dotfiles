(use-package lsp-mode
  :after which-key
  :commands lsp lsp-deferred
  :ensure t
  :diminish lsp-mode
  :init
  (add-to-list 'exec-path (expand-file-name "~/Repos/External/elixir-ls/release"))
  :config
  (setq lsp-enable-file-watchers nil)
  (setq lsp-prefer-flymake nil)
  :hook
  (lsp-mode . lsp-enable-which-key-integration)
  (elixir-mode . lsp-deferred)
  (rust-mode . lsp-deferred)
)

;; Outside of lsp-mode config to ensure it's changed
(setq lsp-rust-server 'rust-analyzer)

(use-package company-lsp
  :ensure t)

(use-package lsp-ui
  :after (lsp-mode company)
  :ensure t
  :commands lsp-ui-mode
  :config
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  (define-key lsp-ui-mode-map (kbd "C-c C-l .") 'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map (kbd "C-c C-l ?") 'lsp-ui-peek-find-references)
  (define-key lsp-ui-mode-map (kbd "C-c C-l r") 'lsp-rename)
  (define-key lsp-ui-mode-map (kbd "C-c C-l x") 'lsp-restart-workspace)
  (define-key lsp-ui-mode-map (kbd "C-c C-l w") 'lsp-ui-peek-find-workspace-symbol)
  (define-key lsp-ui-mode-map (kbd "C-c C-l i") 'lsp-ui-peek-find-implementation)
  (define-key lsp-ui-mode-map (kbd "C-c C-l d") 'lsp-describe-thing-at-point)
  (define-key lsp-ui-mode-map (kbd "C-c C-l e") 'lsp-execute-code-action)
  (define-key lsp-ui-mode-map (kbd "C-c C-l m") 'lsp-ui-imenu)

  (setq lsp-ui-doc-max-height 13
    lsp-ui-doc-enable t
    lsp-ui-doc-max-width 80
    lsp-ui-doc-header t
    lsp-ui-doc-include-signature t
    lsp-ui-doc-position 'bottom
    lsp-ui-doc-use-webkit nil
    lsp-ui-peek-enable t
    lsp-ui-peek-always-show t
    lsp-ui-flycheck-enable t
    lsp-ui-flycheck-list-position 'right
    lsp-ui-flycheck-live-reporting t
    lsp-ui-imenu-kind-position 'left
    lsp-ui-sideline-enable t
    lsp-ui-sideline-ignore-duplicate t
    lsp-ui-sideline-code-actions-prefix "💡"
    ;; fix for completing candidates not showing after “Enum.”:
    company-lsp-match-candidate-predicate #'company-lsp-match-candidate-prefix
  )
)
