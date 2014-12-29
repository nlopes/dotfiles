(require 'go-mode)
(add-hook 'before-save-hook 'gofmt-before-save)
(defun my-go-mode-hook ()
  ; call gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  (local-set-key (kbd "C-c C-c") 'compile)
  (local-set-key (kbd "C-c C-g") 'go-goto-imports)
  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
  ; Godef jump key binding
  (local-set-key (kbd "M-\"") 'godef-jump)
  ; use company-go in go-mode
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode))
(add-hook 'go-mode-hook 'my-go-mode-hook)
(add-hook 'go-mode-hook 'go-eldoc-setup)
(add-hook 'go-mode-hook 'highlight-word-hook)
