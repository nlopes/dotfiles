(use-package go-projectile
  :ensure t
  :init)

(use-package go-mode
  :ensure t
  :init
  :config

  (defun my-go-mode-hook ()
    ;; code.google.com/p/go.tools/cmd/goimports
    (setq gofmt-command "goimports")
    ;; call gofmt before saving
    (add-hook 'before-save-hook 'gofmt-before-save)
    ;; Customize compile command to run go build
    (if (not (string-match "go" compile-command))
        (set (make-local-variable 'compile-command)
             "go build -v && go vet && go test -short -coverprofile cover.out && go tool cover -func cover.out"))
    (local-set-key (kbd "C-c C-c") 'compile)
    (local-set-key (kbd "C-c C-g") 'go-goto-imports)
    (local-set-key (kbd "C-c C-k") 'godoc)
    ;; github.com/kisielk/errcheck
    (local-set-key (kbd "C-c C-e") 'go-errcheck)
    (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
    ;; Godef jump key binding
    ;; code.google.com/p/rog-go/exp/cmd/godef
    (local-set-key (kbd "M-\"") 'godef-jump)
    ;; use company-go in go-mode
    (set (make-local-variable 'company-backends) '(company-go))
    (company-mode))

  ;; set helm-dash documentation
  (defun go-doc ()
    (interactive)
    (setq-local helm-dash-docsets '("Go")))

  (add-hook 'go-mode-hook 'company-mode)
  (add-hook 'go-mode-hook 'go-eldoc-setup)
  (add-hook 'go-mode-hook 'highlight-word-hook)
  (load "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")
  (add-to-list 'load-path (concat (getenv "GOPATH")
                                  "/src/github.com/golang/lint/misc/emacs"))
  (require 'golint)
  (add-hook 'go-mode-hook 'go-oracle-mode)
  (add-hook 'go-mode-hook 'my-go-mode-hook)
  (add-hook 'go-mode-hook 'go-doc)
  )

(eval-after-load 'go-mode
  '(substitute-key-definition 'go-import-add 'helm-go-package go-mode-map))
