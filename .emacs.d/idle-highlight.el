(use-package idle-highlight-mode
  :ensure t
  :init
  (defun highlight-word-hook ()
    (idle-highlight-mode t))
  )
