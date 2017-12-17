(use-package go-projectile
  :ensure t
  :init)

(use-package go-mode
  :ensure t
  :init
  :config
  (use-package go-errcheck
    :ensure t
    )
  (defun my-go-mode-hook ()
    ;; golang.org/x/tools/cmd/goimports
    (setq gofmt-command "goimports")
    ;; call gofmt before saving
    (add-hook 'before-save-hook 'gofmt-before-save)
    (add-to-list 'exec-path "~/Repos/go/bin")
    ;; Customize compile command to run go build
    (if (not (string-match "go" compile-command))
        (set (make-local-variable 'compile-command)
             "go build -v && go vet"))
    ;; This proved to be too slow in big projects:
    ;; && go test -short -coverprofile cover.out && go tool cover -func cover.out

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
    (company-mode)

    (setenv "GOROOT" (shell-command-to-string ". /etc/zshrc; echo -n $GOROOT"))
    (setenv "GOPATH" (shell-command-to-string ". /etc/zshrc; echo -n $GOPATH")))

  ;; Ensure all linting passes, then use 'go build' to compile, then test/vet
  (defun setup-go-mode-compile ()
    (if (not (string-match "go" compile-command))
        (set (make-local-variable 'compile-command)
             "gometalinter.v1 --deadline 10s && go build -v && go test -v && go vet")))

    ;; set helm-dash documentation
  (defun go-doc ()
    (interactive)
    (setq-local helm-dash-docsets '("Go")))

  (add-hook 'go-mode-hook 'company-mode)
  (add-hook 'go-mode-hook 'go-eldoc-setup)
  (add-hook 'go-mode-hook 'highlight-word-hook)
  (add-to-list 'load-path (concat (getenv "GOPATH")
                                  "/src/github.com/golang/lint/misc/emacs"))
  (require 'golint)
  (add-hook 'go-mode-hook 'my-go-mode-hook)
  (add-hook 'go-mode-hook 'go-doc)
  (add-hook 'go-mode-hook 'setup-go-mode-compile)

  (require 'go-guru)
  (add-hook 'go-mode-hook #'go-guru-hl-identifier-mode)
  )

(eval-after-load 'go-mode
  '(substitute-key-definition 'go-import-add 'helm-go-package go-mode-map))

;; Completion integration
(use-package company-go
  :ensure t
  :after go
  :config
  (setq tab-width 4)

  :bind (:map go-mode-map
              ("M-." . godef-jump)))

;; ElDoc integration
(use-package go-eldoc
  :ensure t
  :config
  (add-hook 'go-mode-hook 'go-eldoc-setup))

;; Linting
(use-package flycheck-gometalinter
  :ensure t
  :config
  (progn
    (flycheck-gometalinter-setup))
    ;; skip linting for vendor dirs
    (setq flycheck-gometalinter-vendor t)
    ;; use in test files
    (setq flycheck-gometalinter-test t)
    ;; only use fast linters
    (setq flycheck-gometalinter-fast t)
    ;; explicitly disable 'gotype' linter
    (setq flycheck-gometalinter-disable-linters '("gotype")))
