(use-package elixir-mode
  :defer t
  :ensure t
  :bind (:map elixir-mode-map
              ("C-c C-t" . my/mix-run-test-at-point)
              ("C-c C-S-t" . my/mix-run-test-at-point))
  :config
  (add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))
  (use-package exunit
    :ensure t)
)

;; taken from https://erick.navarro.io/blog/minimal-setup-for-elixir-development-in-emacs/
(defun my/mix-run-test (&optional at-point)
    "If AT-POINT is true it will pass the line number to mix test."
    (interactive)
    (let* ((current-file (replace-regexp-in-string "\\(.*\\)/apps/\\(.*\\)/test/\\(.*\\)" "test/\\3" (buffer-file-name)))
           (current-line (line-number-at-pos))
           (mix-file (concat (projectile-project-root) "mix.exs"))
           (default-directory (file-name-directory mix-file))
           (mix-env (concat "MIX_ENV=test ")))

      (if at-point
          (compile (format "%s mix test %s:%s" mix-env current-file current-line))
        (compile (format "%s mix test %s" mix-env current-file)))))

  (defun my/mix-run-test-file ()
    "Run mix test over the current file."
    (interactive)
    (my/mix-run-test nil))

  (defun my/mix-run-test-at-point ()
    "Run mix test at point."
    (interactive)
    (my/mix-run-test t))

