(use-package virtualenvwrapper
  :ensure t
  :init
  (venv-initialize-interactive-shells) ;; if you want interactive shell support
  (venv-initialize-eshell) ;; if you want eshell support
  (setq venv-location "~/python_environments")
  (setq virtualvenv-root "~/python_environments")
  )

(defun my-py-mode-hook ()
  (set (make-local-variable 'company-backends) '(company-anaconda))
  (company-mode))

(add-hook 'python-mode-hook 'my-py-mode-hook)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'eldoc-mode)
(add-hook 'python-mode-hook 'highlight-word-hook)
