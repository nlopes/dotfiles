(require 'go-mode)
(require 'go-projectile)
(load "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")

(defun my-go-mode-hook ()
  ; code.google.com/p/go.tools/cmd/goimports
  (setq gofmt-command "goimports")
  ; call gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  (local-set-key (kbd "C-c C-c") 'compile)
  (local-set-key (kbd "C-c C-g") 'go-goto-imports)
  ; github.com/kisielk/errcheck
  (local-set-key (kbd "C-c C-e") 'go-errcheck)
  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
  ; Godef jump key binding
  ; code.google.com/p/rog-go/exp/cmd/godef
  (local-set-key (kbd "M-\"") 'godef-jump)
  ; use company-go in go-mode
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode))
(add-hook 'go-mode-hook 'my-go-mode-hook)
(add-hook 'go-mode-hook 'go-eldoc-setup)
(add-hook 'go-mode-hook 'highlight-word-hook)
(add-hook 'go-mode-hook 'go-oracle-mode)
