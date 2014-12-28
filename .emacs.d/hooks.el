(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; remove trailing whitespace
;; got it from: http://how-i-work.com/workbenches/30-working-with-os-x-and-emacs
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))
