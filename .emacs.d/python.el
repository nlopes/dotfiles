(if (eq system-type 'darwin)
    (setq python-shell-interpreter "/usr/local/bin/python")
)

(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
(setq venv-location "~/Projects/Environments")
(setq virtualvenv-root "~/Projects/Environments")

(defun my-py-mode-hook ()
  (set (make-local-variable 'company-backends) '(company-anaconda))
  (company-mode))

(add-hook 'python-mode-hook 'my-py-mode-hook)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'eldoc-mode)
(add-hook 'python-mode-hook 'highlight-word-hook)
